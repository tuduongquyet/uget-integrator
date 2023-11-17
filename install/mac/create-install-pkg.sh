#!/bin/bash

# Define installation paths
BIN_INSTALL_PATH="/usr/local/bin"
CHROME_INSTALL_PATH="/Library/Google/Chrome/NativeMessagingHosts"
CHROMIUM_INSTALL_PATH="/Library/Application Support/Chromium/NativeMessagingHosts"
OPERA_INSTALL_PATH="/Library/Application Support/Opera/NativeMessagingHosts"
FIREFOX_INSTALL_PATH="/Library/Application Support/Mozilla/NativeMessagingHosts"

# Create a temporary directory for the package
TEMP_DIR=$(mktemp -d /tmp/com.ugetdm.uget-integrator-installer)
mkdir -p "${TEMP_DIR}/package-root${BIN_INSTALL_PATH}" "${TEMP_DIR}/package-root${CHROME_INSTALL_PATH}" "${TEMP_DIR}/package-root${CHROMIUM_INSTALL_PATH}" "${TEMP_DIR}/package-root${OPERA_INSTALL_PATH}" "${TEMP_DIR}/package-root${FIREFOX_INSTALL_PATH}"

# Copy files to the temporary directory
cp bin/uget-integrator-mac "${TEMP_DIR}/package-root${BIN_INSTALL_PATH}/uget-integrator"
cp conf/com.ugetdm.chrome.mac.json "${TEMP_DIR}/package-root${CHROME_INSTALL_PATH}/com.ugetdm.chrome.json"
cp conf/com.ugetdm.chrome.mac.json "${TEMP_DIR}/package-root${CHROMIUM_INSTALL_PATH}/com.ugetdm.chrome.json"
cp conf/com.ugetdm.chrome.mac.json "${TEMP_DIR}/package-root${OPERA_INSTALL_PATH}/com.ugetdm.chrome.json"
cp conf/com.ugetdm.firefox.mac.json "${TEMP_DIR}/package-root${FIREFOX_INSTALL_PATH}/com.ugetdm.firefox.json"

# Create the package using pkgbuild
pkgbuild --root "${TEMP_DIR}/package-root" \
         --install-location "/" \
         --identifier com.ugetdm.uget-integrator-installer \
         --version "1.0" \
         "uget-integrator-installer.pkg"

# Clean up the temporary directory
rm -rf "${TEMP_DIR}"
