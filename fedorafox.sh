#!/bin/env bash
# Tool to install latest firefox beta to Fedora.


VERSION=0.0.1
AUTHOR='Igorek536'

if [[ $(uname -p)=="x86_64" ]]; then
   BROWSEROS='linux64'
   FLASHOS='x86_64'
else
   BROWSEROS='linux'
   FLASHOS='i386'
fi

if [[ $(locale | grep LANG)=="LANG=ru_*" ]]; then
   LANG='ru'
else
   LANG='en-US'
fi

start_fun () {
   echo "#=========================================================#"
   echo "# Firefox beta installer version" $VERSION "by" $AUTHOR
   echo "# Tested on Fedora 26"
   echo "# This script depends on wget, so install it first!"
   echo "# Browser will be installed to /opt/firefox"
   echo "# Symlink /usr/local/bin/firefox-beta  will be created"
   echo "#=========================================================#"
   echo
}

clean_fun () {
   echo "Trying to clean caches..."
   cd /tmp/
   rm firefox*
   rm -rf flash_npapi
   echo
}

download_fun () {
   clean_fun
   cd /tmp/
   echo "Trying to download firefox archive..."
   echo
   echo
   wget -O firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-beta-latest&os=$BROWSEROS&lang=$LANG"
   echo "Trying to unpack browser archive..."
   tar jxf firefox.tar.bz2
   echo "Trying to download adobe flashplayer..."
   mkdir flash_npapi
   cd flash_npapi
   wget "https://fpdownload.adobe.com/get/flashplayer/pdc/26.0.0.151/flash_player_npapi_linux.$FLASHOS.tar.gz"
   tar -xzf flash_player_npapi_linux.$FLASHOS.tar.gz
   echo
}

install_fun () {
   start_fun
   download_fun
   cd /tmp/
   echo "Creating folder /opt/firefox"
   mkdir /opt/firefox
   echo "Moving data..."
   chown -R root:root firefox/ && mv /tmp/firefox /opt/firefox/firefox-beta
   echo "Removing old symlink if exist..."
   rm /usr/local/bin/firefox-beta
   echo "Creating symlink..."
   ln -s /opt/firefox/firefox-beta/firefox-bin /usr/local/bin/firefox-beta
   echo "Trying to install adobe flashplayer..."
   mkdir /opt/firefox/firefox-beta/browser/plugins/
   cd /tmp/flash_npapi
   cp libflashplayer.so /opt/firefox/firefox-beta/browser/plugins/
   echo "Ready! You can launch your browser with command: firefox-beta "
   echo
}

remove_fun () {
   echo "Trying to remove browser's directory..."
   rm -rf /opt/firefox
   echo "Trying to remove browser's symlink..."
   rm /usr/local/bin/firefox-beta
   echo "Browser removed from your computer!"
   echo "You can clean caches using clean argument."
   echo
}

help_fun () {
   echo
   echo "#========================================================#"
   echo "# Available arguments:"
   echo "# install   - install firefox browser"
   echo "# update    - update firefox browser(remove+install)"
   echo "# remove    - uninstall firefox browser"
   echo "# clean     - clean caches"
   echo "#========================================================#"
   echo
}

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
    echo "ERROR! This script must be run as root"
    echo
    exit 1
fi

while [[ -n "$1" ]]; do
   case "$1" in
   "install") install_fun;;
   "clean") clean_fun;;
   "update") remove_fun && install_fun;;
   "remove") remove_fun;;
   "help") help_fun;;
   *) help_fun;;
   esac
break
done
