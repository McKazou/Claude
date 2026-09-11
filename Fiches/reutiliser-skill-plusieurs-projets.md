# Réutiliser un skill sur plusieurs projets non liés

**Symptôme / contexte** : j'ai un skill utile et je veux le retrouver dans plusieurs projets qui n'ont aucun rapport entre eux (pas le même dépôt), sans le copier-coller dans chacun.

**Quoi** : trois options selon le besoin — skill personnel global à la machine, plugin installé au niveau utilisateur, ou réglage `skillOverrides` pour affiner la visibilité projet par projet.

**Comment** :
- Skill personnel : le placer dans `~/.claude/skills/<nom>/SKILL.md` — disponible automatiquement dans tous les projets locaux de cette machine (hors sessions Cowork/cloud).
- Plugin en *user scope* : `/plugin install <nom>@<marketplace>` le rend disponible dans tous les projets de la machine, avec mise à jour centralisée.
- Pour restreindre un skill (perso ou projet) dans un repo précis sans le supprimer partout, `skillOverrides` dans `settings.json` accepte les états `on` / `name-only` / `user-invocable-only` / `off` par skill — réglage récent, des bugs ont été rapportés (sans effet dans certaines versions), à vérifier avant de s'y fier.
- Pas de mécanisme de lien natif documenté : un lien symbolique (`ln -s`) vers un dossier de référence central est une solution de contournement possible, pas une fonctionnalité officielle.

**Pourquoi** : évite d'avoir plusieurs copies divergentes du même `SKILL.md` à maintenir manuellement à jour dans chaque projet.

**Limites** : un skill personnel expose sa description à *tous* les projets locaux — pas de sélection fine native par projet en dehors de `skillOverrides`, qui reste le point le plus fragile de ce mécanisme aujourd'hui.

---
Tags : #claude-code #skills
Dernière vérification : septembre 2026
