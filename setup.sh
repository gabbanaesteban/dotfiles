#!/usr/bin/env zsh
source resources.sh

bot "hello! welcome to your new computer"
bot "let's get going! "

bot "installing osx command line tools"
xcode-select --install

# make dotfiles hidden
running "hiding dotfiles"
mv ~/dotfiles ~/.dotfiles
ok

# install brew
running "installing brew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

if [[ $? != 0 ]]; then
    error "unable to install homebrew -> quitting setup"
    exit 2
fi

running "updating to most recent brew version"
brew doctor
brew update
ok

running "Select which bundled brew & brew-cask packages you want to install"
source installs/brew_installs
ok "feel free to add more brew packages! "

# globally install key npm pkgs
running "Select which bundled npm modules you want to install"
source installs/npm_installs
ok "feel free to add more npm modules! "

# globally install important gems
running "Select which bundled gems you want to install"
source installs/gem_installs
ok "feel free to add more ruby gems! "

#globally install atom packages
running "select the composer packages you would like to install"
source installs/composer_installs
ok "feel free to add more atom packages! "

running "downloading oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [[ $? != 0 ]]; then
  error "unable to install oh-my-zsh -> quitting setup"
  exit 2
fi
ok

bot "setting zsh as the user shell"
chsh -s /bin/zsh
ok

running "sourcing osx defaults"
source config/.osx
ok

bot "whooo, all set! "
