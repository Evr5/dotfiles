 #!/bin/bash

# Naviguer vers le répertoire ~/.config
cd ~/.config || exit 1

# Récupérer les dernières modifications depuis le dépôt distant
git pull origin master

# Ajouter les nouvelles modifications locales
git add --all

# Faire un commit automatique avec un message de mise à jour
git commit -m "Sync configurations at $(date)" || echo "No changes to commit"

# Pousser les modifications vers le dépôt distant
git push origin master
