#!/bin/sh

# Remove the uget-integrator executable
sudo rm -f /usr/bin/local/uget-integrator

# If you don't have Chromium, Google Chrome, Vivaldi or Opera, you can comment the following two lines
########################################################### Chromium, Google Chrome, Vivaldi and Opera ##########################################################
# Remove ~/Library/Application Support/Google/Chrome/NativeMessagingHosts/com.ugetdm.chrome.json
sudo rm -f ~/Library/Application Support/Google/Chrome/NativeMessagingHosts/com.ugetdm.chrome.json

# Remove ~/Library/Application Support/Chromium/NativeMessagingHosts/com.ugetdm.chrome.json
sudo rm -f ~/Library/Application Support/Chromium/NativeMessagingHosts/com.ugetdm.chrome.json

# Remove ~/Library/Application Support/Opera/NativeMessagingHosts/com.ugetdm.chrome.json
sudo rm -f ~/Library/Application Support/Opera/NativeMessagingHosts/com.ugetdm.chrome.json

# If you don't have Firefox, you can comment the following two lines
######################################################################## Mozilla Firefox ########################################################################
# Remove ~/Library/Application Support/Mozilla/NativeMessagingHosts/com.ugetdm.firefox.json
sudo rm -f ~/Library/Application Support/Mozilla/NativeMessagingHosts/com.ugetdm.firefox.json

echo "uget-integrator is uninstalled successfully!"
echo "Please remove the 'uGet Integration' extension from your browser"