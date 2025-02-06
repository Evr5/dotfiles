#!/bin/bash

# Vérifier si Google Chrome est installé
if ! command -v google-chrome-stable &> /dev/null; then
    echo "❌ Google Chrome n'est pas installé !"
    exit 1
fi

# Définition du chemin du fichier .desktop
DESKTOP_FILE="/usr/share/applications/google-chrome.desktop"

# Sauvegarde du fichier original (une seule fois)
BACKUP_FILE="$DESKTOP_FILE.bak"
if [ ! -f "$BACKUP_FILE" ]; then
    sudo cp "$DESKTOP_FILE" "$BACKUP_FILE"
    echo "✅ Sauvegarde du fichier .desktop effectuée."
fi

# Modification du fichier .desktop pour forcer l'utilisation de Wayland Ozone
sudo sed -i 's|Exec=/usr/bin/google-chrome-stable|Exec=/usr/bin/google-chrome-stable --ozone-platform=wayland --enable-features=UseOzonePlatform|' "$DESKTOP_FILE"

echo "✅ Google Chrome est maintenant configuré pour Hyprland avec Wayland Ozone !"

# Définition de l'alias pour le terminal
SHELL_CONFIG="$HOME/.bashrc"
[ -f "$HOME/.zshrc" ] && SHELL_CONFIG="$HOME/.zshrc"

if ! grep -q "alias chrome=" "$SHELL_CONFIG"; then
    echo 'alias chrome="google-chrome-stable --ozone-platform=wayland --enable-features=UseOzonePlatform"' >> "$SHELL_CONFIG"
    echo "✅ Alias ajouté dans $SHELL_CONFIG"
fi

echo "🚀 Redémarre ta session Hyprland pour appliquer les changements."

