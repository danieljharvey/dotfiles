#!/bin/bash
ln -s ./.vimrc ~/.vimrc
ln -s ./.vim ~/.vim
cd bundle
git clone https://github.com/VundleVim/Vundle.vim vundle
vim -c 'PluginInstall' -c 'qa!'

echo -e "Vim is probably set up"
