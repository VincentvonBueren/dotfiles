#!bin/bash
# This is the installation file that will install the necessary tools I want
# Should ask for a prompt before each step
# The asterisk next to a name (*) means that it is built from source
echo "Installation Script to setup your system"

# Detect OS

####################
# General for both #
####################
mkdir ~/built


####################
# linux specific   #
####################
# curl, wget, git, docker, kubernetes
apt-get update

## Build Essentials

apt-get install build-essentials

#####################
# Mac OS specific   #
#####################
# Xcode command line tools
# Brew
# Cask


#####################
# NVM* | LTS NodeJS #
#####################

#####################
# PyEnv* | Python   #
#####################

#####################
# Lua 
# Lua Rocks
#####################

#####################
# Scala
# SBT
#####################

#####################
# Rust 
# Rustup
#####################

#####################
# Java JDK
#####################

#####################
# Exa 
#####################

#####################
# Neovim*
#####################

git clone https://github.com/neovim/neovim.git ~/built/neovim
chdir ~/built/neovim
git checkout stable

# Need to install prerequisites



# Bashrc and profile

cp bash/bashrc ~/.bashrc
cp /bash/profile ~/.profile
