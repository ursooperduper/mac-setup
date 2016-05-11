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
  mysql
  node
  openssl
  redis
  ruby
  sqlite
  the_silver_searcher
  tmux
)

brew install ${binaries[@]}
