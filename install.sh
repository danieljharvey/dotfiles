#!/bin/bash
echo -e "Setting up Vim"

# remove old crap
rm -R ~/dotfiles/.vim/bundle
cp ~/.vimrc ~/.vimrc.old
rm ~/.vimrc
rm -R ~/.vim

# symlink new vim files
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim

# install Vundle and Vim plugins
cd ~/dotfiles/.vim
mkdir bundle
cd bundle
git clone https://github.com/VundleVim/Vundle.vim vundle
vim -c 'PluginInstall' -c 'qa!'

echo -e "Copying tmux settings"
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

echo -e "Probably fine isn't it"
