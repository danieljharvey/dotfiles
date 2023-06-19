#!/bin/bash
echo -e "Setting up Vim"

# remove old crap
rm -R ~/dotfiles/.vim/bundle
cp ~/.vimrc ~/.vimrc.old
rm ~/.vimrc
rm -R ~/.vim
rm ~/.tmux.conf

# install neovim package manager (why is this so manual?)
rm -rf ~/.local/share/nvim/site/pack/packer/start

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# remove local to break cache
# rm -rf .vim
# mkdir .vim

# symlink new vim files
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim

# install Vundle and Vim plugins
cd ~/dotfiles/.vim
mkdir bundle
cd bundle
nvim -c 'PlugInstall' -c 'qa!'

echo -e "Setting up tmux"

rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

echo "Remember to run Ctrl-a I to install plugins in tmux"

echo -e "Copying .config folders"

cp -R ~/dotfiles/.config ~/. 

echo -e "Probably fine isn't it"
