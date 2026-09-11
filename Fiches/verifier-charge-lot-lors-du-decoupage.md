# Vérifier la charge d'un lot avant d'y affecter une tâche

**Symptôme / contexte** : lors de la construction ou de l'évolution d'un plan découpé en lots, l'utilisateur propose de mettre une tâche dans un lot précis, et cette affectation est validée sans se demander si le lot visé n'est pas déjà trop chargé, ni si d'autres tâches proches ne gagneraient pas à être déplacées ou regroupées avec elle.

**Quoi** : avant de valider l'affectation d'une tâche à un lot mentionné, vérifier deux points : 1) le lot visé n'est pas déjà trop chargé pour absorber cette tâche sans devenir un lot fourre-tout ; 2) il ne serait pas plus cohérent de déplacer ou d'ajouter d'autres tâches proches dans ce même lot.

**Comment** :
- Quand l'utilisateur propose « mets telle tâche dans le lot X », ne pas valider immédiatement l'affectation.
- Évaluer la charge actuelle du lot X (nombre de tâches, complexité cumulée) : si l'ajout le surchargerait, le signaler explicitement et proposer une alternative (nouveau lot, report, autre découpage).
- Vérifier si des tâches déjà présentes dans d'autres lots sont thématiquement plus proches de la tâche à affecter que de leur lot actuel — si oui, proposer de les déplacer ou de les regrouper dans le lot X plutôt que de les laisser éclatées.
- Toujours proposer, jamais décider seul : présenter le déséquilibre ou le regroupement possible constaté et laisser l'utilisateur valider avant de modifier le plan.

**Pourquoi** : sans cette vérification, un lot grossit au fil des demandes ponctuelles jusqu'à devenir invalidable en bloc, et des tâches proches restent dispersées entre plusieurs lots alors qu'elles auraient gagné à être traitées ensemble.

**Limites** : s'applique au moment où le découpage en lots est construit ou modifié, pas à l'implémentation d'une demande une fois le lot déjà figé et en cours — dans ce second cas, voir [verifier-perimetre-lot-avant-implementation.md](verifier-perimetre-lot-avant-implementation.md).

---
Tags : #claude-code #planification #methode
Dernière vérification : septembre 2026
