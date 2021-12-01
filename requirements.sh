#!/usr/bin/env bash

ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

function ok() {
  echo -e "$COL_GREEN [ok]$COL_RESET "$1
}

function bot() {
  echo -e "\n$COL_GREEN\[._.]/$COL_RESET - "$1
}

function running() {
  echo -e "$COL_CYAN ⇒ $COL_RESET "$1": "
}

function action() {
  echo -e "\n$COL_YELLOW [action]:$COL_RESET\n ⇒ $1"
}

function warn() {
  echo -e "$COL_YELLOW [warning]$COL_RESET "$1
}

function error() {
  echo -e "$COL_RED [error]$COL_RESET "$1
}

bot "Hello! Let's get some stuff ready for your new computer"

bot "Installing osx command line tools"
xcode-select --install

# create a symblink for all zsh files
ln -sf ~/dotfiles/zsh_files/.* ~/

# install brew
running "Installing brew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

running "Updating to most recent brew version"
brew doctor
brew update
ok

running "Downloading oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ok

bot "Setting zsh as the user shell"
chsh -s /bin/zsh
ok

running "Downloading nvm"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh)"

source zsh_files/.zshrc

running "Installing the latest stable version of node"
nvm install

running "Installing zx globally"
npm i -g zx

source zsh_files/.zshrc
ok

bot "Whooo, all set! "
bot "Run zx ./setup.sh to setup your environment"