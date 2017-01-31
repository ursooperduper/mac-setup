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
  firefox
  framer-studio
  google-chrome
  google-drive
  heroku-toolbelt
  hex-fiend
  iterm2
  iterm2-beta
  jadengeller-helium
  kindle
  knock
  narrative-uploader
  noizio
  nudgit
  poolside-fm
  processing
  quadrosync
  reflector
  sizeup
  sketch
  sketch-toolbox
  slack
  sonos
  switchresx
  unrarx
  xscope
  zeplin
)

brew cask install ${apps[@]}
