ROOT_DIR=$( dirname -- "$0"; )
APPS_DIR="$ROOT_DIR/apps"
PACKAGES_DIR="$ROOT_DIR/packages"
INSTALLER_DIR="$ROOT_DIR/installer"

# Remove source in previous session
sudo rm -rf $INSTALLER_DIR

sh "./config.sh"

# Install packages
sh "$PACKAGES_DIR/curl.sh"

# Install apps
source "$APPS_DIR/chrome.sh"
