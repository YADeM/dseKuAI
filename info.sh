#!/bin/bash
NAME=$(exec hostname)
#AFILE = /etc/apt/apt.conf.d/02proxy
if [ ! -f /etc/apt/apt.conf.d/02proxy ]
then
    echo "Add apt-proxy settings"
	sudo echo "Acquire::http { Proxy "http://192.168.0.65:3142"; };" > /etc/apt/apt.conf.d/02proxy
fi
sudo add-apt-repository -y ppa:libreoffice/ppa
sudo apt-get update
sudo apt-get --force-yes -f install -y hardinfo smartmontools filezilla remmina gimp pavucontrol chromium-browser
sudo apt-get install libreoffice
wget http://www.skype.com/go/getskype-linux-beta-ubuntu-64
wget http://download.teamviewer.com/download/teamviewer_i386.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i teamviewer_i386.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo dpkg -i getskype-linux-beta-ubuntu-64
sudo apt-get install -f -y
sudo apt-get autoremove
sudo hardinfo -m computer.so -a -f html > $NAME.html

ftp -n dse.pp.ua <<End-Of-Session
quote user ftp2
quote pass ftp2
put $NAME.html
bye
<<End-Of-Session
