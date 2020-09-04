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
  rebornix.ruby
  misogi.ruby-rubocop
  wingrunr21.vscode-ruby
  ms-vsliveshare.vsliveshare-pack
  vayan.haml
)

for extension in "${vscode_extensions[@]}"; do
  eval code --install-extension "$extension"
done
