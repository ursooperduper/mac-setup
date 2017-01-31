#!/bin/bash

# Homebrew binaries
binaries=(
  ack
  apg
  archey
  bash-completion git
  caskroom/cask/brew-cask
  curl
  fontconfig
  freetype
  git
  imagemagick
  irssi
  mas
  mysql
  node
  openssl
  rbenv
  readline
  redis
  ruby
  sqlite
  thefuck
  the_silver_searcher
  tmux
)

brew install ${binaries[@]}
