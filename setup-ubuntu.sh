SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_PATH=$SCRIPT_DIR/dest

# create folder to setup
mkdir -p $ROOT_PATH

#################################################
# 												#
# 				INSTALL APPS 					#
# 												#
#################################################

# Google chrome
mkdir -p $ROOT_PATH/app
CHROME_APP_PATH=$ROOT_PATH/app/google-chrome.deb
wget -O $CHROME_APP_PATH https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install $CHROME_APP_PATH

# Visual studio code
VSCODE_APP_PATH=$ROOT_PATH/app/visual-studio-code.deb
wget -O $VSCODE_APP_PATH https://az764295.vo.msecnd.net/stable/97dec172d3256f8ca4bfb2143f3f76b503ca0534/code_1.74.3-1673284829_amd64.deb
sudo apt install $VSCODE_APP_PATH

# Setup chrome-web-app
mkdir -p ~/.local/share/applications
cp $ROOT_PATH/chrome-web-app/* ~/.local/share/applications

# VLC media player
sudo apt install vlc -y

# Shotwell
sudo apt install shotwell -y

# Telegram desktop
sudo snap install telegram-desktop

# Libre office
sudo apt install libreoffice -y

# Web app manager
#WEB_APP_MANAGER_PATH=$ROOT_PATH/app/web-app-manager.deb
#wget -O $WEB_APP_MANAGER_PATH http://packages.linuxmint.com/pool/main/w/webapp-manager/webapp-manager_1.1.5_all.deb
#sudo apt install $WEB_APP_MANAGER_PATH -y
#
#cp $SCRIPT_DIR/web-app/* ~/.local/share/applications

#################################################
# 												#
# 					FONTS 						#
# 												#
#################################################

# cascadia code
sudo apt install fonts-cascadia-code -y

# cascadia code (nerd font)
mkdir -p $ROOT_PATH/fonts
wget -O $ROOT_PATH/fonts/cascadia-code-nerdfont.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.2/CascadiaCode.zip
unzip $ROOT_PATH/fonts/cascadia-code-nerdfont.zip -d ~/.local/share/fonts

#################################################
# 												#
# 					SETUP SYSTEM 				#
# 												#
#################################################

# Setup background
gsettings set org.gnome.desktop.background picture-uri $SCRIPT_DIR/background/dva-1.jpg

# Setup favorites app icon
#FAVORITES_ICON_PATH=~/.local/share/ice/icons
#mkdir -p $FAVORITES_ICON_PATH
#cp $SCRIPT_DIR/web-app-icon/* $FAVORITES_ICON_PATH

# Setup favorites app
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'webapp-Facebook0729.desktop', 'webapp-Messenger7089.desktop', 'webapp-Zalo9526.desktop', 'telegram-desktop_telegram-desktop.desktop', 'webapp-Youtube2318.desktop', 'code.desktop', 'vlc.desktop', 'shotwell.desktop', 'webapp-GoogleSpreadSheets7094.desktop', 'webapp-GoogleDocuments6506.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Settings.desktop']"

# install vietnamese unikey
sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo -y
sudo apt-get update
sudo apt-get install ibus ibus-bamboo --install-recommends -y
ibus restart

# set ibus-bamboo to default input sources
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"

# install unzip package
sudo apt-get install unzip -y

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
(cd ~ && gh auth login)

# nodejs
(
cd ~ &&
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh &&
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash &&
source ~/.bashrc &&
nvm list-remote &&
nvm install v18.14.0
)

#################################################
# 												#
# 					SETUP STYLES 				#
# 												#
#################################################


# install gnome-tweak, gnome-extension-manager
sudo apt update
sudo add-apt-repository universe -y
sudo apt install gnome-tweaks gnome-shell-extension-manager -y

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
git clone https://github.com/bikass/kora.git $KORA_ICON_PATH
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
sudo apt-get install python3-dev python3-pip -y
pip install py2neo
npm install -g yarn

# install neovim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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
sudo apt install ccls -y

# setup for airline font
sudo apt-get install fonts-powerline -y

# setup for fuzzy finder
AG_PATH=$ROOT_PATH/package/ag
mkdir -p $AG_PATH
git clone https://github.com/ggreer/the_silver_searcher $AG_PATH
$AG_PATH/build.sh
(cd $AG_PATH && sudo make install)

sudo apt-get install ripgrep -y

