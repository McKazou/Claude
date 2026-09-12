# Sub-agent dédié à la revue contradictoire d'un diff

**Symptôme / contexte** : après une implémentation, Claude Code relit son propre code dans le même contexte — il a tendance à valider ce qu'il vient d'écrire plutôt qu'à le challenger.

**Quoi** : déléguer la revue du diff à un sub-agent, une instance séparée avec son propre contexte, qui n'a pas participé à l'implémentation et n'a donc pas de biais de confirmation.

**Comment** :
- Une fois le code écrit, demander explicitement un sub-agent pour la revue (ex. "lance un sub-agent pour relire ce diff de façon critique")
- Lui donner uniquement le diff + les critères attendus (specs, tests), pas tout l'historique de la conversation
- Lui demander de chercher les problèmes, pas de confirmer que c'est bon (ex. "quels bugs, oublis ou écarts avec la spec vois-tu ?")
- Traiter son retour comme un avis contradictoire à trancher, pas une validation automatique

**Pourquoi** : un agent qui vient d'écrire du code a un contexte "pollué" par ses propres décisions ; un regard neuf détecte des erreurs qu'il aurait rationalisées.

**Limites** : overkill sur un changement trivial ou très court ; utile surtout sur du code avec des enjeux (logique métier, sécurité, code touchant plusieurs fichiers).

→ Skill : `Skills/sub-agent-revue-diff/SKILL.md`

---
Tags : #claude-code #sub-agents
Dernière vérification : septembre 2026
