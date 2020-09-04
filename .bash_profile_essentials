# brew maintenance function

brewup() {
    brew update;
    brew upgrade;
    brew prune;
    brew cleanup;
    brew doctor;
    rm -rf $(brew --cache);
    brew cask update;
    brew cask upgrade;
    brew cask doctor;
}

# NVM Admin

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
