# Ce qu'est un token et ce qui fait varier leur nombre dans une requête

**Symptôme / contexte** : je veux comprendre pourquoi une requête Claude est plus ou moins longue, lente ou coûteuse, avant de chercher à l'optimiser.

**Quoi** : un token est l'unité de découpage du texte utilisée par le modèle — ni un caractère, ni un mot (en anglais, environ 4 caractères ou ¾ de mot ; le code, le français et les autres langues se découpent souvent en davantage de tokens pour un même contenu). Le coût, la latence et la fenêtre de contexte disponible se comptent tous en tokens : en entrée (tout ce qui est envoyé au modèle) comme en sortie (ce qu'il génère).

**Comment** (ce qui fait varier le nombre de tokens d'une requête) :
- L'historique de conversation cumulé : chaque tour précédent est renvoyé intégralement à chaque nouvelle requête tant que la session n'est pas nettoyée.
- Le system prompt et tout ce qui est chargé en permanence : CLAUDE.md, mémoire automatique, descriptions des skills disponibles, définitions des outils — même ceux jamais appelés occupent du contexte.
- Les résultats d'outils réinjectés dans la conversation : lecture de fichiers volumineux, sorties de commande verbeuses, résultats de recherche non filtrés.
- Les pièces jointes : un document ou une image consomme des tokens proportionnellement à sa taille ou sa résolution, parfois plus qu'un même contenu en texte brut.
- La longueur de la réponse générée : les tokens de sortie sont comptés à part, et souvent facturés à un tarif plus élevé que les tokens d'entrée.
- La langue et la nature du contenu : code, JSON, tableaux, ou langues autres que l'anglais se tokenisent en général moins efficacement (plus de tokens pour la même quantité d'information).

**Pourquoi** : savoir ce qui pèse dans une requête permet d'anticiper son coût et sa latence, et de repérer sur quel levier agir plutôt que de deviner pourquoi une session devient lente ou chère.

**Limites** : le découpage exact en tokens dépend du tokenizer propre à chaque modèle et fournisseur — les équivalences données ici sont des ordres de grandeur, pas une règle exacte. Cette fiche décrit le phénomène ; pour les leviers concrets de réduction, voir [reduire-consommation-tokens.md](reduire-consommation-tokens.md).

---
Tags : #tokens #contexte #methode
Dernière vérification : septembre 2026
