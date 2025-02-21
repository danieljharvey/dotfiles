#!/bin/bash
echo -e "Setting up Vim"

# remove old crap
rm ~/.tmux.conf

echo -e "Setting up tmux"

rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

echo "Remember to run Ctrl-a I to install plugins in tmux"

echo -e "Copying .config folders"

cp -R ~/dotfiles/.config ~/. 

echo -e "Probably fine isn't it"
