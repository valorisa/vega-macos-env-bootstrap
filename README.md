# vega-macos-env-bootstrap

Ce projet permet d'automatiser l'installation des outils Amazon Vega Developer Tools sur macOS (Intel ou Apple Silicon), incluant toutes les dépendances système, la configuration du terminal, l’installation du SDK Vega, et la préparation de Visual Studio Code pour le développement d'applications Vega OS.

## Fonctionnalités

- Installation automatisée des prérequis via Homebrew et npm.
- Détection de l’architecture Apple Silicon, installation de Rosetta si nécessaire.
- Configuration du chemin et vérification de la commande VS Code `code`.
- Installation du Vega CLI globalement via npm.
- Ajout des variables d’environnement nécessaires au terminal.
- Instructions pour installer le SDK Vega et activer le mode développeur sur Fire TV.

## Prérequis

- macOS 10.15 ou supérieur.
- Homebrew installé (`brew --version`).
- Node.js 16.x ou supérieur (`node --version`).
- Visual Studio Code installé.

## Installation

Cloner le projet et exécuter le script principal :

```sh
git clone https://github.com/valorisa/vega-macos-env-bootstrap.git
cd vega-macos-env-bootstrap
chmod +x install_vega.sh
./install_vega.sh
```

## Documentation officielle Vega

[Guide d'installation Amazon Vega SDK](https://developer.amazon.com/fr/docs/vega/0.21/install-vega-sdk.html)

## Licence

MIT

## Auteur
valorisa (Oct. 2025)

