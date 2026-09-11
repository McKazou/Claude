# Passer en mode plan face à une demande ambiguë ou structurante

**Symptôme / contexte** : une demande touche plusieurs fichiers ou a plusieurs réponses de conception raisonnables, et je ne suis pas sûr de la direction à prendre avant de coder.

**Quoi** : passer en mode plan, explorer le code existant, puis poser explicitement les questions de choix avant d'écrire le plan final — plutôt que deviner silencieusement une préférence de conception.

**Comment** :
- Repérer le signal : plusieurs fichiers touchés, décision de conception à plusieurs réponses raisonnables, ou périmètre pas évident.
- Explorer le code existant avant de proposer quoi que ce soit.
- Poser explicitement les questions de choix à l'utilisateur, avec une option recommandée par défaut.
- Écrire le plan final seulement après avoir reçu ces réponses.

**Pourquoi** : deviner silencieusement une préférence de conception qui aurait pu être tranchée par une question simple coûte bien plus cher à corriger une fois le code écrit.

**Limites** : inutile sur une tâche au périmètre évident et court — ça ralentit sans bénéfice. Complémentaire de la fiche sur la sortie du mode plan (relecture du plan avant de désactiver le mode), pas un doublon.

---
Tags : #claude-code #planification
Dernière vérification : septembre 2026
