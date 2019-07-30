#!/bin/sh

# Install packages
sudo apt-get install \
    curl \
    neovim

# Install vim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy configuration
ln -s vimrc ~/.config/nvim/init.vim

# Install plugins
nvim -c ":PlugInstall"
