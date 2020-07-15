FROM alpine:latest

RUN apk update && apk add -U --no-cache \
    mandoc bash neovim git git-perl \
    tmux openssh-client bash ncurses \
    curl less \
    docker py-pip su-exec \
    ca-certificates openssl coreutils python2 make gcc c++ libgcc \
    linux headers grep util-linux binutils findutil

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash

ENV HOME /home/me

COPY bash/bashrc ${HOME}/.bashrc
COPY neovim/ ${HOME}/.config/nvim/
COPY bash/tmux.conf ${HOME}/.tmux.conf
COPY bash/profile ${HOME}/.profile

# Install Vim Plug for plugin management
# RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install plugins
RUN nvim +PlugInstall +qall >> /dev/null

# RUN pip install docker-compose

WORKDIR ${HOME}
