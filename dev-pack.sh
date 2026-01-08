#!/bin/bash

# Script to install and configure dev tools for all popular languages and editors on Ubuntu/Debian/Raspberry Pi OS

# Exit on error
set -e

# Update and upgrade system
sudo apt update -y
sudo apt upgrade -y

# Install build essentials and common tools
sudo apt install -y build-essential git curl wget make cmake unzip zip jq

# Install containerization
sudo apt install -y docker.io docker-compose

# Install databases (use mariadb-server instead of mysql-server for ARM compatibility)
sudo DEBIAN_FRONTEND=noninteractive apt install -y postgresql mariadb-server sqlite3

# Install editors
sudo apt install -y vim emacs nano

# Install VSCodium (check for ARM support; VSCodium has ARM builds)
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium stable' | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update -y
sudo apt install -y codium

# Install Python
sudo apt install -y python3 python3-pip python3-venv

# Install Node.js (LTS) and npm
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# Install Java
sudo apt install -y default-jdk

# Install C/C++
sudo apt install -y gcc g++ clang

# Install Go
sudo apt install -y golang-go

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Install Ruby
sudo apt install -y ruby-full

# Install PHP
sudo apt install -y php php-cli php-mbstring

# Install Kotlin
sudo apt install -y kotlin

# Install Scala
sudo apt install -y scala

# Install Haskell
sudo apt install -y haskell-platform

# Install Elixir
sudo apt install -y elixir

# Install Dart
sudo apt install -y apt-transport-https
sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
sudo apt update -y
sudo apt install -y dart

# Install Lua
sudo apt install -y lua5.3

# Install Perl
sudo apt install -y perl

# Install Swift (requires additional repo; check ARM support)
sudo apt install -y gnupg
wget -qO- https://archive.swiftlang.xyz/install.sh | sudo bash -
sudo apt install -y swiftlang

# Install TypeScript (via npm)
sudo npm install -g typescript

# Basic configurations
# Vim: basic vimrc
echo "syntax on\nset number\nset tabstop=4\nset shiftwidth=4\nset expandtab" > ~/.vimrc

# Emacs: basic init.el
mkdir -p ~/.emacs.d
echo "(setq inhibit-startup-message t)\n(tool-bar-mode -1)\n(scroll-bar-mode -1)\n(menu-bar-mode -1)\n(set-fringe-mode 10)" > ~/.emacs.d/init.el

# Git config example
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

echo "Installation and basic configuration complete. Customize further as needed."
