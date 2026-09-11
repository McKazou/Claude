# Piloter un projet applicatif découpé en lots

**Symptôme / contexte** : je démarre un nouveau projet découpé en lots/jalons et je ne me souviens plus de laquelle des règles apprises sur un projet précédent s'applique à quel moment.

**Quoi** : point d'entrée qui regroupe 5 règles complémentaires pour piloter un tel projet, chacune détaillée dans sa propre fiche — celle-ci ne documente rien elle-même, elle aide à naviguer vers la bonne fiche selon le besoin du moment.

**Comment** — dans l'ordre où ces règles s'appliquent typiquement sur un lot :
- Dès le lot 1, mettre en place les deux documents vivants → [documents-vivants-plan-et-control-plan.md](documents-vivants-plan-et-control-plan.md)
- Avant d'implémenter une demande limite, vérifier son lot réel → [verifier-perimetre-lot-avant-implementation.md](verifier-perimetre-lot-avant-implementation.md)
- Si l'architecture sépare métier et interface, garantir cette séparation par un test → [tester-separation-metier-ui-imports.md](tester-separation-metier-ui-imports.md)
- Avant de clore un lot, relancer réellement l'application → [smoke-test-avant-cloture-lot.md](smoke-test-avant-cloture-lot.md)
- Face à une demande ambiguë ou structurante, changer de mode de travail → [quand-passer-en-mode-plan.md](quand-passer-en-mode-plan.md)

**Pourquoi** : regrouper ces cinq points en un seul endroit évite d'en oublier un au démarrage d'un projet, sans les mélanger dans une fiche unique illisible — chaque règle reste retrouvable et applicable isolément.

**Limites** : cette fiche ne remplace pas la lecture de la fiche cible — si une règle doit être mise à jour ou précisée, éditer la fiche concernée, pas celle-ci.

---
Tags : #claude-code #planification #methode
Dernière vérification : septembre 2026
