#!/bin/sh

## Run this script after installing elementary OS
## Run with the command
## source elementary_post_install.sh

cd
# Key bindings
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>f']"

# Third party repositories
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub \
| sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' \
| sudo tee /etc/apt/sources.list.d/google-chrome.list

# Latest packages update
sudo apt update
sudo apt -y dist-upgrade

# Package installations
sudo apt -y purge vim
sudo apt -y install vim git google-chrome-stable software-properties-common \
ruby-full

# Install gem packages
sudo gem install bundler

#Updating gem packages
sudo gem update --system

# Miscellaneous
sudo rm -r /bin/sh
sudo ln -s /bin/bash /bin/sh

# Cleaning software packages
sudo apt -y autoremove
sudo apt -y autoclean

# Cloning repositories
git clone https://github.com/nayabbashasayed/website.git

# Installing repository dependency packages
cd ~/website
bundle install
git config user.email "nayabbashasyed@gmail.com"
git config user.name "Nayab Basha Sayed"