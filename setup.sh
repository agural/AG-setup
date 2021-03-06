#!/usr/bin/env bash

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y git-core
sudo apt-get install -y curl
sudo apt-get install -y build-essential
sudo apt-get install -y vim vim-common vim-gnome vim-gui-common vim-runtime
sudo apt-get install -y tmux
sudo apt-get install -y xclip # For tmux-yank
sudo apt-get install -y tree # For directory tree view

# BASH SETUP
echo "  >>> Setting up .bashrc"
if [ ! -f "$HOME/.bashrc" ] || grep -q "albertgural" "$HOME/.bashrc"; then
    cp src/.bashrc $HOME
else
    echo " *** Warning: .bashrc already exists. ***"
    read -r -p "Overwrite current file [y|n]?" response
    if [$response = "y" ]; then
        cp src/.bashrc $HOME
    else
        echo "Skipping BASH configuration."
    fi
fi

# VIM SETUP
# Pathogen: https://raw.github.com/tpope/vim-pathogen
# Vim Airline: https://github.com/bling/vim-airline
# NERDTree: git://github.com/scrooloose/nerdtree.git
echo "  >>> Setting up .vimrc"
if [ ! -f "$HOME/.vimrc" ] || grep -q "albertgural" "$HOME/.vimrc"; then
    cp -r src/.vim $HOME
    cp src/.vimrc $HOME
else
    echo "*** Warning: .vimrc already exists. ***"
    read -r -p "Overwrite current file [y|n]?" response
    if [ $response = "y" ]; then
        cp -r src/.vim $HOME
        cp src/.vimrc $HOME
    else
        echo "Skipping VIM configuration."
    fi
fi

# gedit SETUP
echo "  >>> Copying gedit theme"
if [ ! -f "$HOME/dark.xml" ] || grep -q "albertgural" "$HOME/dark.xml"; then
    cp src/dark.xml $HOME
else
    echo "*** Warning: dark.xml already exists. Skipping GEDIT configuration."
fi

# TMUX SETUP
# TMUX Powerline: https://github.com/erikw/tmux-powerline.git
echo "  >>> Setting up tmux.conf"
if [ ! -f "$HOME/.tmux.conf" ] || grep -q "albertgural" "$HOME/.tmux.conf"; then
    cp src/.tmux.conf $HOME
    cp -r src/.tmux $HOME
else
    echo "*** Warning: .tmux.conf already exists. ***"
    read -r -p "Overwrite current file [y|n]?" response
    if [ $response = "y" ]; then
        cp src/.tmux.conf $HOME
        cp -r src/.tmux $HOME
    else
        echo "Skipping TMUX configuration."
    fi
fi
tmux source-file $HOME/.tmux.conf

# GIT SETUP
echo "  >>> Setting up Git"
cp src/.gitconfig $HOME

echo "  >>> Completed Initial Setup"

if [ "$1" = "desktop" ]; then
  sudo apt-get install ubuntu-restricted-extras # Proprietary Stuff
  sudo apt-get install gnome-shell              # For gnome
  sudo apt-get install vlc                      # For playing media
  # TODO: The rest...
  # Chrome
  # Skype
  # gimp
  # inkscape
  # Compiz
  # Wine

  # Java
  # Filezilla
fi

if [ "$1" = "server" ] && [ "$2" = "bitstarter" ]; then
  cd $HOME

  clear
  echo "Setting environment up from Coursera's setup files."
  git clone https://github.com/startup-class/setup.git
  ./setup/setup.sh

  clear
  echo "Copy the key and add it to Github at https://github.com/settings/ssh."
  ssh-keygen -t rsa
  cat ~/.ssh/id_rsa.pub
  read -p "Press [Enter] key to continue..."

  clear
  echo "Cloning bitstarter repository locally."
  git clone git@github.com:agural/bitstarter.git
  git config --global user.name agural
  git config --global user.email ag@albertgural.com

  cd bitstarter
  npm install
  sed -i 's/5000/8080/g' web.js

  git checkout master
  git checkout staging
  git checkout develop
  git branch

  clear
  echo "Setting up heroku."
  heroku login
  heroku keys:add

  clear
  echo "All set up! Here's a sample development workflow to get you started.\n"
  echo "\t$ git checkout develop"
  echo "\t$ git branch"
  echo "\t$ vim index.html"
  echo "\t$ git commit -a -m \"Edited index.html\""
  echo "\t$ git push -u origin develop"
  echo "\t$ /usr/bin/env node web.js"
  echo "\t$ ..."
  echo "\t$ git checkout staging"
  echo "\t$ git merge develop"
  echo "\t$ git push staging-heroku staging:master"
  echo "\t$ ..."
  echo "\t$ git checkout master"
  echo "\t$ git merge staging"
  echo "\t$ git push production-heroku master:master"
  echo "...and that's it. We're going to exit now, but when you log back in, node should be enabled and you can start coding. Have fun!"
  read -p "Press [Enter] key to continue..."

  exit # leave/enter to enable node.
fi

if [ "$1" = "server" ] && [ "$2" = "lempw" -o "$2" = "albertgural" ]; then
  echo "This setup to be completed..."
  # TODO: sql/mysql, php, node.js, django, ruby, python.
  if [ "$2" = "albertgural" ]; then
    echo "This setup to be completed..."
    # TODO: install a backed up mysql table and all the .../www files.
  fi
fi

