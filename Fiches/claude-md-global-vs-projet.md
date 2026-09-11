# CLAUDE.md global vs CLAUDE.md par projet

**Symptôme / contexte** : je me demande où mettre une préférence — dans le CLAUDE.md du projet ou dans celui de mon compte — pour qu'elle s'applique là où il faut.

**Quoi** : Claude Code charge plusieurs fichiers CLAUDE.md de façon cumulative (pas de remplacement) selon leur portée : organisation, compte utilisateur, projet, local au projet.

**Comment** :
- `~/.claude/CLAUDE.md` : préférences perso valables sur tous les projets.
- `./CLAUDE.md` (ou `./.claude/CLAUDE.md`) : contexte du repo partagé avec l'équipe, versionné — commandes de build/test, conventions, architecture.
- `./CLAUDE.local.md` : réglages perso pour ce projet précis, non partagés — à ajouter au `.gitignore`.
- Tous les fichiers trouvés sont concaténés dans le contexte, du plus général au plus spécifique ; pas de priorité automatique en cas de contradiction, Claude tranche arbitrairement.
- `/init` génère ou complète le CLAUDE.md du projet ; `/memory` liste et ouvre n'importe lequel de ces fichiers pour édition.

**Pourquoi** : évite de dupliquer les mêmes préférences dans chaque projet (global) et évite de polluer le CLAUDE.md partagé de l'équipe avec des réglages purement personnels (local).

**Limites** : viser moins de 200 lignes par fichier — au-delà, Claude en respecte moins bien le contenu. N'y mettre que ce qu'on redirait sinon à chaque session : pas ce que Claude peut déduire du code, pas une procédure multi-étapes (→ une skill), pas une règle propre à un sous-dossier (→ `.claude/rules/`).

---
Tags : #claude-code #memoire
Dernière vérification : septembre 2026
