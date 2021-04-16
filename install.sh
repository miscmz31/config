#!/bin/bash

set +x

sudo apt update
sudo apt install -y git cmake build-essential neovim 
sudo apt install -y tmux pkg-config tmux nodejs npm bear ripgrep tig silversearcher-ag

if ! [ -x $(command -v pip3) ]; then
    sudo apt install -y python3-pip
fi

pip3 install pynvim

if ! [ -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim/
fi

if ! [ -d ~/.vim/vimrc ]; then
    mkdir -p ~/.vim/vimrc/
fi

cp ./init.vim ~/.config/nvim/
cp ./coc-settings.json ~/.config/nvim/
cp ./statusline.vim ~/.vim/vimrc/
cp ./tabline.vim ~/.vim/vimrc/

# neovim vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall +qa &> /dev/null

git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
cp ./.tmux.conf ~/

