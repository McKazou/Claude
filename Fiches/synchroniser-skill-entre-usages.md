# Garder un skill à jour entre ses différentes utilisations

**Symptôme / contexte** : j'ai modifié un skill quelque part et je ne sais pas si les autres usages (autre machine, coéquipiers, sessions cloud) reçoivent la mise à jour.

**Quoi** : il n'existe pas un système de synchronisation unique — le mécanisme dépend entièrement de l'endroit où vit le skill.

**Comment** :
- Skill de projet (`.claude/skills/`) : la synchro est un simple `git pull`, comme pour n'importe quel fichier versionné.
- Skill personnel (`~/.claude/skills/`) : un seul fichier sur la machine, donc toujours à jour localement par construction ; entre plusieurs machines, aucune synchro automatique — nécessite son propre mécanisme (dépôt dotfiles, dossier synchronisé par un cloud, lien symbolique).
- Skill synchronisé via le compte claude.ai : se télécharge automatiquement dans les sessions Cowork/cloud ; en local, seulement en mode non interactif via `CLAUDE_CODE_SYNC_SKILLS=1 claude -p "..."`, qui l'écrit sur disque dans `~/.claude/skills/synced/`.
- Plugin de marketplace : mise à jour automatique par défaut, avec une vérification manuelle possible.

**Pourquoi** : savoir quel canal utiliser évite de croire qu'une modification s'est propagée partout alors qu'elle est restée locale à une seule machine.

**Limites** : le téléchargement local des skills synchronisés du compte claude.ai suppose le mode non interactif (`-p`) — ça ne se fait pas automatiquement dans une session interactive normale.

---
Tags : #claude-code #skills
Dernière vérification : septembre 2026
