# Synchronisation automatique entre ce hub et les projets

**Symptôme / contexte** : une fiche/skill est créée ou modifiée dans ce repo, ou à l'inverse un skill naît directement dans un autre projet pendant une session — sans automatisation, rien ne garantit que ce dépôt reste la source unique et à jour.

**Quoi** : ce repo (`Skills/` + `Fiches/`) est la source de vérité. Deux sens de synchronisation à déclencher automatiquement avec `Scripts/Sync-Skills.ps1`, sans attendre une demande explicite de l'utilisateur à chaque fois.

**Comment** :
- **Push (hub → projets)** : après avoir créé ou modifié une fiche/skill ici, lire `$env:LOCALAPPDATA\ClaudeSkillsSync\projects.json` pour connaître les projets déjà synchronisés, évaluer pour chacun si le sujet du skill est pertinent (indices concrets : fichiers présents dans le projet, sujet déjà traité dans son `CLAUDE.md`/`PLAN.md` — pas une pertinence supposée), puis lancer `Sync-Skills.ps1 -ProjectPath <chemin> -Skill <nom>` pour les projets concernés.
- **Pull (projet → hub)** : dans tous les cas, dès qu'un skill est créé ou modifié directement dans le `.claude/skills/` d'un autre projet (pas depuis ce hub), le ramener ici — copier son dossier dans `Skills/<nom>/`, produire/compléter la fiche correspondante dans `Fiches/` (voir [convertir-une-fiche-en-skill.md](convertir-une-fiche-en-skill.md), à l'envers), et l'ajouter au `SOMMAIRE.md`.
- Avant de ramener un skill créé dans un projet d'entreprise, appliquer [separer-info-entreprise-vs-personnel.md](separer-info-entreprise-vs-personnel.md) : ne rapatrier que la méthode généralisable, jamais une information propriétaire.
- Annoncer les deux sens de synchro à l'utilisateur au moment où ils se produisent (quels fichiers, quel projet) plutôt que de les faire silencieusement.

**Pourquoi** : ce dépôt ne vaut que s'il reste la seule version à jour — sans automatisation, chaque skill créé « sur le terrain » dans un projet reste isolé, et chaque amélioration du hub reste invisible aux projets déjà synchronisés.

**Limites** : la pertinence d'un projet pour un push ne se détecte pas de façon fiable — en cas de doute, demander confirmation avant d'écrire effectivement dans le projet cible plutôt que de synchroniser vers tous les projets connus par défaut.

---
Tags : #claude-code #skills #methode
Dernière vérification : septembre 2026
