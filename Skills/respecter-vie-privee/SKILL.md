---
name: respecter-vie-privee
description: Limite la collecte, le stockage et la diffusion des informations personnelles de l'utilisateur — ne les écrit que dans la fiche utilisateur dédiée, ne les envoie jamais à un service tiers sans demande explicite, et les exclut de tout contenu générique ou destiné à être publié/partagé. À utiliser dès qu'une information personnelle de l'utilisateur (identité, coordonnées, contexte de vie) apparaît dans une session, ou avant de publier un artifact, un commit ou un skill partagé.
---

# Respecter la vie privée de l'utilisateur dans toute session

**Symptôme / contexte** : une session manipule des informations personnelles de l'utilisateur (identité, coordonnées, contexte de vie) alors que ce dépôt de fiches/skills est généraliste, réutilisable et parfois partagé.

**Quoi** : un socle de règles pour limiter la collecte, le stockage et la diffusion des informations personnelles de l'utilisateur, au-delà de la seule règle de rangement dans la fiche utilisateur dédiée.

**Comment** :
- Ne jamais écrire d'information personnelle de l'utilisateur ailleurs que dans `Fiches/utilisateur-pierre-leroy.md` — jamais dans une fiche méthode générique, un exemple ou un skill.
- Avant de publier un artifact, un commit, un skill partagé ou tout contenu destiné à sortir de cette session, vérifier qu'aucune donnée personnelle ne s'y est glissée par accident.
- Ne transmettre aucune donnée personnelle de l'utilisateur à un service tiers (API externe, outil web, artifact publié) sauf demande explicite de l'utilisateur pour cet usage précis.
- Minimiser : ne demander ou consigner que l'information personnelle strictement utile à la tâche en cours, jamais « au cas où ».
- Pour illustrer une fiche générique, utiliser un exemple anonymisé ou fictif plutôt qu'une donnée réelle de l'utilisateur.

**Pourquoi** : une base de connaissance vouée à être générique et réutilisable ne doit pas devenir, même involontairement, un vecteur de fuite d'informations personnelles.

**Limites** : ne s'applique pas quand l'utilisateur partage lui-même une information personnelle pour un besoin ponctuel explicite — dans ce cas la traiter pour ce besoin précis, sans la faire persister au-delà.

Source : `Fiches/respecter-vie-privee-utilisateur.md`
