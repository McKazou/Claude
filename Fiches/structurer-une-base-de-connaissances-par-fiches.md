# Structurer une base de connaissances par fiches, sur n'importe quel sujet

**Symptôme / contexte** : je veux démarrer une nouvelle base d'information sur un sujet (logiciel, domaine technique, méthode) et je me demande comment l'organiser pour qu'elle reste rapide à consulter même quand elle grossit, sans repartir de zéro sur l'architecture.

**Quoi** : une architecture en trois couches, indépendante du sujet traité — un dossier de fiches atomiques, un sommaire central avec identifiants stables, et un gabarit de fiche fixe — qui rend l'information retrouvable sans dépendre de la mémoire de qui l'a écrite.

**Comment** :
- Un fichier = un sujet précis et autonome (pas de fiche fourre-tout) ; si un sujet a plusieurs facettes indépendantes, écrire une fiche "hub" courte qui pointe vers des sous-fiches plutôt que tout mettre dans une seule fiche illisible
- Gabarit fixe par fiche, tenant sur un écran : contexte déclencheur (quand je pense à chercher cette fiche), quoi, comment (3-6 puces), pourquoi, limites — voir un exemple concret dans `GUIDE-FICHE-MEMOIRE.md` de ce dépôt, à copier tel quel dans le nouveau projet
- Un sommaire unique, avec un ID numérique stable par ligne (jamais réutilisé même si une fiche est supprimée), qui reste le seul point d'entrée pour chercher un sujet — permet de désigner une fiche par numéro dans la conversation
- Des tags transverses en plus des catégories du sommaire, pour retrouver par thème plutôt que par hiérarchie de dossier
- Un champ de fraîcheur par fiche ("dernière vérification : mois année") ; si le sujet évolue vite (ex. une interface logicielle qui change entre versions), ajouter aussi "valable pour version X" pour repérer une fiche qui a besoin d'être revérifiée après une mise à jour du sujet source
- Si le sujet s'appuie beaucoup sur des éléments visuels (icônes, captures, schémas), prévoir dès le départ une convention de stockage des médias — voir [gerer-images-et-medias-dans-une-fiche.md](gerer-images-et-medias-dans-une-fiche.md)

**Pourquoi** : cette structure a fait ses preuves sur la base de tips Claude Code de ce dépôt — le gain n'est pas propre à ce sujet, il vient de la discipline (atomicité, gabarit fixe, sommaire unique), donc transposable tel quel à un tout autre domaine.

**Limites** : le gabarit fixe convient à des techniques/patterns actionnables ; pour du contenu purement référentiel (glossaire, table d'icônes, liste de raccourcis) il vaut mieux garder le même esprit (atomique, retrouvable par le sommaire) mais adapter les sections internes plutôt que forcer "comment/pourquoi" sur une simple liste de définitions. La discipline de synchronisation (sommaire à jour, ID jamais renumérotés) reste manuelle — rien ne l'impose techniquement, seule la rigueur au moment de chaque ajout l'entretient.

---
Tags : #methode #base-de-connaissances #documentation
Dernière vérification : septembre 2026
