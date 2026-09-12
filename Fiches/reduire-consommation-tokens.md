# Réduire la consommation de tokens d'une session Claude Code

**Symptôme / contexte** : une session devient lente, coûteuse, ou approche la limite de contexte, alors que la tâche en cours ne le justifie pas forcément.

**Quoi** : un ensemble de leviers concrets, à appliquer pendant le travail, pour limiter le volume de tokens envoyés et reçus à chaque requête.

**Comment** :
- Faire `/clear` entre deux tâches indépendantes plutôt que de garder tout l'historique d'une tâche terminée ; utiliser `/compact` quand l'historique doit être conservé mais est devenu verbeux.
- Ne charger/activer que les outils et skills réellement utiles à la tâche en cours — chaque définition d'outil disponible occupe du contexte même sans être appelée.
- Lire les fichiers de façon ciblée (grep, offset/limit, plage de lignes) plutôt que des fichiers entiers volumineux quand seule une partie est utile.
- Déporter le détail volumineux (exemples longs, références) dans des fichiers annexes chargés à la demande plutôt que tout mettre dans le system prompt, CLAUDE.md ou SKILL.md (progressive disclosure).
- Confier les recherches ou explorations volumineuses à un sous-agent : ses résultats intermédiaires ne remontent pas dans le contexte principal, seul son résumé final y revient.
- Éviter de coller de gros blocs bruts (logs, sorties de commande complètes) sans les filtrer d'abord sur ce qui est réellement utile.

**Pourquoi** : réduit le coût et la latence de chaque requête, et retarde le moment où le contexte doit être compressé automatiquement, avec perte de détail.

**Limites** : ces leviers réduisent aussi la quantité d'information disponible pour le modèle — à doser selon la tâche ; ne pas sacrifier la justesse d'une réponse pour économiser des tokens. Pour comprendre d'abord ce qui pèse dans une requête, voir [comprendre-tokens-et-consommation.md](comprendre-tokens-et-consommation.md).

→ Skill : `Skills/reduire-consommation-tokens/SKILL.md`

---
Tags : #tokens #contexte #performance #methode
Dernière vérification : septembre 2026
