# Sommaire — Tips & tricks Claude

> Point d'entrée unique pour retrouver une fiche. Voir `GUIDE-FICHE-MEMOIRE.md` pour le format à respecter avant d'ajouter une entrée.

Légende : ✅ fait · ⬜ à faire

## Claude Code — workflow & specs

| Statut | Sujet | Fiche | Tags |
|---|---|---|---|
| ✅ | Transmettre un CDCF détaillé sans saturer le contexte | [fiches/workflow-cdcf-claude-code.md](fiches/workflow-cdcf-claude-code.md) | #claude-code #planification |
| ⬜ | Sortir du Plan Mode seulement après relecture du plan | — | #claude-code #planification |
| ⬜ | Committer et `/clear` entre chaque lot de dev | — | #claude-code #contexte |
| ⬜ | Sub-agent dédié à la revue contradictoire d'un diff | — | #claude-code #sub-agents |
| ⬜ | Créer une commande slash personnalisée réutilisable | — | #claude-code #commandes |
| ⬜ | CLAUDE.md global vs CLAUDE.md par projet | — | #claude-code #memoire |
| ⬜ | Découper l'exploration d'un gros repo existant par lot | — | #claude-code #contexte |

## Gestion du contexte

| Statut | Sujet | Fiche | Tags |
|---|---|---|---|
| ⬜ | Différence entre `/clear` et `/compact` | — | #contexte |
| ⬜ | Signes qu'une session a besoin d'un contexte neuf | — | #contexte |
| ⬜ | Utiliser des sessions parallèles / worktrees git pour isoler des tâches | — | #claude-code #contexte |

## Prompting & interactions

| Statut | Sujet | Fiche | Tags |
|---|---|---|---|
| ⬜ | Pattern "interview" : faire poser des questions à Claude avant de spécifier | — | #prompting #specs |
| ⬜ | Demander un résumé de compréhension avant de faire coder | — | #prompting |
| ⬜ | Donner des critères de vérification explicites (tests, checklist) pour éviter un arrêt prématuré | — | #claude-code #qualite |

## Organisation & mémoire (Claude.ai)

| Statut | Sujet | Fiche | Tags |
|---|---|---|---|
| ⬜ | Utiliser les Projects pour cloisonner la mémoire par contexte | — | #claude-ai #memoire |
| ⬜ | Artifacts : quand Claude en crée un, et comment itérer dessus | — | #claude-ai #artifacts |

## Propositions non encore validées

*(à valider ou supprimer — ajoutées à titre de suggestion, pas encore demandées explicitement)*

- Différence entre Skills et CLAUDE.md, et quand utiliser l'un plutôt que l'autre
- Bonnes pratiques pour rédiger un `SKILL.md`
- Utiliser MCP pour connecter Claude Code à des outils externes (repos, tickets...)
