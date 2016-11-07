#!/bin/bash

echo "-------------------------------"
echo "Welcome to your fresh "

awk 'FNR==2' /etc/os-release
echo "-------------------------------"

# apt update
# -------------
echo ""
echo "Let's make sure your sources are up to date"
echo "running apt update"
echo "-------------------------------"
sleep 3
sudo apt update
sleep 1
echo "Clearing the screen"
sleep 2
clear

# apt upgrade
# -------------
echo "-------------------------------"
echo "Installing upgrades"
echo "-------------------------------"
sudo -k apt upgrade -y
sleep 1
sudo apt dist-upgrade -y
sleep 1
clear

echo "-------------------------------"
echo "Installing Chromuim"
echo "-------------------------------"
sudo apt install chromium-browser -y
sleep 1

echo "-------------------------------"
echo "Installing LibreOffice"
echo "-------------------------------"
sudo apt install libreoffice gdebi -y
sleep 1

echo "-------------------------------"
echo "Installing prerequistries"
echo "-------------------------------"
sudo apt install lib32z1 lib32ncurses5 lib32stdc++6 network-manager network-manager-gnome network-manager-openvpn network-manager-openvpn-gnome -y
sleep 1

echo "-------------------------------"
echo "Installing privateinternetaccess VPN"
echo "-------------------------------"

wget https://www.privateinternetaccess.com/installer/install_ubuntu.sh
sudo sh ./install_ubuntu.sh
rm install_ubuntu.sh

echo "-------------------------------"
echo "Downloading Jetbrains tools"
echo "-------------------------------"

mkdir ~/.tools
cd ~/.tools

mkdir ~/.tools/android-studio
#Download apps
wget https://download.jetbrains.com/idea/ideaIU-2016.2.4.tar.gz -O idea.tar.gz
wget https://download.jetbrains.com/cpp/CLion-2016.2.2.tar.gz -O clion.tar.gz
wget https://dl.google.com/dl/android/studio/ide-zips/2.2.1.0/android-studio-ide-145.3330264-linux.zip -O android-studio.zip

echo "-------------------------------"
echo "Installing Jetbrains tools"
echo "-------------------------------"

#extract files
tar xvf idea.tar.gz -C ~/.tools
sleep 1
tar xvf clion.tar.gz -C ~/.tools
sleep 1
unzip android-studio.zip -d ~/.tools/
sleep 1

echo "-------------------------------"
echo "Cleaning Jetbrains installation files"
echo "-------------------------------"
rm ~/.tools/*.tar.gz
rm ~/.tools/*.zip
sleep 2

echo "-------------------------------"
echo "Installing dev tools"
echo "-------------------------------"

cd ~/Downloads
wget https://az764295.vo.msecnd.net/stable/66f37fd2a99eb9d628dd374d81d78835b410c39b/code_1.5.2-1473686317_amd64.deb -O visualstudiocode.deb
sleep 1
sudo gdebi visualstudiocode.deb
sudo apt install openjdk-8-jre openjdk-8-jdk -y
sleep 1

echo "-------------------------------"
echo "Installing atom"
echo "-------------------------------"

wget https://atom-installer.github.com/v1.10.2/atom-amd64.deb -O atom.deb
sudo gdebi atom.deb
sleep 1

wget https://release.gitkraken.com/linux/gitkraken-amd64.deb -O gitkraken.deb
sudo gdebi gitkraken.deb

echo "-------------------------------"
echo "Installing Insync"
echo "-------------------------------"

wget http://s.insynchq.com/builds/insync_1.3.11.36106-trusty_amd64.deb -O insync.deb
sudo gdebi insync.deb
sleep 1

echo "-------------------------------"
echo "Installing .NET Core"
echo "-------------------------------"

sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
sudo apt update
sudo apt install dotnet-dev-1.0.0-preview2-003131 -y

echo "-------------------------------"
echo "Installing other stuff"
echo "-------------------------------"

sudo apt install redshift gtk-redshift htop powertop zsh curl guake virtualbox -y

echo "-------------------------------"
echo "Cleaning up"
echo "-------------------------------"

rm ~/Downloads/*.deb
sleep 1

echo "-------------------------------"
echo "Installation finished. Restarting your computer."
echo "-------------------------------"
sleep 1
echo "Restarting in 5"
sleep 1
echo "Restarting in 4"
sleep 1
echo "Restarting in 3"
sleep 1
echo "Restarting in 2"
sleep 1
echo "Restarting in 1"
sleep 1

shutdown -r now
