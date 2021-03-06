#!/bin/bash

# Install apps with brew cask
apps=(
  adobe-creative-cloud
  aerial
  alfred
  astro
  astropad
  bartender
  caffeine
  cleanmymac
  dropbox
  duet
  fantastical
  figma
  firefox
  flinto
  framer
  front
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
  sip
  sketch
  slack
  sonos
  spotify
  station
  timing
  transmit
  unrarx
  visual-studio-code
  xscope
  zoom
)

brew cask install ${apps[@]}
