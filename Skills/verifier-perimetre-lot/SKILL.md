---
name: verifier-perimetre-lot
description: Avant d'implémenter une demande qui semble déborder du lot en cours, vérifier explicitement dans le cahier des charges de référence à quel lot elle appartient réellement, puis le signaler clairement avant de continuer. À utiliser dans un projet découpé en lots quand une demande utilisateur semble empiéter sur un lot futur.
---

# Vérifier le périmètre d'un lot avant d'implémenter une demande limite

**Symptôme / contexte** : une demande utilisateur semble déborder du lot en cours et il n'est pas clair si elle doit être implémentée directement ou signalée d'abord.

**Quoi** : vérifier explicitement dans le cahier des charges de référence à quel lot appartient réellement la demande, plutôt que de le supposer, puis le dire clairement avant de continuer.

**Comment** :
- Lecture ciblée du cahier des charges pour identifier le lot réel de la demande — pas une supposition.
- Si elle est bien dans le lot courant : le confirmer explicitement et continuer.
- Si elle empiète sur un lot futur : le signaler clairement à l'utilisateur et attendre une validation explicite avant de continuer.
- Une demande explicite de l'utilisateur suffit à autoriser l'empiètement, mais il faut quand même le signaler — jamais l'ignorer silencieusement.
- Si on procède, documenter dans `PLAN.md` que c'est une anticipation assumée d'un lot futur, pas une confusion de périmètre.

**Pourquoi** : évite de livrer « en douce » une fonctionnalité hors-lot ou, à l'inverse, de refuser par excès de prudence une demande que l'utilisateur assume — dans les deux cas le choix doit être explicite et tracé.

**Limites** : inutile si le projet n'a pas de découpage en lots formalisé ni de cahier des charges de référence à consulter.

Source : `Fiches/verifier-perimetre-lot-avant-implementation.md`
