#!/bin/bash

# Homebrew (+ Cask)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

homebrew_packages=(
  bash
  bash-completion
  git
  watchman
  yarn\ --ignore-dependencies
)

for package in "${homebrew_packages[@]}"; do
  eval brew install "$package"
done

homebrew_cask_apps=(
  1password
  visual-studio-code
  evernote
  google-chrome
  firefox
  iterm2
  postman
  slack
  tidal
)

for app in "${homebrew_cask_apps[@]}"; do
  eval brew cask install "$app"
done

brew cleanup


# VSCode (Extensions)
vscode_extensions=(
  dbaeumer.vscode-eslint
  eamodio.gitlens
  esbenp.prettier-vscode
  mechatroner.rainbow-csv
  misogi.ruby-rubocop
  ms-azuretools.vscode-docker
  ms-vscode-remote.remote-containers
  ms-vsliveshare.vsliveshare
  ms-vsliveshare.vsliveshare-audio
  ms-vsliveshare.vsliveshare-pack
  octref.vetur
  rebornix.ruby
  streetsidesoftware.code-spell-checker
  syler.sass-indented
  vayan.haml
  wingrunr21.vscode-ruby
)

for extension in "${vscode_extensions[@]}"; do
  eval code --install-extension "$extension"
done
