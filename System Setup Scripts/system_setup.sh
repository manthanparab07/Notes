#!/bin/bash

echo "Installing vim tree tmux"
sudo apt install vim tree tmux

# or run:
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE

wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -

# add Typora's repository

sudo add-apt-repository 'deb https://typora.io/linux ./'

sudo apt-get update

# install typora

sudo apt-get install typora golang

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code # or code-insiders

git config --global core.editor vim

# copying configuration files for vim , bashrc

cp .vimrc $HOME
echo "Copied vim configuration!!"

echo "Now Inorder to apply vim theme"
echo "**********************Important****************************"
echo "Now run :PlugInstall to install the plugins."

cp .tmux* $HOME
echo "Copied tmux configuration!!"


echo "Now the computer is good to go"
echo "Enjoy"
