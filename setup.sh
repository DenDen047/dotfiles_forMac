#!/bin/zsh

rm -rf ~/dotfiles_forMac/.vim/bundle
mkdir ~/dotfiles_forMac/.vim/bundle


echo "creat Symbolic Link..."
ln -s ~/dotfiles_forMac/.vimrc ~/.vimrc
ln -s ~/dotfiles_forMac/.zshenv ~/.zshenv
ln -s ~/dotfiles_forMac/.ssh/config ~/.ssh/config
ln -s ~/dotfiles_forMac/.theano/.theanorc ~/.theanorc

echo "Installing lib of pip..."
pip install --upgrade pip
pip install ipython
pip install pyserial
pip install moviepy
pip install requests
pip install BeautifulSoup
pip install BeautifulSoup4
pip install selenium
pip install numpy
pip install virtualenv
pip install virtualenvwarapper

echo "Install pyHook..."
cd ~/Downloads
wget http://sourceforge.net/projects/pyhook/files/latest/download.zip
cd ~/

echo "Setting of Ruby"
mkdir -p ~/.rbenv/plugins

echo "Setting of Vagrant"
vagrant plugin install sahara

echo "Setting of Docker"
docker-machine create --driver virtualbox default2

echo "Setting for Tex"
echo "自分で調べるのだ"
cd /usr/local/texlive/2016/texmf-dist/scripts/cjk-gs-integrate
sudo perl cjk-gs-integrate.pl --link-texmf --force
sudo mktexlsr
sudo kanji-config-updmap-sys hiragino-elcapitan-pron

