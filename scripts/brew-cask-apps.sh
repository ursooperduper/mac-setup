#!/bin/bash

# Install apps with brew cask
apps=(
  adobe-creative-cloud
  aerial
  alfred
  atom
  bartender
  bittorrent
  boom
  caffeine
  cleanmymac
  dash
  dropbox
  evernote
  firefox
  google-chrome
  hex-fiend
  iterm2
  iterm2-beta
  kindle
  minecraft
  myo-connect
  narrative-uploader
  noizio
  omnigraffle
  poolside-fm
  postgres
  processing
  reflector
  sizeup
  sketch
  sketch-toolbox
  skitch
  slack
  sonos
  spotify
  steam
  transmit
  unrarx
  vox
)

brew cask install ${apps[@]}
