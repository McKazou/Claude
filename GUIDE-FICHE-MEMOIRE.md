# Guide : comment écrire une fiche mémoire

> Ce document est la référence à suivre pour créer ou modifier une fiche dans ce dossier. Objectif : qu'une fiche se comprenne (quoi, comment, pourquoi, limites) en quelques secondes de lecture, sans avoir à tout relire.

## Quand créer une nouvelle fiche

Une fiche par technique/astuce/pattern précis — pas une fiche "Claude Code en général". Si un sujet a plusieurs variantes indépendantes (ex. "gestion du contexte" et "sub-agents"), ce sont deux fiches, pas une avec deux sections.

Avant de créer une fiche, vérifier dans `SOMMAIRE.md` que le sujet n'existe pas déjà (même partiellement) — dans ce cas, compléter la fiche existante plutôt que d'en créer une nouvelle.

## Structure fixe d'une fiche

Chaque fiche est un fichier Markdown autonome de ce format :

```markdown
# [Titre court, concret, orienté action]

**Symptôme / contexte** : dans quelle situation je me souviens que cette fiche existe (1 ligne).

**Quoi** : ce que fait la technique (1-2 lignes).

**Comment** :
- Étape ou règle 1
- Étape ou règle 2
- (3-6 puces max, pas de paragraphe)

**Pourquoi** : le problème que ça évite ou le gain (1 ligne).

**Limites** : quand ne pas l'utiliser, pièges connus, cas où ça ne marche pas (1-2 lignes).

---
Tags : #tag1 #tag2
Dernière vérification : mois année
```

Rien d'autre. Pas d'introduction narrative, pas de section "contexte historique". Si une explication dépasse ce format, c'est que le sujet doit être scindé en plusieurs fiches.

### Contrainte de longueur
Une fiche tient sur un écran sans scroller (hors exemples de code longs, qui peuvent être repliés ou mis en fin de fichier). Si ça dépasse : couper, pas résumer en petit texte.

### Exemple de fiche courte

```markdown
# Sortir du Plan Mode seulement après relecture du PLAN.md

**Symptôme / contexte** : Claude Code commence à coder avant que le plan soit vraiment validé.

**Quoi** : le Plan Mode empêche Claude Code d'écrire du code tant qu'il n'est pas désactivé.

**Comment** :
- Activer avec `Shift+Tab` jusqu'à « plan mode on »
- Demander un plan écrit dans `PLAN.md`
- Relire PLAN.md par rapport au besoin réel avant de sortir du mode
- Désactiver avec `Shift+Tab` seulement une fois validé

**Pourquoi** : corriger une erreur de compréhension dans un plan coûte rien ; la corriger après implémentation coûte cher.

**Limites** : inutile sur une tâche au périmètre évident et court — ça ralentit sans bénéfice.

---
Tags : #claude-code #planification
Dernière vérification : septembre 2026
```

## Nommage de fichier

- kebab-case, en français, descriptif : `plan-mode-avant-implementation.md`, pas `tip3.md`.
- Un fichier = une fiche = un sujet. Pas de fichier fourre-tout.
- Placer le fichier dans le dossier `fiches/`.

## Mise à jour du sommaire (obligatoire à chaque ajout)

Après avoir créé ou complété une fiche, mettre à jour `SOMMAIRE.md` :
- Passer le statut du sujet de `⬜ à faire` à `✅ fait`
- Ajouter le lien hypertexte relatif vers le fichier
- Garder les tags cohérents avec ceux de la fiche

Chaque ligne du sommaire a un ID numérique unique (colonne `ID`), attribué une fois pour toutes dans l'ordre d'apparition dans le document. Pour ajouter une nouvelle ligne, lui donner le numéro suivant (max actuel + 1) — ne jamais réutiliser ou renuméroter un ID existant, l'utilisateur s'en sert pour désigner un sujet ("la fiche numéro 6").

Ne jamais laisser une fiche créée sans entrée correspondante dans le sommaire — le sommaire est le seul point d'entrée pour retrouver une fiche.

## Ce que Claude Code doit faire quand on lui demande d'ajouter un sujet

1. Vérifier dans `SOMMAIRE.md` si le sujet existe déjà (fait ou à faire).
2. Créer le fichier dans `fiches/` en suivant strictement la structure ci-dessus.
3. Mettre à jour `SOMMAIRE.md` (statut + lien + tags).
4. Ne pas ajouter de sujets au sommaire qui n'ont pas été explicitement demandés, sauf s'il s'agit de propositions marquées clairement comme telles (voir en fin de sommaire).
