#!/bin/bash

#URLS
$androidstudio="https://dl.google.com/dl/android/studio/ide-zips/2.2.2.0/android-studio-ide-145.3360264-linux.zip"
$clion="https://download.jetbrains.com/cpp/CLion-2016.2.2.tar.gz"
$intellij="https://download.jetbrains.com/idea/ideaIU-2016.2.5.tar.gz"
$privateinternetaccess="https://www.privateinternetaccess.com/installer/install_ubuntu.sh"
$visualstudiocode="https://az764295.vo.msecnd.net/stable/02611b40b24c9df2726ad8b33f5ef5f67ac30b44/code_1.7.1-1478180561_amd64.deb"
$atom="https://atom-installer.github.com/v1.10.2/atom-amd64.deb"
$gitkraken="https://release.gitkraken.com/linux/gitkraken-amd64.deb"
$insync="http://s.insynchq.com/builds/insync_1.3.11.36106-trusty_amd64.deb"
$teamspeak="http://dl.4players.de/ts/releases/3.0.19.4/TeamSpeak3-Client-linux_amd64-3.0.19.4.run"

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
echo "Installing gdebi"
echo "-------------------------------"
sudo apt install gdebi -y
sleep 1

echo "-------------------------------"
echo "Installing prerequistries"
echo "-------------------------------"
sudo apt install lib32z1 lib32ncurses5 lib32stdc++6 network-manager network-manager-gnome network-manager-openvpn network-manager-openvpn-gnome -y
sleep 1

echo "-------------------------------"
echo "Installing privateinternetaccess VPN"
echo "-------------------------------"

wget $privateinternetaccess
sudo sh ./install_ubuntu.sh
rm install_ubuntu.sh

echo "-------------------------------"
echo "Downloading Jetbrains tools"
echo "-------------------------------"

mkdir ~/.tools
cd ~/.tools

mkdir ~/.tools/android-studio
#Download apps
wget $intellij -O idea.tar.gz
wget $clion -O clion.tar.gz
wget $androidstudio -O android-studio.zip

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
wget $visualstudiocode -O visualstudiocode.deb
sleep 1
sudo gdebi visualstudiocode.deb
sudo apt install openjdk-8-jre openjdk-8-jdk -y
sleep 1

echo "-------------------------------"
echo "Installing atom"
echo "-------------------------------"

wget $atom -O atom.deb
sudo gdebi atom.deb
sleep 1


echo "-------------------------------"
echo "Installing atom"
echo "-------------------------------"


cd ~/.tools
wget $teamspeak -O temaspeak.run
chmod +x teamspeak.run
./teamspeak.run

sleep 1

wget $gitkraken -O gitkraken.deb
sudo gdebi gitkraken.deb

echo "-------------------------------"
echo "Installing Insync"
echo "-------------------------------"

wget $insync -O insync.deb
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

sudo apt install redshift gtk-redshift htop powertop zsh curl guake virtualbox gstreamer-1.0-plugins-ugly -y

echo "-------------------------------"
echo "Installing papirus icon theme and Adapta"
echo "-------------------------------"

sudo apt-add-repository ppa:tista/adapta
sudo add-apt-repository ppa:varlesh-l/papirus-pack
sudo apt update
sudo apt install adapta-gtk-theme papirus-icons unity-tweak-tool -y

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
