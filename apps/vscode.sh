VSCODE_PATH="$INSTALLER_DIR/vscode.deb"

curl https://az764295.vo.msecnd.net/stable/af28b32d7e553898b2a91af498b1fb666fdebe0c/code_1.85.0-1701902998_amd64.deb --create-dirs -o $VSCODE_PATH

sudo apt install $VSCODE_PATH
