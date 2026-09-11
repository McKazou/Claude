# Reset de la mémoire de Claude Code (local, projet, everywhere)

**Symptôme / contexte** : la mémoire de Claude (CLAUDE.md ou fiches auto-memory) contient des informations obsolètes, contradictoires ou trop bruitées, et continuer à l'enrichir ne suffit plus — il faut repartir propre sur un périmètre donné.

**Quoi** : Claude Code a deux mécanismes de mémoire distincts, chacun avec ses propres portées (local / projet / everywhere) et sa propre procédure de reset — aucun des deux n'a de commande de reset intégrée, ça se fait par édition ou suppression manuelle des fichiers.

**Comment** :

*Mémoire CLAUDE.md (contexte/instructions chargé au démarrage, cumulatif)*
- Local (`./CLAUDE.local.md`, non versionné) : vider ou supprimer le fichier directement, aucun impact sur l'équipe.
- Projet (`./CLAUDE.md`, versionné et partagé) : passer par un commit/PR normal — éditer ou vider puis committer, jamais une suppression silencieuse qui surprendrait l'équipe au prochain pull.
- Everywhere (`~/.claude/CLAUDE.md`, s'applique à tous les projets du compte) : vider ou supprimer ce fichier unique — il n'y en a qu'un par compte, donc "everywhere" se résume à ce seul fichier.
- `/memory` liste et ouvre ces fichiers pour édition/suppression sans sortir de Claude Code.

*Auto-memory (fiches de leçons apprises, écrites automatiquement en session — comme celles listées en tête de cette conversation)*
- Stockée par projet dans `~/.claude/projects/<chemin-du-projet-assaini>/memory/*.md` — un dossier par projet, pas de dossier global partagé entre projets.
- Local / projet (même portée ici, un dossier de mémoire = un projet) : supprimer les fichiers `.md` de ce dossier memory.
- Everywhere (tous les projets) : parcourir chaque dossier `~/.claude/projects/*/memory/` et vider individuellement — pas de commande unique, à faire projet par projet.
- Rien ne recrée ces fichiers automatiquement après suppression : ils ne repeuplent qu'au fil de nouvelles corrections faites par l'utilisateur en session.

*Avant de reset, quel que soit le périmètre*
- Relire le contenu existant : préférer un nettoyage sélectif (supprimer les entrées obsolètes ou contradictoires une par une) à un reset total, qui fait aussi disparaître les leçons encore valides.
- Sauvegarder si le contenu a de la valeur (copier le fichier, ou committer un état avant de vider un CLAUDE.md projet).
- Si une fiche auto-memory mérite de survivre, la transformer en doc permanent (ex. dossier `Fiches/`) avant de la supprimer de l'auto-memory.

**Pourquoi (best use — quand et pourquoi reset)** :
- Une mémoire périmée est pire qu'une mémoire absente : elle peut activement induire Claude en erreur (commande de build qui a changé, stack réécrite, préférence qui ne s'applique plus).
- Reset local/projet : à faire quand le projet pivote fortement (refonte d'archi, changement d'outillage) et que les anciennes leçons contredisent la réalité actuelle du code.
- Reset everywhere (CLAUDE.md global, ou auto-memory de tous les projets) : rare, à réserver aux cas où un mauvais pattern a été appris et s'est propagé largement, ou à une remise à zéro volontaire du compte — ne pas le faire par réflexe, ça détruit l'apprentissage cumulé sur tous les projets d'un coup.
- Un CLAUDE.md ou une auto-memory qui grossit sans jamais être nettoyé coûte du contexte à chaque session (le CLAUDE.md est chargé intégralement à chaque démarrage) — un nettoyage périodique sélectif vaut mieux qu'un usage en "boîte à tout mettre" jamais purgée.

**Limites** : cette fiche couvre la suppression/le vidage des fichiers ; pour savoir où écrire une préférence en premier lieu (quelle portée choisir), voir [claude-md-global-vs-projet.md](claude-md-global-vs-projet.md).

---
Tags : #claude-code #memoire
Dernière vérification : septembre 2026
