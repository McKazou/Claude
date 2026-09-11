# Partager un skill avec son équipe via le dépôt git

**Symptôme / contexte** : j'ai créé un skill utile et je veux que mes coéquipiers l'aient automatiquement, sans étape d'installation de leur côté.

**Quoi** : committer `.claude/skills/<nom>/SKILL.md` dans le dépôt du projet suffit — dès qu'un coéquipier clone (ou fait `git pull`) et lance Claude Code dans ce dépôt, le skill apparaît et est utilisable, sans configuration supplémentaire.

**Comment** :
- Créer `.claude/skills/<nom>/SKILL.md` à la racine du repo (en monorepo, Claude Code remonte aussi les répertoires parents jusqu'à la racine git, donc un sous-dossier fonctionne).
- Committer le dossier normalement, comme n'importe quel fichier versionné — fichiers annexes (scripts, références) inclus automatiquement s'ils sont dans le même dossier.
- Aucune entrée dans `settings.json` n'est nécessaire pour que ça fonctionne par défaut.
- Pour distribuer au-delà d'un seul dépôt (plusieurs équipes/repos), packager en plugin et le publier sur une marketplace privée plutôt que de dupliquer le dossier dans chaque repo.

**Pourquoi** : le partage suit le flux git normal (clone/pull) — pas de canal de distribution séparé à maintenir pour une équipe qui travaille déjà sur le même dépôt.

**Limites** : ne couvre que les personnes qui travaillent sur ce dépôt précis. Pour plusieurs dépôts indépendants, voir la fiche sur la réutilisation entre projets plutôt que de copier ce dossier partout.

---
Tags : #claude-code #skills
Dernière vérification : septembre 2026
