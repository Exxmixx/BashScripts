#!/bin/bash

#Text-Colors
BRed='\e[1;31m' #Bold Red
BBlu='\e[1;34m' #Bold Blue
BPur='\e[1;35m' #Bold Purple
BGre='\e[1;32m' #Bold Green

#clears the terminal
clear

echo -e "
 _____       _     _
|  |  |___ _| |___| |_ ___
|  |  | . | . | .'|  _| -_|
|_____|  _|___|__,|_| |___|
      |_|
Updates, Upgrades and removes\n";

# Makes sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

#Runs apt-get update in background as sudo user
echo -e "${BRed}Checking for updates...";
sudo apt-get update -y &>/dev/null
echo -e "${BRed}Done!";

#Runs apt-get upgrade in backround as sudo user
echo -e "${BBlu}Checking for Upgrades...";
sudo apt-get upgrade -y &>/dev/null
echo -e "${BBlu}Done!";

#Runs apt-get dist-upgrade in background as sudo user
echo -e "${BPur}Checking for Distro upgrades...";
sudo apt-get dist-upgrade -y &>/dev/null
echo -e "${BPur}Done!";

#Runs apt autoremove in background as sudo user
echo -e "${BGre}Removing unused packages";
sudo apt autoremove -y &>/dev/null
echo -e "${BGre}Done!";
