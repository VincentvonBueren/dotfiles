FROM ubuntu:latest

MAINTAINER Vineeth Voruganti

COPY . ~/ 

# Setup of basic utilities, lua, and java
RUN apt-get update && apt-get install -y -qq --no-install-recommends apt-utils build-essential sudo git wget curl lua luarocks openjdk-11-jre-headless

# Setup of NodeJS
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash && \
    nvm install -lts \

# Setup of Python
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
    pyenv install 3.7.4

# Setup Rust and Exa
RUN curl https://sh.rustup.rs -sSf | sh && \
    rustup install stable \
    cargo install exa
