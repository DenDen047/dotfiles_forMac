#!/bin/zsh

rm -rf ~/dotfiles_forMac/.vim/bundle
mkdir ~/dotfiles_forMac/.vim/bundle


echo "creat Symbolic Link..."
ln -s ~/dotfiles_forMac/.vimrc ~/.vimrc
ln -s ~/dotfiles_forMac/.zshenv ~/.zshrc
ln -s ~/dotfiles_forMac/.ssh/config ~/.ssh/config
ln -s ~/dotfiles_forMac/.theano/.theanorc ~/.theanorc

echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew tap homebrew/dupes
brew tap homebrew/science
brew tap homebrew/versions
# Other Homebrew packages
brew install gcc
brew install git
brew install rmtrash
brew install vim
brew install zsh-completions
brew install tree
brew install ghostscript
brew install imagemagick
brew install python
brew install pyenv-virtualenv    # OSX 10.9,10.10 need blow command. ->   CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install -v 2.7.  <- want version
brew install wget
brew install docker
brew install docker-machine
brew install boot2docker
brew install phantomjs
# brew-cask packages
brew cask install dropbox
brew cask install google-chrome
brew cask install google-drive
brew cask install skype
brew cask install virtualbox
brew cask install iterm2
brew cask install python
brew cask install sublime-text
brew cask install transmission
brew cask install burn
brew cask install appcleaner
brew cask install flux
brew cask install alfred
brew cask install onyx
brew cask install ccleaner
brew cask install r
brew cask install rstudio
brew cask install coolterm
brew cask install cyberduck
brew cask install the-unarchiver
brew cask install vagrant
brew cask install vagrant-manager
brew cleanup
brew cask cleanup

echo "Installing lib of pip..."
pip install --upgrade pip
pip install ipython
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

