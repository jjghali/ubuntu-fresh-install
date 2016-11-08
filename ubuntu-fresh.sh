#!/bin/bash

#URLS
ANDROIDSTUDIO_URL="https://dl.google.com/dl/android/studio/ide-zips/2.2.2.0/android-studio-ide-145.3360264-linux.zip"
CLION_URL="https://download.jetbrains.com/cpp/CLion-2016.2.2.tar.gz"
IDEA_URL="https://download.jetbrains.com/idea/ideaIU-2016.2.5.tar.gz"
PIA_URL="https://www.privateinternetaccess.com/installer/install_ubuntu.sh"
VISUALSTUDIO_URL="https://az764295.vo.msecnd.net/stable/02611b40b24c9df2726ad8b33f5ef5f67ac30b44/code_1.7.1-1478180561_amd64.deb"
ATOM_URL="https://atom-installer.github.com/v1.10.2/atom-amd64.deb"
GITKRAKEN_URL="https://release.gitkraken.com/linux/gitkraken-amd64.deb"
INSYNC_URL="http://s.insynchq.com/builds/insync_1.3.11.36106-trusty_amd64.deb"
TEAMSPEAK_URL="http://dl.4players.de/ts/releases/3.0.19.4/TeamSpeak3-Client-linux_amd64-3.0.19.4.run"

echo "-------------------------------"
echo "Welcome to your fresh "

awk 'FNR==2' /etc/os-release
echo "-------------------------------"

echo "-------------------------------"
echo "Adding PPA repos"
echo "-------------------------------"

sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893

sudo apt-add-repository ppa:tista/adapta
sudo apt-add-repository ppa:varlesh-l/papirus-pack
sudo apt-add-repository ppa:yktooo/ppa

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
sudo -k apt full-upgrade -y
sleep 1

echo "-------------------------------"
echo "Installing apps"
echo "-------------------------------"
sudo apt install chromium-browser gdebi lib32z1 lib32ncurses5 lib32stdc++6 network-manager network-manager-gnome network-manager-openvpn network-manager-openvpn-gnome -y
sleep 1
sudo apt install redshift gtk-redshift htop powertop zsh curl guake virtualbox gstreamer1.0-plugins-ugly gimp banshee openjdk-8-jre openjdk-8-jdk -y
sleep 1
sudo apt install dotnet-dev-1.0.0-preview2-003131 adapta-gtk-theme papirus-icons unity-tweak-tool indicator-sound-switcher -y
sleep 1

echo "-------------------------------"
echo "Installing privateinternetaccess VPN"
echo "-------------------------------"

wget $PIA_URL
sudo sh ./install_ubuntu.sh
rm install_ubuntu.sh

echo "-------------------------------"
echo "Downloading Jetbrains tools"
echo "-------------------------------"

mkdir ~/.tools
cd ~/.tools

mkdir ~/.tools/android-studio
#Download apps
wget $IDEA_URL -O idea.tar.gz
wget $CLION_URL -O clion.tar.gz
wget $ANDROIDSTUDIO_URL -O android-studio.zip

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
wget VISUALSTUDIO_URL -O visualstudiocode.deb
sleep 1
sudo gdebi visualstudiocode.deb

echo "-------------------------------"
echo "Installing atom"
echo "-------------------------------"

wget $ATOM_URL -O atom.deb
sudo gdebi atom.deb
sleep 1


echo "-------------------------------"
echo "Installing atom"
echo "-------------------------------"


cd ~/.tools
wget $TEAMSPEAK_URL -O teamspeak.run
chmod +x teamspeak.run
./teamspeak.run

sleep 1

wget $GITKRAKEN_URL -O gitkraken.deb
sudo gdebi gitkraken.deb

echo "-------------------------------"
echo "Installing Insync"
echo "-------------------------------"

wget $INSYNC_URL -O insync.deb
sudo gdebi insync.deb
sleep 1

mkdir ~/git-repos

echo "-------------------------------"
echo "Installing oh my zsh"
echo "-------------------------------"

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

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
