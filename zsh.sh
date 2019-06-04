#!/bin/sh

# Install packages
sudo apt-get install \
    direnv \
    fonts-powerline \
    zsh

# Change login shell
sudo chsh -s /bin/zsh leki

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Zsh plugins
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Copy configuration
cp zshrc ~/.zshrc
