# Relancer réellement l'application avant de déclarer un lot terminé

**Symptôme / contexte** : les tests automatisés passent tous, mais je ne suis pas sûr que l'application démarre vraiment en conditions réelles.

**Quoi** : relancer l'application (mode headless ou équivalent le plus proche d'un démarrage réel) après un changement notable, en plus des tests unitaires, avant de déclarer le travail terminé.

**Comment** :
- Démarrer l'application comme le ferait un utilisateur, ou en mode headless si le framework le permet.
- Envoyer une requête ou une action de fumée minimale pour confirmer qu'elle répond correctement.
- Faire ce smoke-test après tout changement notable, pas seulement une fois en fin de projet.
- Ne déclarer le travail terminé qu'après ce test réel, pas seulement après « les tests passent ».

**Pourquoi** : une suite de tests unitaires verte n'exclut pas une erreur d'import, de configuration ou de démarrage qui casse l'application en conditions réelles.

**Limites** : demande que l'application puisse démarrer rapidement en local ; moins pertinent pour une bibliothèque sans point d'entrée exécutable.

---
Tags : #claude-code #tests #qualite
Dernière vérification : septembre 2026
