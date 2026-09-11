---
name: workflow-cdcf
description: Construire une application à partir d'un cahier des charges fonctionnel (CDCF) détaillé sans saturer le contexte ni partir dans une mauvaise direction — CDCF dans le repo, CLAUDE.md généré, exploration en Plan Mode, PLAN.md validé, implémentation lot par lot avec commit + /clear entre chaque lot. À utiliser au tout début d'un projet quand l'utilisateur fournit un cahier des charges ou une spec fonctionnelle détaillée.
---

# Workflow : transmettre un CDCF détaillé à Claude Code

**Symptôme / contexte** : un CDCF détaillé doit servir de base à un projet, sans le coller tel quel dans le chat ni demander de tout coder d'un coup.

**Quoi** : traiter le CDCF comme un document du projet, faire produire un plan d'implémentation avant de coder, puis avancer lot par lot avec des vérifications — au lieu de générer du code directement à partir d'un CDCF collé dans la conversation.

**Comment** (checklist, détail et exemples dans `reference.md`) :
- Mettre le CDCF dans le repo (`docs/CDCF.md`, converti en Markdown si besoin), jamais seulement dans le chat.
- Générer un `CLAUDE.md` (`/init`) : contexte technique permanent et court — commandes, conventions — pas le détail fonctionnel.
- Passer en Plan Mode et faire reformuler la compréhension du CDCF (résumé, points ambigus, découpage en lots proposé) avant tout code. Si des zones techniques restent floues, utiliser le pattern « interview » (Claude pose des questions ciblées) et compiler les réponses avec le CDCF dans un `SPEC.md`.
- Demander un `PLAN.md` détaillé (architecture, lots, ordre, fichiers concernés), le relire par rapport au CDCF, puis seulement sortir du Plan Mode.
- Implémenter lot par lot, avec pour chaque lot un moyen de vérification explicite (tests, critères d'acceptation, checklist) — sans ça Claude s'arrête dès que ça « a l'air fini ».
- Committer chaque lot terminé, puis `/clear` avant le suivant — ne pas laisser le contexte s'encombrer de plusieurs lots mélangés.
- Avant de considérer un lot terminé, demander une revue contradictoire via un subagent dans un contexte neuf, comparant le diff au `PLAN.md` et au CDCF.

**Pourquoi** : CDCF/PLAN.md (détail fonctionnel, consultés à la demande) et CLAUDE.md (contexte technique permanent) ont des rôles différents ; planifier avant de coder sur des tâches larges ou ambiguës évite qu'une longue session s'encombre de corrections successives après coup.

**Limites** : ce workflow est pensé pour un projet démarré à partir d'un CDCF déjà écrit — pour une tâche ponctuelle au périmètre évident, sauter directement à l'implémentation sans ce cadrage.

Source : `Fiches/workflow-cdcf-claude-code.md`
