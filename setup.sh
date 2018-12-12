#!/bin/bash

# This is a script to automatically config neovim, tmux and fish for new debian machine
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt update
sudo apt install -y git cmake build-essential neovim tmux fish pkg-config libevent-dev libncurses5-dev

# setup neovim
pip install neovim --user
if [ -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim/
    cp ./init.vim ~/.config/nvim/
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
nvim +PluginInstall +qall 2&>/dev/null
pushd ~/.vim/bundle/youcompleteme
python install.py --clang-completer
popd

# setup tmux
git clone https://github.com/tmux/tmux.git
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
cp ./.tmux.conf ~/
pushd tmux
sh autogen.sh
./configure && make
sudo make install
popd

# setup fish
curl -L https://get.oh-my.fish | fish
cp ./config.fish ~/.config/fish/
omf install bobthefish




