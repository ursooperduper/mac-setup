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
  dash
  dropbox
  firefox
  framer-studio
  google-chrome
  google-drive
  heroku-toolbelt
  hex-fiend
  iterm2
  iterm2-beta
  kindle
  knock
  noizio
  omnigraffle
  omniplan
  poolside-fm
  processing
  reflector
  sizeup
  sketch
  sketch-toolbox
  slack
  sonos
  unrarx
  xscope
  zeplin
)

brew cask install ${apps[@]}
