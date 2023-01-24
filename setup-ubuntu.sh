ROOT_PATH="$HOME/Downloads/setup"

# create folder to setup
mkdir -p $ROOT_PATH

#################################################
# 												#
# 					SETUP SYSTEM 				#
# 												#
#################################################

# install vietnamese unikey
sudo apt -y install $(check-language-support -l fr)

# install unzip package
sudo apt-get install unzip

# github and gh auth login
sudo apt update
sudo apt install git -y
git config --global user.name "tranconcoder"
git config --global user.email "tranconcoder@gmail.com"
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
gh auth login

# nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
nvm list-remote
echo "run: \"nvm install <version>\" to install nodejs"


#################################################
# 												#
# 					SETUP STYLES 				#
# 												#
#################################################

# install nerd font
mkdir -p $ROOT_PATH/fonts
wget -O  $ROOT_PATH/fonts/cascadia-code-nerdfont.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.2/CascadiaCode.zip
unzip $ROOT_PATH/fonts/cascadia-code-nerdfont.zip -d ~/.local/share/fonts

# install gnome-tweak, gnome-extension-manager
sudo apt update
sudo add-apt-repository universe
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extension-manager -y

# install gnome-extension:
#  + bluetooth quick connect
#  + blur my shell
#  + dash to dock
#  + dash to dock animation
 
# install orchis-theme
mkdir -p $ROOT_PATH/theme
git clone https://github.com/vinceliuice/Orchis-theme.git $ROOT_PATH/theme/orchis-theme
$ROOT_PATH/theme/orchis-theme/install.sh

# install kora icon
KORA_ICON_PATH=$ROOT_PATH/theme/kora-icons

sudo apt update
mkdir -p $KORA_ICON_PATH
git clone https://github.com/bikass/kora.git $KORA_ICON_PATHH
mkdir -p ~/.local/share/icons
cp -a $KORA_ICON_PATH/kora ~/.local/share/icons
cp -a $KORA_ICON_PATH/kora-light ~/.local/share/icons
cp -a $KORA_ICON_PATH/kora-light-panel ~/.local/share/icons
cp -a $KORA_ICON_PATH/kora-pgrey ~/.local/share/icons

#################################################
# 												#
# 				    SETUP NEOVIM				#
# 												#
#################################################

sudo apt update
sudo apt install neovim python3-neovim software-properties-common -y
sudo apt-get install python3-dev python3-pip
pip install py2neo
npm install -g yarn

# install neovim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config
mkdir -p ~/.config/nvim
mkdir -p ~/.config/coc
git clone https://github.com/tranconcoder/neovim.git ~/.config/nvim
git clone https://github.com/tranconcoder/nvim-coc.git ~/.config/coc

# install all plugin
nvim --headless +PlugInstall +qa

# update clangd plugin
nvim --headless +CocCommand clangd.install +qa

# setup for c++
sudo apt update
sudo apt install ccls

# setup for airline font
mkdir -p $ROOT_PATH/fonts
git clone https://github.com/powerline/fonts.git $ROOT_PATH/fonts/powerline-fonts
$ROOT_PATH/fonts/powerline-fonts/install.sh

#################################################
# 												#
# 				INSTALL APPS 					#
# 												#
#################################################

# Visual studio code
sudo apt update
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

