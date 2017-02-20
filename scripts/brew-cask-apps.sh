#!/bin/bash

# Install apps with brew cask
apps=(
  adobe-creative-cloud
  aerial
  alfred
  atom
  bartender
  boom
  caffeine
  cleanmymac
  dropbox
  duet
  fantastical
  firefox
  framer
  google-chrome
  google-drive
  heroku-toolbelt
  hex-fiend
  iconjar
  iterm2
  iterm2-beta
  jadengeller-helium
  kindle
  noizio
  nudgit
  processing
  quadrosync
  raindropio
  reflector
  rescuetime
  sketch
  sketch-toolbox
  slack
  sonos
  switchresx
  unrarx
  xscope
)

brew cask install ${apps[@]}
