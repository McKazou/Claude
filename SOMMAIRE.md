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

## Propositions non encore validées

*(à valider ou supprimer — ajoutées à titre de suggestion, pas encore demandées explicitement)*

- Différence entre Skills et CLAUDE.md, et quand utiliser l'un plutôt que l'autre
- Bonnes pratiques pour rédiger un `SKILL.md`
- Utiliser MCP pour connecter Claude Code à des outils externes (repos, tickets...)
