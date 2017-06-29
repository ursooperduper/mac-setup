#!/bin/bash

clear

echo "*************************************************************************"
echo "**                              Mac Setup                              **"
echo "*************************************************************************"
echo -e "\n"

read -p "Are you ready to set up your Mac in the most awesome way? (y/n)  " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  printf "\n\nYou're awesome. Let's get started...\n\n"
else
  printf "\n\nToo awesome for you?\n\nGo it alone then.\nBye.\n\n\n"
  return
fi

if [ -d /Applications/Xcode.app -o -d ~/Applications/Xcode.app ]; then
  printf "  ✅  Xcode installed.\n"
  if xcode-select --print-path > /dev/null; then
    printf "  ✅  Command Line Tools installed.\n"
  else
    printf "  ❗️  Command Line Tools are not installed.\n"
    printf "  🔶  Attempting to install Command Line Tools...\n"
    xcode-select --install
    printf "  ✅  Command Line Tools installed.\n"
  fi
else
  printf "  ❗️  Xcode is not installed.\n\nPlease install Xcode and then re-run this script."
  open /Applications/App\ Store.app
  return
fi
printf "  🔶  Attempting to agree to Xcode terms...\n"
sudo xcrun cc
printf "  ✅  Xcode terms agreed to.\n"

if [ -f ~/.ssh/id_rsa.pub ]; then
  printf "  ✅  SSH Key exists.\n\n"
else
  printf "\n  🔶  Setting up your SSH key...\n"
  read -p "Please enter your email address...carefully: "
  printf "  🔶  Attempting to create SSH key...\n"
  ssh-keygen -t rsa -C "$REPLY"
  printf "  ✅  SSH Key created.\n"
fi

printf "  🔶  Copying public key to the clipboard...\n"
pbcopy < ~/.ssh/id_rsa.pub
printf "  ✅  SSH Key copied to the clipboard.\n\n"

read -p "  🔶  Log on to Github to add your SSH key. When you've done that, return here and press 'C' to continue...  " -n 1 -r

if [[ $REPLY =~ ^[Cc]$ ]]; then
  printf "\n\n  ✅  SSH key added to Github\n"
fi

cd ~
# .atom repo: This repository contains config files for Atom.
if [ ! -d ~/.atom ]; then
  printf "  🔶  Attempting to clone .atom repo...\n"
  git clone git@github.com:ursooperduper/.atom.git
  printf "  ✅  .atom repo cloned\n"
fi

if [ ! -d ~/code/personal ]; then
  printf "  🔶  Creating ~/code/personal...\n"
  mkdir -p ~/code/personal
  printf "  ✅  Created ~/code/personal\n"
else
  printf "  ✅  ~/code/personal already exists\n"
fi

if [ ! -d ~/code/work ]; then
  printf "  🔶  Creating ~/code/work...\n"
  mkdir -p ~/code/work
  printf "  ✅  Created ~/code/work\n"
else
  printf "  ✅  ~/code/work already exists\n"
fi

if [ ! -d ~/code/third-party ]; then
  printf "  🔶  Creating ~/code/third-party...\n"
  mkdir -p ~/code/third-party
  printf "  ✅  Created ~/code/third-party\n"
else
  printf "  ✅  ~/code/third-party already exists\n"
fi

printf "  🔶  Moving to ~/code/personal...\n"
cd ~/code/personal

# keys repo: This private repository contains various API keys.
if [ ! -d ~/code/personal/keys ]; then
  printf "  🔶  Attempting to clone keys repo...\n"
  git clone git@github.com:ursooperduper/keys.git
  printf "  ✅  Cloned keys repo\n"
fi
printf "  🔶  Attempting to export keys...\n"
. keys/.keys
printf "  ✅  Keys exported\n"

printf "  🔶  Attempting to symlink .gitconfig...\n"
ln -s ~/code/personal/keys/.gitconfig ~/.gitconfig
printf "  ✅  .gitconfig symlinked\n"


# dotfiles: This repository contains personal configuration files for various tools.
if [ ! -d ~/code/personal/dotfiles ]; then
  printf "  🔶  Attempting to clone dotfiles repo...\n"
  git clone git@github.com:ursooperduper/dotfiles.git
  printf "  ✅  Cloned dotfiles repo\n"
fi

# Create symlinks for important files.
printf "  🔶  Attempting to symlink .bash-bindings...\n"
ln -s ~/code/personal/dotfiles/.bash-bindings ~/.bash-bindings
printf "  ✅  .bash-bindings symlinked\n"

printf "  🔶  Attempting to symlink .bash-profile...\n"
ln -s ~/code/personal/dotfiles/.bash_profile ~/.bash_profile
printf "  ✅  .bash-profile symlinked\n"

printf "  🔶  Attempting to symlink .bashrc...\n"
ln -s ~/code/personal/dotfiles/.bashrc ~/.bashrc
printf "  ✅  .bashrc symlinked\n"

printf "  🔶  Attempting to symlink .gemrc...\n"
ln -s ~/code/personal/dotfiles/.gemrc ~/.gemrc
printf "  ✅  .bashrc symlinked\n"

printf "  🔶  Attempting to symlink .git_completion.sh...\n"
ln -s ~/code/personal/dotfiles/.git_completion.sh ~/.git_completion.sh
printf "  ✅  .git-completion symlinked\n"

printf "  🔶  Attempting to symlink .gitignore...\n"
ln -s ~/code/personal/dotfiles/.gitignore ~/.gitignore
printf "  ✅  .gitignore symlinked\n"

printf "  🔶  Attempting to symlink .tmux.conf...\n"
ln -s ~/code/personal/dotfiles/.tmux.conf ~/.tmux.conf
printf "  ✅  .tmux.conf symlinked\n"

printf "  🔶  Attempting to symlink .vimrc...\n"
ln -s ~/code/personal/dotfiles/.vimrc ~/.vimrc
printf "  ✅  .vimrc symlinked\n"

# Install Homebrew (package manager).
if [ hash brew 2 >/dev/null ]; then
  printf "  🔶  Installing Homebrew...\n"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  printf "  ✅  Homebrew installed\n\n"
fi

# Install version support in Homebrew.
printf "  🔶  Installing Homebrew cask versions...\n"
brew tap caskroom/versions
printf "  ✅  Brew Cask Versions installed\n"

# Install Homebrew binaries.
cd ~/mac-setup-master
printf "  🔶  Installing Homebrew binaries...\n"
. scripts/brew-binaries.sh
printf "  ✅  Brew binaries installed\n"

# Install Homebrew cask (support for managing apps via Homebrew)
printf "  🔶  Installing Homebrew cask\n"
brew tap caskroom/cask
printf "  ✅  Brew cask installed\n"

# Install Homebrew cask binaries.
. scripts/brew-cask-apps.sh
printf "  ✅  Brew Cask binaries installed\n"

# Install Homebrew font support.
brew tap caskroom/fonts
printf "  ✅  Brew Cask Fonts installed\n"

# Install Homebrew cask fonts.
. scripts/brew-fonts.sh
printf "  ✅  Brew cask fonts installed\n"

# Install gems
. gems.sh
printf "  ✅  Gems installed\n"

# Install RVM
printf " Attempting to install RVM"
\curl -sSL https://get.rvm.io | bash -s stable
prinf "  ✅  Installed RVM"

# Clone projects from git
cd ~/code/personal

# Blog
# git clone git@github.com:ursooperduper/ursooperduper.github.io.git
# printf "  ✅  Blog repo cloned\n"
# cd ~/code/personal/ursooperduper.github.io
# npm install
# bundle install

# Cheatsheets
cd ~/code/personal
git clone git@github.com:ursooperduper/cheatsheets.git
printf "  ✅  Cheatsheets repo cloned\n"
cd ~/code/personal/cheatsheets
npm install
bundle install

# Prototypes
# cd ~/code/personal
# git clone git@github.com:ursooperduper/prototypes.git
# printf "  ✅  Prototypes repo cloned\n"
# cd ~/code/personal/prototypes
# npm install
# bundle install

# Mac-Setup
cd ~/code/personal
git clone git@github.com:ursooperduper/mac-setup.git
printf "  ✅  Mac Setup repo cloned\n"

cd ~/mac-setup-master
printf "\n\nYour Mac set-up is now complete. Thanks for playing. You can delete this directory now"
return
