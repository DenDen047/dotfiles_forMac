!#/bin/zsh

echo "creat Symbolic Link..."
ln -s ~/dotfiles_forMac/.vimrc ~/.vimrc
ln -s ~/dotfiles_forMac/.zshenv ~/.zshenv

echo "Installing lib of pip..."
pip install requests
pip install BeautifulSoup

