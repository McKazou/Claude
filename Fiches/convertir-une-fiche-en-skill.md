# Convertir une fiche en Skill Claude Code

**Symptôme / contexte** : une fiche décrit une procédure que je voudrais voir Claude Code appliquer automatiquement pendant une session, pas seulement relire moi-même au bon moment.

**Quoi** : dériver de la fiche un fichier `SKILL.md` séparé, placé là où Claude Code peut le charger — la fiche reste la référence lisible par un humain et indexée au sommaire, le Skill est l'artefact que Claude charge à l'exécution.

**Comment** :
- Créer `Skills/<nom-kebab-case>/SKILL.md` (jamais un fichier plat — Claude Code n'observe que la structure dossier/`SKILL.md`), avec un frontmatter YAML `name` + `description` : 3e personne, dit CE QUE fait le skill ET QUAND l'utiliser, avec des mots-clés concrets — c'est le seul texte qui reste en permanence en contexte, il doit suffire à décider de déclencher le skill.
- Reprendre le corps de la fiche (Symptôme/Quoi/Comment/Pourquoi/Limites) sous le frontmatter — ce format reste lisible tel quel comme instructions pour Claude, à condition que le "Comment" soit déjà rédigé en étapes impératives (pas en explication narrative).
- Si le contenu source dépasse la taille raisonnable d'un `SKILL.md` (ex. un workflow détaillé en plusieurs étapes avec exemples), garder le corps court et déporter le détail (exemples, justifications longues) dans un fichier annexe du même dossier, chargé seulement au besoin (progressive disclosure).
- Ajouter un lien croisé dans les deux fichiers : footer de la fiche → `Skill : Skills/<nom>/SKILL.md`, et dans le Skill → `Source : Fiches/<nom>.md`.
- Copier le dossier `Skills/<nom>/` vers `~/.claude/skills/<nom>/` pour qu'il soit actif dans les projets locaux (skill personnel, pas propre à un seul dépôt).

**Pourquoi** : une fiche et un Skill n'ont pas le même public (humain qui parcourt le sommaire vs Claude qui charge une procédure à l'exécution) ni la même contrainte de placement (fichier libre dans `Fiches/` vs dossier obligatoire `.claude/skills/<nom>/`) — les garder séparés évite de casser le système de sommaire existant tout en rendant la procédure exploitable automatiquement.

**Limites** : dès que la fiche source change (règle modifiée, limite ajoutée, correction), le Skill doit être mis à jour dans la même session — jamais reporté à plus tard. Pareil dans l'autre sens : un correctif fait sur le Skill après un déclenchement raté doit être reporté dans la fiche source. Une paire désynchronisée est pire qu'une fiche seule : elle fait dire à Claude Code une règle différente de celle documentée dans la base. Le lien croisé entre les deux fichiers sert de rappel — avant de committer une modif sur l'un, ouvrir l'autre et vérifier s'il a besoin du même changement. Pour les règles de rédaction du contenu du Skill lui-même (déclenchement, granularité), voir [bonnes-pratiques-rediger-skill.md](bonnes-pratiques-rediger-skill.md) ; pour savoir où placer le fichier et comment il est chargé, voir [utiliser-un-skill-claude-code.md](utiliser-un-skill-claude-code.md).

---
Tags : #claude-code #skills #methode
Dernière vérification : septembre 2026
