---
name: documents-vivants-plan-control
description: Créer et tenir à jour deux documents séparés dans un projet découpé en lots — PLAN.md (décisions et leur justification) et CONTROL_PLAN.md (contrôles et leur état de vérification) — dès le lot 1. À utiliser au démarrage d'un projet en lots et à chaque fonctionnalité livrée.
---

# Deux documents vivants : PLAN.md et CONTROL_PLAN.md

**Symptôme / contexte** : un projet démarre découpé en lots et il n'est pas clair où consigner les décisions prises par rapport à ce qui est effectivement vérifié.

**Quoi** : séparer le document de plan (quoi a été décidé, pourquoi) du document de contrôle (quoi est vérifié, comment) plutôt que de tout mélanger dans un seul fichier, et les tenir à jour au fil de l'eau.

**Comment** :
- `PLAN.md` : périmètre retenu par lot, puis des sections « régularisation » numérotées séquentiellement (jamais renommées ni fusionnées rétroactivement), une par retour utilisateur post-livraison, avec le contexte, la décision retenue et sa justification.
- `CONTROL_PLAN.md` : contrôles identifiés par un code court (ex. `G0-01`), chacun avec sa vérification attendue, son type de test, et un état d'exécution (automatisé / vérifié manuellement / reporté avec justification).
- Créer les deux fichiers dès le lot 1, même vides.
- Toute fonctionnalité ajoutée obtient une ligne de contrôle correspondante — jamais livrée sans entrée dans `CONTROL_PLAN.md`.
- Entre deux lots : en plus du `/clear` de la conversation, compacter `CONTROL_PLAN.md`, qui s'alourdit au fil des modifications du lot précédent. Supprimer les informations devenues contradictoires ou redondantes, et ne garder que l'état final des contrôles réellement appliqués et utiles pour le lot suivant — pas l'historique des tentatives intermédiaires. `PLAN.md` n'est pas concerné : ses sections de régularisation restent numérotées séquentiellement, jamais fusionnées ni supprimées.

**Pourquoi** : le plan répond à « qu'est-ce qui a été décidé et pourquoi », le contrôle répond à « qu'est-ce qui est vérifié et comment » — les mélanger rend difficile de répondre vite à l'une ou l'autre question en cours de projet, et un futur lecteur doit comprendre le raisonnement sans avoir vécu la session.

**Limites** : pour un projet très court ou à lot unique, la séparation ajoute de la charge de documentation sans bénéfice proportionné.

Source : `Fiches/documents-vivants-plan-et-control-plan.md`
