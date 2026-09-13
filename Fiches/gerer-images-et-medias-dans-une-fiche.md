# Gérer images et médias dans une base de fiches

**Symptôme / contexte** : le sujet documenté s'appuie beaucoup sur des éléments visuels (icônes, captures d'écran, schémas — typiquement un logiciel avec une interface graphique) et le texte seul ne suffit pas à identifier de quoi on parle.

**Quoi** : une convention de stockage et de référencement des médias qui garde chaque fiche autonome et rapide à lire, sans transformer la base en dossier d'images non organisé.

**Comment** :
- Un dossier `assets/<nom-de-la-fiche>/` à côté du dossier des fiches, un sous-dossier par fiche qui a des médias ; noms de fichiers descriptifs (`icone-extrusion.png`), jamais `image1.png`
- Toujours doubler une image d'une courte description textuelle à côté de son insertion dans la fiche (ce qu'elle montre, pas juste sa légende) — l'image ne doit jamais être la seule porteuse de l'information, sinon la fiche redevient illisible en scan rapide et invisible à une recherche texte
- Préférer un lien vers la documentation officielle du sujet plutôt qu'une capture copiée quand le contenu source change souvent (interface d'un logiciel activement mis à jour) ; garder une capture locale seulement pour l'identification rapide (reconnaître une icône au premier coup d'œil), pas comme documentation exhaustive
- Noter la version du logiciel/source au moment de la capture, à côté de la date de vérification de la fiche — sans ça, une image obsolète après une mise à jour de l'interface passe inaperçue
- Recadrer les images sur l'élément pertinent (une icône, un bouton, un menu) plutôt que des captures pleine page peu réutilisables et plus longues à scanner

**Pourquoi** : évite deux dérives opposées — soit aucune image et des descriptions textuelles interminables pour décrire un pictogramme, soit un dossier de captures d'écran non légendées qui oblige à rouvrir chaque image pour comprendre la fiche.

**Limites** : ne pas dupliquer des images volumineuses ou protégées si un lien stable vers une doc officielle existe déjà. Les captures locales demandent un entretien actif (revérifier après changement de version de l'outil source) ; sans cette discipline, elles pourrissent silencieusement et deviennent trompeuses plutôt qu'absentes — un risque pire qu'un simple manque d'information.

---
Tags : #methode #base-de-connaissances #medias #documentation
Dernière vérification : septembre 2026
