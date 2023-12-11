CHROME_PATH=$INSTALLER_DIR/google-chrome.deb

curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb --create-dirs -o $CHROME_PATH

sudo apt install $CHROME_PATH -y
