# Appliquer des règles de sécurité de l'information dans un projet

**Symptôme / contexte** : pendant le développement courant d'un projet, un risque de sécurité (secret exposé, entrée non validée, donnée sensible mal protégée) peut être introduit sans qu'on s'en rende compte, et n'être détecté que tardivement en revue.

**Quoi** : un socle de règles de sécurité à appliquer par défaut au fil du développement, pas seulement lors d'une revue finale.

**Comment** :
- Ne jamais committer de secret en clair (clé API, mot de passe, token, certificat) — passer par variables d'environnement ou gestionnaire de secrets, et relire le diff avant tout commit.
- Valider/assainir les entrées aux frontières du système (entrée utilisateur, appel externe) ; faire confiance au code interne plutôt que dupliquer la validation partout.
- Traiter explicitement les vulnérabilités courantes concernées par le changement en cours (injection, XSS, désérialisation, SSRF, etc.) plutôt que de compter sur une revue pour les repérer après coup.
- Appliquer le principe du moindre privilège : un composant n'a accès qu'aux ressources dont il a réellement besoin.
- Ne jamais journaliser de donnée sensible (secret, donnée personnelle, token) même en environnement de debug.
- Sur un projet à surface sensible, lancer une revue de sécurité dédiée avant une mise en production ou une livraison majeure (skill `security-review`), plutôt que de se fier aux seuls tests fonctionnels.

**Pourquoi** : corriger une faille pendant le développement coûte nettement moins cher que la découvrir après coup, et une vigilance appliquée en continu réduit le nombre de failles qui atteignent la revue.

**Limites** : ce socle de vigilance courante ne remplace pas une revue de sécurité formelle ou un audit externe sur un projet à enjeu réel.

→ Skill : `Skills/securite-information-projet/SKILL.md`

---
Tags : #securite #methode
Dernière vérification : septembre 2026
