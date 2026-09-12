---
name: sub-agent-revue-diff
description: Après une implémentation non triviale, propose de déléguer la revue critique du diff à un sub-agent séparé qui n'a pas participé à l'écriture du code, pour détecter bugs, oublis et écarts avec la spec sans le biais de confirmation de l'agent qui vient d'écrire ce code. À utiliser avant de considérer une tâche terminée, surtout sur de la logique métier, de la sécurité, ou du code touchant plusieurs fichiers — pas sur un changement trivial ou très court.
---

# Sub-agent dédié à la revue contradictoire d'un diff

**Symptôme / contexte** : après une implémentation, Claude Code relit son propre code dans le même contexte — il a tendance à valider ce qu'il vient d'écrire plutôt qu'à le challenger.

**Quoi** : déléguer la revue du diff à un sub-agent, une instance séparée avec son propre contexte, qui n'a pas participé à l'implémentation et n'a donc pas de biais de confirmation.

**Comment** :
- Une fois le code écrit, si le changement est significatif (logique métier, sécurité, code touchant plusieurs fichiers), proposer explicitement à l'utilisateur de lancer un sub-agent dédié à la revue critique du diff plutôt que de se relire soi-même dans le même contexte.
- Donner à ce sub-agent uniquement le diff et les critères attendus (specs, tests) — jamais tout l'historique de la conversation, pour ne pas lui transmettre le biais de confirmation de l'implémentation.
- Lui demander explicitement de chercher les problèmes ("quels bugs, oublis ou écarts avec la spec vois-tu ?"), jamais de confirmer que le code est bon.
- Traiter son retour comme un avis contradictoire à trancher, pas comme une validation automatique à accepter telle quelle.

**Pourquoi** : un agent qui vient d'écrire du code a un contexte « pollué » par ses propres décisions ; un regard neuf détecte des erreurs qu'il aurait rationalisées.

**Limites** : overkill sur un changement trivial ou très court ; utile surtout sur du code avec des enjeux (logique métier, sécurité, code touchant plusieurs fichiers) — ne pas le proposer systématiquement au risque de lasser l'utilisateur.

Source : `Fiches/sub-agent-revue-diff.md`
