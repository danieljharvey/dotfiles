#!/bin/bash
echo -e "Setting up Vim"

# remove old crap
rm -R ~/dotfiles/.vim/bundle
cp ~/.vimrc ~/.vimrc.old
rm ~/.vimrc
rm -R ~/.vim
rm ~/.tmux.conf

# symlink new vim files
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim

# install Vundle and Vim plugins
cd ~/dotfiles/.vim
mkdir bundle
cd bundle
vim -c 'PlugInstall' -c 'qa!'

echo -e "Setting up tmux"

rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

echo -e "Probably fine isn't it"
