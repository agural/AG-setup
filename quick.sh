#!/usr/bin/bash

sudo apt update
sudo apt install vim-gtk3
#pip install yapf # Python formatter for vim-codefmt
#sudo apt-get install clang-format # C/C++ formatter for vim-codefmt
sudo apt-get install fonts-powerline # Fonts for airline
sudo apt install nodejs npm # nodejs for coc.nvim
cp ./src/.vimrc $HOME
cp -r ./src/.vim $HOME

sudo apt-get install tree
sudo apt-get install xclip # For tmux-yank
sudo apt-get install tmux
cp ./src/.tmux.conf $HOME
cp -r ./src/.tmux $HOME
mkdir $HOME/.tmux_history

sudo apt-get install git-all
cp ./src/.gitconfig $HOME
git config --global user.name agural
git config --global user.email ag@albertgural.com

if ! grep -Fxq "source $HOME/.bash_ag" $HOME/.bashrc
then
    echo -e "\n\nsource $HOME/.bash_ag\n" >> $HOME/.bashrc
fi
cp -n ./src/.bash_ag $HOME # no-clobber because there might be user-defined config settings if the file exists.

