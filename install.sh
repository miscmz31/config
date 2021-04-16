#!/bin/bash

set +x

sudo apt update
sudo apt install -y git cmake build-essential neovim tmux pkg-config tmux nodejs npm

if ! [ -x $(command -v pip3) ]; then
    sudo apt install -y python3-pip
fi

pip3 install pynvim

if ! [ -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim/
fi

cp ./init.vim ~/.config/nvim/
cp ./coc-settings.json ~/.config/nvim/

# neovim vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall +qa &> /dev/null

git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
cp ./.tmux.conf ~/

