# Bonnes pratiques pour rédiger un SKILL.md

**Symptôme / contexte** : j'ai créé un skill mais Claude Code ne le déclenche jamais (ou le déclenche mal), ou son contenu est devenu trop long et confus à l'usage.

**Quoi** : un ensemble de règles d'écriture pour que la description déclenche le skill au bon moment et que son contenu reste exploitable une fois chargé.

**Comment** :
- Description du frontmatter : phrase factuelle à la 3e personne qui dit CE QUE fait le skill ET QUAND l'utiliser, avec des mots-clés concrets — c'est le seul texte permanent en contexte, il doit suffire à décider de le charger ou non.
- Un skill = une procédure précise, comme pour les fiches mémoire ; si le sujet a plusieurs variantes indépendantes, faire plusieurs skills plutôt qu'un seul avec des sections fourre-tout.
- Rédiger le corps comme des instructions à suivre par Claude (étapes, règles, checklist), pas comme une explication narrative destinée à un humain.
- Progressive disclosure : garder `SKILL.md` court, déporter le détail volumineux (scripts, longues références, exemples) dans des fichiers annexes du même dossier, chargés seulement si le skill les invoque.
- Nom du dossier en kebab-case cohérent avec la description, pas un nom générique.
- Tester le déclenchement avec des formulations réalistes de demande utilisateur, pas seulement en tapant le nom du skill.

**Pourquoi** : une description trop vague ou trop pointue fait rater le déclenchement automatique dans un sens ou dans l'autre, et un skill trop chargé ou mal structuré coûte du contexte inutilement à chaque invocation.

**Limites** : ces règles portent sur la rédaction du contenu ; pour savoir où placer le fichier et comment il est chargé, voir [utiliser-un-skill-claude-code.md](utiliser-un-skill-claude-code.md).

---
Tags : #claude-code #skills #methode
Dernière vérification : septembre 2026
