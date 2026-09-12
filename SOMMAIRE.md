# Sommaire — Tips & tricks Claude

> Point d'entrée unique pour retrouver une fiche. Voir `GUIDE-FICHE-MEMOIRE.md` pour le format à respecter avant d'ajouter une entrée.

Légende : ✅ fait · ⬜ à faire

## Claude Code — workflow & specs

| ID | Statut | Sujet | Fiche | Tags |
|---|---|---|---|---|
| 1 | ✅ | Transmettre un CDCF détaillé sans saturer le contexte | [fiches/workflow-cdcf-claude-code.md](fiches/workflow-cdcf-claude-code.md) | #claude-code #planification |
| 2 | ⬜ | Sortir du Plan Mode seulement après relecture du plan | — | #claude-code #planification |
| 3 | ⬜ | Committer et `/clear` entre chaque lot de dev | — | #claude-code #contexte |
| 4 | ⬜ | Sub-agent dédié à la revue contradictoire d'un diff | — | #claude-code #sub-agents |
| 5 | ⬜ | Créer une commande slash personnalisée réutilisable | — | #claude-code #commandes |
| 6 | ✅ | CLAUDE.md global vs CLAUDE.md par projet | [fiches/claude-md-global-vs-projet.md](fiches/claude-md-global-vs-projet.md) | #claude-code #memoire |
| 7 | ⬜ | Découper l'exploration d'un gros repo existant par lot | — | #claude-code #contexte |
| 16 | ✅ | Piloter un projet applicatif découpé en lots (index → fiches 17-21, 27) | [fiches/piloter-projet-decoupe-en-lots.md](fiches/piloter-projet-decoupe-en-lots.md) | #claude-code #planification #methode |
| 17 | ✅ | Deux documents vivants : PLAN.md et CONTROL_PLAN.md | [fiches/documents-vivants-plan-et-control-plan.md](fiches/documents-vivants-plan-et-control-plan.md) | #claude-code #planification #methode |
| 18 | ✅ | Vérifier le périmètre d'un lot avant d'implémenter une demande limite | [fiches/verifier-perimetre-lot-avant-implementation.md](fiches/verifier-perimetre-lot-avant-implementation.md) | #claude-code #planification |
| 19 | ✅ | Vérifier par test automatisé que le métier n'importe jamais l'UI | [fiches/tester-separation-metier-ui-imports.md](fiches/tester-separation-metier-ui-imports.md) | #claude-code #architecture #tests |
| 20 | ✅ | Relancer réellement l'application avant de déclarer un lot terminé | [fiches/smoke-test-avant-cloture-lot.md](fiches/smoke-test-avant-cloture-lot.md) | #claude-code #tests #qualite |
| 21 | ✅ | Passer en mode plan face à une demande ambiguë ou structurante | [fiches/quand-passer-en-mode-plan.md](fiches/quand-passer-en-mode-plan.md) | #claude-code #planification |
| 27 | ✅ | Vérifier la charge d'un lot avant d'y affecter une tâche | [fiches/verifier-charge-lot-lors-du-decoupage.md](fiches/verifier-charge-lot-lors-du-decoupage.md) | #claude-code #planification #methode |
| 22 | ✅ | Utiliser un Skill Claude Code pour réutiliser une procédure entre projets | [fiches/utiliser-un-skill-claude-code.md](fiches/utiliser-un-skill-claude-code.md) | #claude-code #skills #memoire |
| 23 | ✅ | Partager un Skill entre personnes, projets et sessions (index → fiches 24-26) | [fiches/partager-un-skill-claude-code.md](fiches/partager-un-skill-claude-code.md) | #claude-code #skills #methode |
| 24 | ✅ | Partager un skill avec son équipe via le dépôt git | [fiches/partager-skill-equipe-git.md](fiches/partager-skill-equipe-git.md) | #claude-code #skills |
| 25 | ✅ | Réutiliser un skill sur plusieurs projets non liés | [fiches/reutiliser-skill-plusieurs-projets.md](fiches/reutiliser-skill-plusieurs-projets.md) | #claude-code #skills |
| 26 | ✅ | Garder un skill à jour entre ses différentes utilisations | [fiches/synchroniser-skill-entre-usages.md](fiches/synchroniser-skill-entre-usages.md) | #claude-code #skills |
| 28 | ✅ | Bonnes pratiques pour rédiger un SKILL.md | [fiches/bonnes-pratiques-rediger-skill.md](fiches/bonnes-pratiques-rediger-skill.md) | #claude-code #skills #methode |
| 29 | ✅ | Convertir une fiche en Skill Claude Code | [fiches/convertir-une-fiche-en-skill.md](fiches/convertir-une-fiche-en-skill.md) | #claude-code #skills #methode |

## Gestion du contexte

| ID | Statut | Sujet | Fiche | Tags |
|---|---|---|---|---|
| 8 | ⬜ | Différence entre `/clear` et `/compact` | — | #contexte |
| 9 | ⬜ | Signes qu'une session a besoin d'un contexte neuf | — | #contexte |
| 10 | ⬜ | Utiliser des sessions parallèles / worktrees git pour isoler des tâches | — | #claude-code #contexte |

## Prompting & interactions

| ID | Statut | Sujet | Fiche | Tags |
|---|---|---|---|---|
| 11 | ⬜ | Pattern "interview" : faire poser des questions à Claude avant de spécifier | — | #prompting #specs |
| 12 | ⬜ | Demander un résumé de compréhension avant de faire coder | — | #prompting |
| 13 | ⬜ | Donner des critères de vérification explicites (tests, checklist) pour éviter un arrêt prématuré | — | #claude-code #qualite |

## Organisation & mémoire (Claude.ai)

| ID | Statut | Sujet | Fiche | Tags |
|---|---|---|---|---|
| 14 | ⬜ | Utiliser les Projects pour cloisonner la mémoire par contexte | — | #claude-ai #memoire |
| 15 | ⬜ | Artifacts : quand Claude en crée un, et comment itérer dessus | — | #claude-ai #artifacts |

## Informations personnelles

| ID | Statut | Sujet | Fiche | Tags |
|---|---|---|---|---|
| 30 | ✅ | Fiche utilisateur — seul emplacement des informations personnelles | [fiches/utilisateur-pierre-leroy.md](fiches/utilisateur-pierre-leroy.md) | #utilisateur #personnel |

## Propositions non encore validées

*(à valider ou supprimer — ajoutées à titre de suggestion, pas encore demandées explicitement)*

- Différence entre Skills et CLAUDE.md, et quand utiliser l'un plutôt que l'autre
- Utiliser MCP pour connecter Claude Code à des outils externes (repos, tickets...)
