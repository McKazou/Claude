# Utiliser un Skill Claude Code pour réutiliser une procédure entre projets

**Symptôme / contexte** : je veux réutiliser une procédure ou une expertise (méthode, checklist, format à suivre) d'un projet à l'autre, sans la répéter dans chaque CLAUDE.md ni charger tout son contenu en permanence dans le contexte.

**Quoi** : un Skill est un fichier `SKILL.md` (+ fichiers annexes éventuels : scripts, documents de référence, données) qui empaquette une procédure précise ; seuls son nom et sa description tiennent en permanence dans le contexte, le contenu complet n'étant chargé qu'à l'invocation.

**Comment** :
- Le placer dans `.claude/skills/<nom>/SKILL.md` : au niveau du projet (`.claude/skills/`, partagé via git avec l'équipe), au niveau personnel (`~/.claude/skills/`, disponible dans tous mes projets locaux), ou fourni par un plugin/marketplace pour le distribuer plus largement.
- Rédiger une `description` précise dans le frontmatter : c'est elle qui déclenche l'invocation automatique par Claude quand une tâche y correspond.
- Invocation explicite possible via `/nom-du-skill`, en plus de l'invocation automatique par Claude.
- Option `context: fork` pour exécuter le skill dans un sub-agent isolé (tâche de fond) plutôt qu'en ligne dans la session principale.
- Peut embarquer des scripts ou fichiers de référence à côté de `SKILL.md`, chargés par le skill lui-même seulement au besoin.

**Pourquoi** : chargement paresseux (le coût de contexte reste minimal tant que le skill n'est pas déclenché) et réutilisation cohérente d'une même procédure entre projets, sans la dupliquer dans chaque CLAUDE.md.

**Limites** : une description trop vague ou trop pointue dans le frontmatter fait rater le déclenchement automatique, et une fois invoqué le contenu reste en contexte pour le reste de la session (coût récurrent) — pas adapté à une préférence courte et stable (→ CLAUDE.md) ni à une info ponctuelle sans procédure réutilisable. Les skills personnels (`~/.claude/skills`) ne se synchronisent pas vers les sessions cloud/Cowork : il faut les committer dans un repo ou les activer côté compte pour les y retrouver.

---
Tags : #claude-code #skills #memoire
Dernière vérification : septembre 2026
