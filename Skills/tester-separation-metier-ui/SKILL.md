---
name: tester-separation-metier-ui
description: Écrire un test automatisé qui parcourt les imports du dossier métier et échoue si l'un d'eux importe le module de rendu/UI, pour garantir dans la durée qu'une architecture métier/UI séparée le reste. À utiliser dès que cette séparation existe dans le code d'un projet.
---

# Vérifier par test automatisé que le métier n'importe jamais l'UI

**Symptôme / contexte** : garantir qu'une règle d'architecture (« la logique métier ne dépend pas du rendu ») reste vraie dans la durée, pas seulement au moment où elle est écrite.

**Quoi** : un test automatisé qui parcourt les imports du dossier métier et échoue si l'un d'eux importe le module de rendu/UI, plutôt qu'une convention documentée seulement en commentaire.

**Comment** :
- Parcourir les fichiers du dossier métier et analyser leurs imports (ex. module `ast` en Python, ou équivalent du langage utilisé).
- Faire échouer le test si un import cible le module de rendu/UI.
- Faire tourner ce test dans la suite automatisée standard, pas comme script à part qu'on oublie de relancer.
- L'ajouter dès que la séparation métier/UI existe dans le code, pas seulement après une première régression constatée.

**Pourquoi** : une revue de code peut laisser passer un import UI ajouté par facilité dans le métier ; un test automatisé le détecte immédiatement à chaque exécution, sans dépendre de la vigilance du relecteur.

**Limites** : suppose une frontière métier/UI déjà identifiable en dossiers ou modules séparés — inapplicable si l'architecture n'a pas encore cette séparation.

Source : `Fiches/tester-separation-metier-ui-imports.md`
