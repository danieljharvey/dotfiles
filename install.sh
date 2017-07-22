#!/bin/bash
echo -e "Setting up Vim"

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
cd ~/dotfiles/.vim
cd bundle
git clone https://github.com/VundleVim/Vundle.vim vundle
vim -c 'PluginInstall' -c 'qa!'

echo -e "Copying tmux settings"
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

echo -e "Probably fine isn't it"
