#!/bin/bash

echo "===== Oh-My-Zsh Setup Script ====="
echo "This script will install zsh, oh-my-zsh, set the agnoster theme, and install popular plugins."

# Install ZSH and other required packages
echo "Installing zsh and dependencies..."
sudo apt update
sudo apt install -y zsh curl git fonts-powerline

# Install Oh-My-Zsh
echo "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Set agnoster theme
echo "Setting agnoster theme..."
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc

# Install plugins
echo "Installing plugins..."

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Add plugins to zshrc
echo "Configuring plugins..."
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc

# Make ZSH the default shell
echo "Making ZSH the default shell..."
chsh -s $(which zsh)

echo "===== Installation Complete! ====="
echo "Please log out and log back in to start using ZSH with the agnoster theme."
echo "Enjoy your enhanced terminal experience!"
