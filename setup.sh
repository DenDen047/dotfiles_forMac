#!/bin/zsh

rm -rf ~/dotfiles_forMac/.vim/bundle
mkdir ~/dotfiles_forMac/.vim/bundle


echo "creat Symbolic Link..."
ln -s ~/dotfiles_forMac/.vimrc ~/.vimrc
ln -s ~/dotfiles_forMac/.zshenv ~/.zshenv
ln -s ~/dotfiles_forMac/.ssh/config ~/.ssh/config
ln -s ~/dotfiles_forMac/.theano/.theanorc ~/.theanorc

echo "Installing lib of pip..."
pip install ipython
pip install pyserial
pip install moviepy
pip install requests
pip install BeautifulSoup
pip install BeautifulSoup4
pip install numpy
pip install virtualenv
pip install virtualenvwarapper

echo "Install pyHook..."
cd ~/Downloads
wget http://sourceforge.net/projects/pyhook/files/latest/download.zip
cd ~/

echo "Setting for Tex"
export PATH=/usr/texbin:$PATH
sudo tlmgr update --self --all
sudo mkdir -p /usr/local/texlive/texmf-local/fonts/opentype/hiragino/
cd /usr/local/texlive/texmf-local/fonts/opentype/hiragino/
sudo ln -fs "/Library/Fonts/ヒラギノ明朝 Pro W3.otf" ./HiraMinPro-W3.otf-
sudo ln -fs "/Library/Fonts/ヒラギノ明朝 Pro W6.otf" ./HiraMinPro-W6.otf
sudo ln -fs "/Library/Fonts/ヒラギノ丸ゴ Pro W4.otf" ./HiraMaruPro-W4.otf
sudo ln -fs "/Library/Fonts/ヒラギノ角ゴ Pro W3.otf" ./HiraKakuPro-W3.otf
sudo ln -fs "/Library/Fonts/ヒラギノ角ゴ Pro W6.otf" ./HiraKakuPro-W6.otf
sudo ln -fs "/Library/Fonts/ヒラギノ角ゴ Std W8.otf" ./HiraKakuStd-W8.otf
sudo ln -fs "/System/Library/Fonts/ヒラギノ明朝 ProN W3.otf" ./HiraMinProN-W3.otf
sudo ln -fs "/System/Library/Fonts/ヒラギノ明朝 ProN W6.otf" ./HiraMinProN-W6.otf
sudo ln -fs "/Library/Fonts/ヒラギノ丸ゴ ProN W4.otf" ./HiraMaruProN-W4.otf
sudo ln -fs "/System/Library/Fonts/ヒラギノ角ゴ ProN W3.otf" ./HiraKakuProN-W3.otf
sudo ln -fs "/System/Library/Fonts/ヒラギノ角ゴ ProN W6.otf" ./HiraKakuProN-W6.otf
sudo ln -fs "/Library/Fonts/ヒラギノ角ゴ StdN W8.otf" ./HiraKakuStdN-W8.otf
sudo texconfig-sys rehash

echo "Setting of Ruby"
mkdir -p ~/.rbenv/plugins

echo "Setting of Vagrant"
vagrant plugin install sahara

