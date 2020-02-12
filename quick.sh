#!/usr/bin/env bash

sudo add-apt-repository ppa:jonathonf/vim # Vim 8+
sudo apt update
sudo apt install vim
pip install yapf # Python formatter for vim-codefmt
sudo apt-get install clang-format # C/C++ formatter for vim-codefmt
sudo apt-get install fonts-powerline # Fonts for airline
cp ./src/.vimrc $HOME
cp -r ./src/.vim $HOME

sudo apt-get install tmux
cp ./src/.tmux.conf $HOME
cp -r ./src/.tmux $HOME

sudo apt-get install git-core
cp ./src/.gitconfig $HOME

if ! grep -Fxq "source $HOME/.bash_ag" $HOME/.bashrc
then
    echo -e "\n\nsource $HOME/.bash_ag\n" >> $HOME/.bashrc
fi
cp -n ./src/.bash_ag $HOME # no-clobber because there might be user-defined config settings if the file exists.

