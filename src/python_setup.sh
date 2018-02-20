#!/bin/bash

mkdir -p ~/web/trading # make directory with name of algo here
mkdir -p ~/Projects/Trading # copy algo here
# remember to "crontab -e" the check.sh script

cp -r ~/AG-Setup/src/.tmux ~
cp -r ~/AG-Setup/src/.vim ~
cp ~/AG-Setup/src/.tmux.conf ~
cp ~/AG-Setup/src/.vimrc ~
cp ~/AG-Setup/src/.gitconfig ~

sudo apt update
sudo apt upgrade


if [ ! -d ~/anaconda2 ]
then
    # Basic Python2.7 installation
    sudo apt install python-minimal
    sudo apt install python-pip
    
    cd /tmp
    curl -O https://repo.continuum.io/archive/Anaconda2-5.0.1-Linux-x86_64.sh
    sudo sh Anaconda2-5.0.1-Linux-x86_64.sh
    
    cd ~
    source ~/.bashrc
fi

# Cryptocurrency Installs
sudo ~/anaconda2/bin/pip install gdax
sudo ~/anaconda2/bin/pip install python-binance

