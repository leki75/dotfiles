#!/bin/sh

# Install packages
sudo apt-get install \
    curl \
    vim-gtk3

# Install vim plugin manager
curl -fLso ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy configuration
cp vimrc ~/.vimrc

# Install plugins
vim -c ":PlugInstall"
