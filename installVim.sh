#!/bin/bash
echo -e "Setting up Vim"

ln -s ./.vimrc ~/.vimrc
ls -s ./.vim ~/.vim
cd bundle
git clone https://github.com/VundleVim/Vundle.vim vundle
vim -c 'PluginInstall' -c 'qa!'

echo -e "Probably fine isn't it"
