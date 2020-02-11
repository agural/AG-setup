#!/usr/bin/env bash

cp ./src/.bash_ag $HOME
echo "\n\nsource $HOME/.bash_ag\n" >> $HOME/.bashrc

cp ./src/.vimrc $HOME
cp -r ./src/.vim $HOME
sudo add-apt-repository ppa:jonathonf/vim # Vim 8+
sudo apt update
sudo apt install vim
pip install yapf # Python formatter for vim-codefmt
sudo apt-get install fonts-powerline # Fonts for airline

cp ./src/.tmux.conf $HOME
cp -r ./src/.tmux $HOME

cp ./src/.gitconfig $HOME

