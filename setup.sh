#!/usr/bin/env bash

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y git-core
sudo apt-get install -y build-essential
sudo apt-get install -y vim
sudo apt-get install -y tmux

# BASH SETUP
echo "  >>> Setting up .bashrc"
if [ ! -f "$HOME/.bashrc" ] || grep -q "albertgural" "$HOME/.bashrc"; then
  cp src/.bashrc $HOME
else
  if ! grep -q ".bash_ag" "$HOME/.bashrc"; then
    echo "" >> $HOME/.bashrc
    echo "" >> $HOME/.bashrc
    echo "# AG's .bashrc" >> $HOME/.bashrc
    echo ". ~/.bash_ag" >> $HOME/.bashrc
  fi
  cp src/.bashrc $HOME/.bash_ag
fi
# TODO: .profile or .bash_profile?

# VIM SETUP
echo "  >>> Setting up .vimrc"
mkdir -p $HOME/.vim/autoload
mkdir -p $HOME/.vim/bundle
mkdir -p $HOME/.vim/colors
curl https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim > $HOME/.vim/autoload/pathogen.vim
git clone https://github.com/bling/vim-airline $HOME/.vim/bundle/vim-airline
git clone git://github.com/scrooloose/nerdtree.git $HOME/.vim/bundle/nerdtree
if [ ! -f "$HOME/.vimrc" ] || grep -q "albertgural" "$HOME/.vimrc"; then
  cp src/.vimrc $HOME
else
  echo "File .vimrc already exists. You must perform a manual merge."
  read -p "Press [Enter] key to continue..."
fi
cp src/hightech.vim $HOME/.vim/colors

# gedit SETUP
echo "  >>> Copying gedit theme"
if [ ! -f "$HOME/dark.xml" ] || grep -q "albertgural" "$HOME/dark.xml"; then
  cp src/dark.xml $HOME
fi

# TMUX SETUP
echo "  >>> Setting up tmux.conf"
mkdir $HOME/.tmux
git clone https://github.com/erikw/tmux-powerline.git $HOME/.tmux
if [ -f "$HOME/.tmux.conf" ] && ! grep -q "albertgural" "$HOME/.tmux.conf"; then
  echo "File .tmux.conf already exists. Overwriting anyway."
  read -p "Press [Enter] key to continue..."
fi
cp src/.tmux.conf $HOME
tmux source-file $HOME/.tmux.conf

echo "  >>> Completed Initial Setup"

if [ "$1" == "desktop" ]; then
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

if [ "$1" == "server" ] && [ "$2" == "bitstarter" ]; then
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

if [ "$1" == "server" ] && [ "$2" == "lempw" || "$2" == "albertgural" ]; then
  echo "This setup to be completed..."
  # TODO: sql/mysql, php, node.js, django, ruby, python.
  if [ "$2" == "albertgural" ]; then
    echo "This setup to be completed..."
    # TODO: install a backed up mysql table and all the .../www files.
  fi
fi

