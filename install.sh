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
cp bash/bashrc ~/.bashrc
cp /bash/profile ~/.profile

####################
# linux specific   #
####################
# curl, wget, git, docker, kubernetes
apt-get update

## Build Essential
apt-get install -y build-essential git curl wget ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

#####################
# Mac OS specific   #
#####################
# Xcode command line tools
# Brew
# Cask


#####################
# NVM* | LTS NodeJS #
#####################
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
nvm install -lts

#####################
# PyEnv* | Python   #
#####################
git clone https://github.com/pyenv/pyenv.git ~/.pyenv 
pyenv install 3.7.4
#####################
# Lua 
# Lua Rocks
#####################
apt-get install -y lua5.1 luarocks
#####################
# Rust 
# Rustup
#####################
curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable

#####################
# Java JDK
#####################
apt install openjdk-11-jre-headless

#####################
# Scala
# SBT
#####################
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
sudo apt-get update
sudo apt-get install sbt

#####################
# Exa 
#####################
cargo install exa
#####################
# Neovim*
#####################

git clone https://github.com/neovim/neovim.git ~/built/neovim
chdir ~/built/neovim
git checkout stable

# Need to install prerequisites
