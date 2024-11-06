#!/bin/bash

# Naviguer vers le répertoire ~/.config
cd ~/.config || exit 1

# Ajouter les nouvelles modifications locales
git add --all

# Faire un commit automatique avec un message de mise à jour
git commit -m "Sync configurations at shutdown $(date)" || echo "No changes to commit"

# Pousser les modifications vers le dépôt distant
git push origin main