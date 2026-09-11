<#
.SYNOPSIS
    Copie/synchronise des Skills Claude Code depuis ce repo vers un projet cible.

.DESCRIPTION
    Source de vérité : le dossier Skills\ de ce repo (chaque sous-dossier = un skill,
    avec son SKILL.md et ses fichiers annexes).

    Pour chaque skill sélectionné, le script fait un MIROIR (robocopy /MIR) du dossier
    source vers <ProjectPath>\.claude\skills\<nom-du-skill> :
      - skill absent côté projet  -> copié intégralement (NOUVEAU)
      - skill présent mais différent -> fichiers ajoutés/modifiés copiés, fichiers
        supprimés côté source retirés côté projet (MIS A JOUR)
      - skill présent et identique -> rien à faire (A JOUR)

    Le script ne touche jamais aux skills non sélectionnés déjà présents dans le projet.

.PARAMETER ProjectPath
    Dossier racine du projet cible (doit déjà exister). Les skills sont écrits dans
    <ProjectPath>\.claude\skills\.

.PARAMETER Skill
    Nom(s) de skill(s) à synchroniser (nom du sous-dossier dans Skills\). Répétable
    ou liste séparée par des virgules. Ignoré si -All est utilisé.

.PARAMETER All
    Synchronise tous les skills disponibles dans le repo source.

.PARAMETER List
    Affiche la liste des skills disponibles (nom + description) et quitte, sans rien copier.

.NOTES
    Si ni -All ni -Skill ne sont fournis, le script bascule en sélection interactive :
    il affiche la liste des skills numérotée, puis demande soit des numéros séparés
    par des virgules (ex: 1,3,4), soit 'tous' pour tout sélectionner.

.PARAMETER SourcePath
    Dossier source contenant les skills (sous-dossiers avec SKILL.md). Par défaut :
    le dossier Skills\ de ce repo (calculé depuis l'emplacement du script).

.EXAMPLE
    .\Sync-Skills.ps1 -List

.EXAMPLE
    .\Sync-Skills.ps1 -ProjectPath "D:\Projets\MonApp" -Skill workflow-cdcf, passer-en-mode-plan

.EXAMPLE
    .\Sync-Skills.ps1 -ProjectPath "D:\Projets\MonApp" -All

.EXAMPLE
    .\Sync-Skills.ps1 -ProjectPath "D:\Projets\MonApp" -All -WhatIf
    Simule la synchronisation (aucune copie réelle) et montre ce qui changerait.
#>
[CmdletBinding(SupportsShouldProcess = $true, DefaultParameterSetName = 'Sync')]
param(
    [Parameter(ParameterSetName = 'Sync', Mandatory = $true, Position = 0)]
    [ValidateScript({
        if (-not (Test-Path -LiteralPath $_ -PathType Container)) {
            throw "Le dossier projet n'existe pas : $_"
        }
        $true
    })]
    [string]$ProjectPath,

    [Parameter(ParameterSetName = 'Sync')]
    [string[]]$Skill,

    [Parameter(ParameterSetName = 'Sync')]
    [switch]$All,

    [Parameter(ParameterSetName = 'List', Mandatory = $true)]
    [switch]$List,

    [string]$SourcePath
)

$ErrorActionPreference = 'Stop'

# $PSScriptRoot n'est pas fiable dans une valeur par defaut de parametre pour un
# script [CmdletBinding()] execute via -File (particularite de PowerShell 5.1) :
# on le calcule donc ici, dans le corps du script.
if (-not $SourcePath) {
    $SourcePath = Join-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -ChildPath 'Skills'
}

function Get-AvailableSkills {
    param([string]$Root)

    if (-not (Test-Path -LiteralPath $Root -PathType Container)) {
        throw "Dossier source introuvable : $Root"
    }

    Get-ChildItem -LiteralPath $Root -Directory | ForEach-Object {
        $skillFile = Join-Path $_.FullName 'SKILL.md'
        if (Test-Path -LiteralPath $skillFile) {
            $description = ''
            $content = Get-Content -LiteralPath $skillFile -Raw -Encoding UTF8
            if ($content -match '(?ms)^---\s*.*?^description:\s*(.+?)\s*$.*?^---') {
                $description = $Matches[1]
            }
            [pscustomobject]@{
                Name        = $_.Name
                Path        = $_.FullName
                Description = $description
            }
        }
    }
}

function Format-SkillList {
    param(
        [array]$Skills,
        [switch]$Numbered
    )

    $rows = for ($i = 0; $i -lt $Skills.Count; $i++) {
        $desc = $Skills[$i].Description
        if ($desc.Length -gt 80) { $desc = $desc.Substring(0, 77) + '...' }
        [pscustomobject]@{
            '#'         = $i + 1
            Name        = $Skills[$i].Name
            Description = $desc
        }
    }

    if ($Numbered) {
        $rows | Format-Table '#', Name, Description -AutoSize -Wrap
    } else {
        $rows | Format-Table Name, Description -AutoSize -Wrap
    }
}

function Sync-OneSkill {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string]$SourceDir,
        [string]$DestDir,
        [string]$Name
    )

    $isNew = -not (Test-Path -LiteralPath $DestDir -PathType Container)

    if (-not $PSCmdlet.ShouldProcess($DestDir, "Synchroniser depuis $SourceDir")) {
        return [pscustomobject]@{ Name = $Name; Status = 'SIMULATION'; Files = 0 }
    }

    if ($isNew) {
        New-Item -ItemType Directory -Path $DestDir -Force | Out-Null
    }

    $roboArgs = @($SourceDir, $DestDir, '/MIR', '/NFL', '/NDL', '/NJH')
    $output = & robocopy @roboArgs
    $exitCode = $LASTEXITCODE

    if ($exitCode -ge 8) {
        return [pscustomobject]@{ Name = $Name; Status = "ERREUR (code robocopy $exitCode)"; Files = 0 }
    }

    $copied = 0
    foreach ($line in $output) {
        if ($line -match '^\s*Fichiers\s*:\s*(\d+)\s+(\d+)' -or $line -match '^\s*Files\s*:\s*(\d+)\s+(\d+)') {
            $copied = [int]$Matches[2]
            break
        }
    }

    if ($isNew) {
        return [pscustomobject]@{ Name = $Name; Status = 'NOUVEAU'; Files = $copied }
    } elseif ($copied -gt 0) {
        return [pscustomobject]@{ Name = $Name; Status = 'MIS A JOUR'; Files = $copied }
    } else {
        return [pscustomobject]@{ Name = $Name; Status = 'A JOUR'; Files = 0 }
    }
}

# --- Point d'entree ---

$available = @(Get-AvailableSkills -Root $SourcePath | Sort-Object Name)

if ($available.Count -eq 0) {
    throw "Aucun skill trouve dans $SourcePath"
}

if ($List) {
    Write-Host "Skills disponibles dans $SourcePath :`n"
    Format-SkillList -Skills $available
    return
}

if ($All) {
    $selected = $available
} elseif ($Skill -and $Skill.Count -gt 0) {
    $selected = foreach ($name in $Skill) {
        $match = $available | Where-Object { $_.Name -eq $name }
        if (-not $match) {
            $suggestions = $available | Where-Object { $_.Name -like "*$name*" } | Select-Object -ExpandProperty Name
            $msg = "Skill introuvable : '$name'."
            if ($suggestions) { $msg += " Vouliez-vous dire : $($suggestions -join ', ') ?" }
            throw $msg
        }
        $match
    }
} else {
    # Ni -All ni -Skill : selection interactive par numero.
    Write-Host "Skills disponibles dans $SourcePath :`n"
    Format-SkillList -Skills $available -Numbered
    Write-Host ""
    $reponse = Read-Host "Skills a synchroniser : numeros separes par des virgules (ex: 1,3,4), ou 'tous'"

    if ($reponse.Trim() -match '^(tous|all|\*)$') {
        $selected = $available
    } else {
        $indices = $reponse -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
        if ($indices.Count -eq 0) {
            throw "Aucun numero saisi."
        }
        $selected = foreach ($idx in $indices) {
            $n = 0
            if (-not [int]::TryParse($idx, [ref]$n) -or $n -lt 1 -or $n -gt $available.Count) {
                throw "Numero invalide : '$idx'. Choisissez entre 1 et $($available.Count), ou 'tous'."
            }
            $available[$n - 1]
        }
    }
}

$destRoot = Join-Path $ProjectPath '.claude\skills'
if (-not (Test-Path -LiteralPath $destRoot)) {
    if ($PSCmdlet.ShouldProcess($destRoot, 'Creer le dossier')) {
        New-Item -ItemType Directory -Path $destRoot -Force | Out-Null
    }
}

Write-Host "Source : $SourcePath"
Write-Host "Cible  : $destRoot`n"

$results = foreach ($s in $selected) {
    $destDir = Join-Path $destRoot $s.Name
    Sync-OneSkill -SourceDir $s.Path -DestDir $destDir -Name $s.Name
}

$results | Format-Table -AutoSize

$errors = $results | Where-Object { $_.Status -like 'ERREUR*' }
if ($errors) {
    Write-Warning "$($errors.Count) skill(s) en erreur."
    exit 1
}

# Robocopy laisse un $LASTEXITCODE non nul (1, 2, 3...) meme en cas de succes
# (ce sont des codes informatifs, pas des erreurs) : on force un code de sortie
# explicite pour ne pas le laisser fuiter comme code de sortie du script.
exit 0
