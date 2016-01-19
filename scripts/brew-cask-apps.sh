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
  framer-studio
  google-chrome
  heroku-toolbelt
  hex-fiend
  iterm2
  iterm2-beta
  kindle
  knock
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
  steam
  unrarx
)

brew cask install ${apps[@]}
