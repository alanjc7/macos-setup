#!/bin/bash

function query_github_api {
  eval curl "${2:-'-sL'}" "https://api.github.com/$1"
}

function query_raw_github_user_content {
  eval curl "${2:-'-sL'}" "https://raw.githubusercontent.com/$1"
}

function get_latest_tag_name {
  query_github_api "repos/$1/releases/latest" | grep 'tag_name' | sed -E 's/.*"([^"]+)".*/\1/'
}

# Setup Bash profile
[ ! -e "$HOME/.bash_profile" ] && touch "$HOME/.bash_profile"
cat .bash_profile_essentials >> "$HOME/.bash_profile"


# Node Version Manager
repository="creationix/nvm"
tag_name=$(get_latest_tag_name "$repository")

if [[ -e "$HOME/.nvm/nvm.sh" ]]; then
  # shellcheck source=/dev/null
  . "$HOME/.nvm/nvm.sh"
fi

if [[ ! -d "$HOME/.nvm/.git" ]] || [[ $(nvm --version) != "${tag_name#'v'}" ]]; then
  query_raw_github_user_content "$repository/$tag_name/install.sh" | bash

  if [[ ! -s $(nvm which "$(nvm version-remote stable)") ]]; then
    nvm install stable && nvm alias default stable
  fi

  nvm cache clear
fi


# Homebrew (+ Cask)
if [[ -z $(command -v brew) ]]; then
  ruby -e "$(query_raw_github_user_content "homebrew/install/master/install" "-fsSL")"
else
  brew update && brew upgrade
fi

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
  atom
  evernote
  google-chrome
  iterm2
  postman
  slack
  tidal
)

for app in "${homebrew_cask_apps[@]}"; do
  eval brew cask install "$app"
done

brew cleanup


# Atom (packages)
atom_packages=(
  editorconfig
  git-blame
  hyperclick
  linter
  linter-eslint
  linter-rubocop
  linter-ui-default
  minimap
  minimap-linter
  pigments
  prettier-atom
)

for package in "${atom_packages[@]}"; do
  if [[ ! -d "$HOME/.atom/packages/$package" ]]; then
    eval apm install "$package"
  fi
done
