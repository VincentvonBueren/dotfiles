#!bin/bash
# This is the installation file that will install the necessary tools I want
# Should ask for a prompt before each step
# The asterisk next to a name (*) means that it is built from source
echo "Installation Script to setup your system"

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"]]; then
    echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
    curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
    apt-get update
    apt-get install -y build-essential \
        git \
        curl \
        wget \
        ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip \
        openjdk-11-jre-headless \
        lua5.1 luarocks \
elif [[ "$OSTYPE" == "darwin"]]; then
    xcode-select --install
    brew update
    brew tap caskroom/cask
    brew install git curl wget
    brew install pyenv
    brew cask install java
    brew install scala sbt
    brew install rustup
    brew install fzf
    brew install openssl readline sqlite3 xz zlib
fi
####################
# General for both #
####################
mkdir ~/built
cp bash/bashrc ~/.bashrc
cp bash/profile ~/.profile

####################
# linux specific   #
####################
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
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
#####################
# PyEnv* | Python   #
#####################
git clone https://github.com/pyenv/pyenv.git ~/.pyenv 
if [[ "$OSTYPE" == "linux-gnu"]]; then
    sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
fi
#####################
# Rust 
# Rustup
#####################
curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable
#####################
# Exa 
#####################
exec bash
nvm install --lts
pyenv install 3.8.2
cargo install exa
#####################
# Neovim*
#####################
git clone https://github.com/neovim/neovim.git ~/built/neovim
chdir ~/built/neovim
git checkout stable
# Need to install prerequisites
# actual installation
make CMAKE_BUILD_TYPE=Release
make install
#####################
# SBT*
#####################
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
sudo apt-get update
sudo apt-get install sbt
#####################
# Utility
#####################
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
