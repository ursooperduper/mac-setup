#!/bin/bash

# Install brew cask font compatible fonts
fonts=(
  font-anonymous-pro
  font-arvo
  font-baumans
  font-bowlby-one
  font-bree-serif
  font-cabin
  font-cabin-condensed
  font-cabin-sketch
  font-comfortaa
  font-droid-sans-mono
  font-droid-sans
  font-droid-serif
  font-fira-mono
  font-fira-code
  font-fira-sans
  font-hack
  font-inconsolata
  font-lato
  font-lobster
  font-montserrat
  font-offside
  font-open-sans
  font-open-sans-condensed
  font-paytone-one
  font-source-code-pro
  font-source-sans-pro
  font-ubuntu
  font-titan-one
  font-varela
)

brew cask install ${fonts[@]}
