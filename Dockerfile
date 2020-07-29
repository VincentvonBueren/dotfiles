FROM alpine:latest

RUN apk update && apk add -U --no-cache \
    mandoc bash neovim git git-perl \
    tmux openssh-client bash ncurses \
    curl less \
    docker py-pip su-exec \
    ca-certificates openssl coreutils python2 make gcc c++ libgcc \
    linux headers grep util-linux binutils findutil rustup \
    luajit luarocks

ENV HOME      /home/me
# Setup for NVM
ENV NVM_DIR ${HOME}/.nvm 
ENV NODE_VERSION 0.10.33
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.20.0/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install --lts \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# Setup Bash 
COPY bash/bashrc ${HOME}/.bashrc
COPY neovim/ ${HOME}/.config/nvim/
COPY bash/tmux.conf ${HOME}/.tmux.conf
COPY bash/profile ${HOME}/.profile

# Install Vim Plug for plugin management
# RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install plugins
RUN nvim +PlugInstall +qall >> /dev/null

# RUN pip install docker-compose

COPY gitconfig ${HOME}/.gitconfig

COPY entrypoint.sh /bin/entrypoint.sh

WORKDIR ${HOME}

CMD ["/bin/entrypoint.sh"]
