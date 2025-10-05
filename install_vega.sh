#!/bin/bash

echo "=== Mise à jour Homebrew et installation des dépendances ==="
brew update
brew install binutils coreutils gawk findutils grep jq lz4 gnu-sed watchman

# Installation de Rosetta 2 si architecture Apple Silicon (M1, M2)
ARCH=$(uname -m)
if [[ "$ARCH" == "arm64" ]]; then
  echo "Architecture Apple Silicon détectée. Installation de Rosetta 2..."
  /usr/sbin/softwareupdate --install-rosetta --agree-to-license
else
  echo "Architecture Intel détectée. Pas besoin de Rosetta."
fi

echo "=== Installation Node.js (via Homebrew si absent) ==="
if ! command -v node &> /dev/null; then
  echo "Node.js non trouvé. Installation via Homebrew..."
  brew install node
else
  NODE_VER=$(node --version)
  echo "Node.js déjà installé : $NODE_VER"
fi

echo "=== Vérification de la commande 'code' pour VS Code ==="
if ! which code >/dev/null 2>&1; then
  echo "Commande 'code' non trouvée. Installation de la commande 'code' dans le PATH..."
  echo "Veuillez ouvrir Visual Studio Code, puis dans la palette de commande (Cmd+Shift+P) taper et sélectionner :"
  echo "'Shell Command: Install 'code' command in PATH'"
  echo "Après cela, relancez le terminal et vérifiez en tapant 'which code'."
else
  echo "Commande 'code' trouvée : $(which code)"
fi

echo "=== Installation Vega CLI via npm ==="
npm install -g @amazon/vega-cli

echo "=== Configuration des variables d'environnement ==="
KEPLER_SDK_PATH="$HOME/kepler/sdk/latest" # Adapter si version différente

if ! grep -q "export KEPLER_SDK_PATH" ~/.zshrc; then
  echo "export KEPLER_SDK_PATH=$KEPLER_SDK_PATH" >> ~/.zshrc
  echo 'export PATH=$KEPLER_SDK_PATH/bin:$PATH' >> ~/.zshrc
  echo "Variables d'environnement ajoutées à ~/.zshrc"
else
  echo "Variables d'environnement déjà définies dans ~/.zshrc"
fi

echo "Vous devez ouvrir ou recharger votre terminal (source ~/.zshrc) pour appliquer les changements."

echo "=== Installation complète, pensez à télécharger et installer le SDK Vega depuis le site officiel ==="
echo "Lien officiel : https://developer.amazon.com/fr/docs/vega/0.21/install-vega-sdk.html"

echo "=== Vérification Vega CLI ==="
kepler --version || echo "Commande 'kepler' introuvable. Veuillez redémarrer le terminal."

echo "=== Pensez à activer le mode développeur sur votre Fire TV/Vega OS avant de déployer les apps ==="
