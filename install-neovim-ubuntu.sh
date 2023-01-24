sudo apt update
sudo apt install neovim python3-neovim software-properties-common -y
sudo apt-get install python3-dev python3-pip
pip install py2neo
npm install -g yarn

# vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config
mkdir -p ~/.config/nvim
mkdir -p ~/.config/coc
git clone https://github.com/tranconcoder/neovim.git ~/.config/nvim
git clone https://github.com/tranconcoder/nvim-coc.git ~/.config/coc

# setup for c++
sudo apt update
sudo apt install ccls

# setup for airline font
mkdir -p ~/Downloads/setup/fonts
git clone https://github.com/powerline/fonts.git ~/Downloads/setup/fonts/powerline-fonts
~/Downloads/setup/fonts/powerline-fonts/./install.sh
