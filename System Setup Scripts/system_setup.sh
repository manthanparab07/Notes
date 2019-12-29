#!/bin/bash

echo "Saving Current Working Directory .."
current_path=$(pwd)


wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -

# add Typora's repository

sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update

# install typora

echo "Installing neovim git tree tmux golang typora"

sudo apt install neovim git tree tmux golang typora


git config --global core.editor nvim

echo "Installing Plugin Manager ..."

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
echo "Creating NeoVim Configuration files"

cd
mkdir .config/nvim/
touch .config/nvim/init.vim

echo "Adding Auto-Pair Plugin ..."
mkdir .config/nvim/plugin/

echo "Configuration Files ..."

cp auto-pairs.vim $HOME/.config/nvim/plugin/
cp vim.config $HOME/.config/nvim/init.vim

echo "Work Done"


