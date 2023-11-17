#!/bin/sh

# Set default umask permissions
umask 022

# Get the latest version
latest_release=$(curl -L -s -H 'Accept: application/json' https://github.com/ugetdm/uget-integrator/releases/latest)
version=$(echo $latest_release | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')

echo "Installing uget-integrator $version"

# Remove old files if exist
sudo rm -f /usr/bin/local/uget-integrator

# Download uget-integrator to /usr/bin/local/uget-integrator
sudo wget --quiet https://raw.githubusercontent.com/ugetdm/uget-integrator/$version/bin/uget-integrator --output-document /usr/bin/local/uget-integrator

# Make the uget-integrator executable
sudo chmod +x /usr/bin/local/uget-integrator

# If you don't have Chromium, Google Chrome, Vivaldi or Opera, you can comment the following two lines
########################################################### Chromium, Google Chrome, Vivaldi and Opera ##########################################################
# Create the required directories for native messaging host configuration
mkdir -p ~/Library/Application Support/Google/Chrome/NativeMessagingHosts
mkdir -p ~/Library/Application Support/Chromium/NativeMessagingHosts
mkdir -p ~/Library/Application Support/Opera/NativeMessagingHosts

# Remove old files if exist
rm -f ~/Library/Application Support/Google/Chrome/NativeMessagingHosts/com.ugetdm.chrome.json
rm -f ~/Library/Application Support/Chromium/NativeMessagingHosts/com.ugetdm.chrome.json
rm -f ~/Library/Application Support/Opera/NativeMessagingHosts/com.ugetdm.chrome.json

# Download com.ugetdm.chrome.json to ~/Library/Application Support/Google/Chrome/NativeMessagingHosts/com.ugetdm.chrome.json
wget --quiet https://raw.githubusercontent.com/ugetdm/uget-integrator/$version/conf/com.ugetdm.chrome.mac.json --output-document ~/Library/Application Support/Google/Chrome/NativeMessagingHosts/com.ugetdm.chrome.json

# Download com.ugetdm.chrome.json to ~/Library/Application Support/Chromium/NativeMessagingHosts/com.ugetdm.chrome.json
wget --quiet https://raw.githubusercontent.com/ugetdm/uget-integrator/$version/conf/com.ugetdm.chrome.mac.json --output-document ~/Library/Application Support/Chromium/NativeMessagingHosts/com.ugetdm.chrome.json

# Download com.ugetdm.chrome.json to ~/Library/Application Support/Opera/NativeMessagingHosts/com.ugetdm.chrome.json
wget --quiet https://raw.githubusercontent.com/ugetdm/uget-integrator/$version/conf/com.ugetdm.chrome.mac.json --output-document ~/Library/Application Support/Opera/NativeMessagingHosts/com.ugetdm.chrome.json

# If you don't have Firefox, you can comment the following two lines
######################################################################## Mozilla Firefox ########################################################################
# Create the required directories for native messaging host configuration
mkdir -p ~/Library/Application Support/Mozilla/NativeMessagingHosts

# Remove old files if exist
rm -f ~/Library/Application Support/Mozilla/NativeMessagingHosts/com.ugetdm.firefox.json

# Download com.ugetdm.firefox.json to ~/Library/Application Support/Mozilla/NativeMessagingHosts/com.ugetdm.firefox.json
wget --quiet https://raw.githubusercontent.com/ugetdm/uget-integrator/$version/conf/com.ugetdm.firefox.mac.json --output-document ~/Library/Application Support/Mozilla/NativeMessagingHosts/com.ugetdm.firefox.json

echo "uget-integrator is installed successfully!"
echo "Please install the 'uGet Integration' extension and restart the browser"
echo "  - Google Chrome, Chromium & Vivaldi: https://chrome.google.com/webstore/detail/uget-integration/efjgjleilhflffpbnkaofpmdnajdpepi"
echo "  - Mozilla Firefox: https://addons.mozilla.org/en-US/firefox/addon/ugetintegration/"
echo "  - Opera: https://addons.opera.com/en/extensions/details/uget-integration"