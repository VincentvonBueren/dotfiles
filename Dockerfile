FROM ubuntu:latest

MAINTAINER Vineeth Voruganti

COPY . ~/ 

# [x] Setup of basic utilities, lua, and java
RUN apt-get update && apt-get install -y -qq --no-install-recommends apt-utils build-essential sudo git wget curl lua5.1 luarocks openjdk-11-jre-headless

# [x] Download NVM, Pyenv, and Rustup
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash && \
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
    curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable -y

# [ ] Setup of Python
# RUN nvm install --lts && \
#    pyenv install 3.7.4

# Neovim installation

