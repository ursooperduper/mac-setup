#!/bin/bash

# Install apps with brew cask
apps=(
  adobe-creative-cloud
  aerial
  alfred
  bartender
  caffeine
  cleanmymac
  dropbox
  duet
  fantastical
  firefox
  flinto
  framer
  github-desktop
  google-chrome
  grammarly
  hex-fiend
  iconjar
  iterm2
  jadengeller-helium
  kindle
  lingo
  noun-project
  noizio
  nudgit
  obs
  processing
  quadrosync
  reflector
  sketch
  slack
  sonos
  spotify
  timing
  transmit
  unrarx
  visual-studio-code
  xscope
)

brew cask install ${apps[@]}
