# create folder to setup
mkdir -p ~/Downloads/setup

# install nerd font
mkdir -p ~/Downloads/setup/fonts
wget -O ~/Downloads/setup/fonts/cascadia-code-nerdfont.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.2/CascadiaCode.zip
unzip ~/Downloads/setup/fonts/cascadia-code-nerdfont.zip -d ~/.local/share/fonts

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

# install gnome-tweak
sudo apt update
sudo add-apt-repository universe
sudo apt install gnome-tweaks

sudo apt install gnome-shell-extension-manager -y

# install gnome-extension:
 + bluetooth quick connect
 + blur my shell
 + dash to dock
 + dash to dock animation
 
# install orchis-theme
mkdir -p ~/Downloads/setup/theme
git clone https://github.com/vinceliuice/Orchis-theme.git ~/Downloads/setup/theme/orchis-theme
~/Downloads/setup/theme/orchis-theme/install.sh
gnome-tweaks


# install kora icon
sudo apt update
mkdir -p ~/Downloads/setup/theme/kora-icons
git clone https://github.com/bikass/kora.git ~/Downloads/setup/theme/kora-icons
mkdir -p ~/.local/share/icons
cp -a ~/Downloads/setup/theme/kora-icons/kora ~/.local/share/icons
cp -a ~/Downloads/setup/theme/kora-icons/kora-light ~/.local/share/icons
cp -a ~/Downloads/setup/theme/kora-icons/kora-light-panel ~/.local/share/icons
cp -a ~/Downloads/setup/theme/kora-icons/kora-pgrey ~/.local/share/icons
gnome-tweaks


