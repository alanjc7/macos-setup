#!/bin/bash

# Homebrew (+ Cask)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/alan/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

homebrew_packages=(
  git
  yarn\ --ignore-dependencies
)

for package in "${homebrew_packages[@]}"; do
  eval brew install "$package"
done

homebrew_cask_apps=(
  1password
  warp
  arc
  cursor
  tidal
)

for app in "${homebrew_cask_apps[@]}"; do
  eval brew install --cask "$app"
done

brew cleanup


# Cursor (Extensions)
cursor_extensions=(
  anysphere.cursorpyright
  charliermarsh.ruff
  dbaeumer.vscode-eslint
  eamodio.gitlens
  esbenp.prettier-vscode
  ms-azuretools.vscode-containers
  ms-azuretools.vscode-docker
  ms-pyright.pyright
  ms-python.debugpy
  ms-python.python
  oxc.oxc-vscode
  streetsidesoftware.code-spell-checker
)

for extension in "${cursor_extensions[@]}"; do
  eval cursor --install-extension "$extension"
done

# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
