#!/bin/bash
set -euv
echo 'deb-src http://deb.debian.org/debian/ stretch main non-free contrib' >> /etc/apt/sources.list
DEBIAN_FRONTEND=noninteractive 
apt update
apt install -y libgnomeui-dev
apt build-dep -y vim

cd /tmp
git clone --depth=1 https://github.com/vim/vim
cd vim
./configure --with-features=huge --enable-terminal --enable-gui=gnome2 --enable-gnome-check=ye
make -j9
make install
cd ../
rm -rf vim
rm -rf /var/lib/apt/lists/*

