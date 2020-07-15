# Dotfiles

This repository contains all of the seutp scripts that I can use to configure a new computer or workspace. The programs that
are being setup include the following.

- ~Neovim~
- ~Python and PyEnv~
- ~Nodejs and NVM~
- ~Lua and Luarocks~
- ~Rust, Cargo, and Rustup~
- ~Bash (rc and profile)~
- ~Alacritty~
- ~Exa~
- ~scala and sbt~

It will also contains scripts that will be used to differentiate between linux
and MacOS systems

## To do

Recreate the ide setup from https://github.com/ls12styler/ide/blob/master/Dockerfile

## Testing procedure

1. First build the docker file

```bash
sudo docker build -t {insert name} .
```

2. Open up an interactive terminal in docker in order to make sure everything is there

