#!/bin/bash
echo "Installing / Updating github-manager tool"
LIB_DIRECTORY=/usr/local/lib/github-manager
BIN_DIRECTORY=/usr/local/bin
rm -f $BIN_DIRECTORY/github-manager
if [ ! -d "$LIB_DIRECTORY" ]; then
  git clone -b master https://github.com/lukaszraczylo/github-manager.git $LIB_DIRECTORY
else
  cd $LIB_DIRECTORY
  git pull --rebase
fi

cd $LIB_DIRECTORY
bundle install
cp installer.sh $BIN_DIRECTORY/github-manager-updater && chmod +x $BIN_DIRECTORY/github-manager-updater
ln -s $LIB_DIRECTORY/github-manager $BIN_DIRECTORY/github-manager