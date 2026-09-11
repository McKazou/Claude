# Workflow : transmettre un CDCF détaillé à Claude Code

Méthode pour faire construire une application à partir d'un cahier des charges fonctionnel (CDCF) détaillé, sans saturer le contexte de Claude Code et sans partir dans une mauvaise direction.

## Principe général

Ne pas coller le CDCF dans le chat et demander de tout coder d'un coup. Le traiter comme un document du projet, faire produire un plan d'implémentation avant de coder, puis avancer lot par lot avec des vérifications.

## Les étapes

### 1. Mettre le CDCF dans le repo, pas dans le chat
Placer le document dans le projet, par exemple `docs/CDCF.md` (le convertir en Markdown si c'est un Word/PDF). Claude Code peut alors le lire directement et y revenir à tout moment avec `@docs/CDCF.md`, au lieu qu'il reste coincé dans l'historique de conversation.

### 2. Générer un CLAUDE.md
Lancer `/init` dans Claude Code : ça génère un fichier `CLAUDE.md` avec le contexte persistant du projet (stack technique, commandes de build/test, conventions de code). Il est lu au début de chaque session, contrairement au CDCF qui n'est consulté qu'à la demande. Le garder court : commandes et conventions uniquement, pas le détail fonctionnel — un CLAUDE.md trop long fait que Claude ignore une partie des instructions.

### 3. Phase d'exploration en Plan Mode
Activer le Plan Mode (`Shift+Tab` jusqu'à voir « plan mode on »). Demander à Claude de lire le CDCF et de reformuler sa compréhension du besoin, sans coder. Permet de détecter les incompréhensions avant d'investir du temps de génération.

Exemple de premier message :
```
Lis @docs/CDCF.md en entier. Résume ta compréhension du produit à construire
en 10 lignes maximum, liste les points ambigus ou sous-spécifiés, puis
propose un découpage en lots de développement avec un ordre de priorité.
N'écris aucun code pour l'instant.
```

Si le CDCF laisse des zones floues côté technique, utiliser le pattern « interview » : demander à Claude de poser des questions ciblées, puis compiler les réponses avec le CDCF dans un `SPEC.md` technique — c'est ce fichier qui sert ensuite de base à l'implémentation, pas le CDCF brut.

### 4. Demander un plan d'implémentation écrit
Toujours en Plan Mode, demander un plan détaillé (architecture, découpage en lots/fonctionnalités, ordre de développement, fichiers concernés) et le faire écrire dans un `PLAN.md`. Possibilité de l'ouvrir dans l'éditeur (`Ctrl+G`) pour le corriger avant de valider.

### 5. Valider le plan avant de sortir du Plan Mode
Relire le `PLAN.md` par rapport au CDCF : c'est le moment le moins cher pour corriger une erreur de compréhension. Une fois validé, sortir du Plan Mode (`Shift+Tab`) pour passer à l'implémentation.

### 6. Implémenter lot par lot, avec des critères de vérification
Pour chaque lot du plan, donner à Claude un moyen de vérifier lui-même son travail : tests unitaires, critères d'acceptation tirés du CDCF, ou une checklist. Sans ça, Claude s'arrête dès que ça « a l'air fini », ce qui laisse passer des cas non gérés.

### 7. Committer et /clear entre les lots
Faire committer chaque lot terminé avec un message descriptif, puis lancer `/clear` avant d'attaquer le lot suivant. Un contexte encombré par plusieurs fonctionnalités mélangées dégrade la qualité des réponses sur un gros projet.

### 8. Ajouter une revue contradictoire
Avant de considérer une fonctionnalité terminée, demander une revue via un subagent dans un contexte neuf :
```
Utilise un subagent pour comparer ce diff au PLAN.md et au CDCF, et signale
les écarts.
```
Un regard frais détecte des lacunes que la session qui a codé ne verra pas.

## À retenir

- CDCF et CLAUDE.md ont des rôles différents : CLAUDE.md = contexte technique permanent et court ; CDCF/PLAN.md = détail fonctionnel, consultés à la demande.
- Planifier avant de coder sur les tâches larges ou ambiguës ; sauter le plan sur les petites tâches au périmètre évident.
- Un plan validé et un contexte propre valent mieux qu'une longue session encombrée de corrections successives.
