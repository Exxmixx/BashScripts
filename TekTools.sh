#!/bin/bash

RCol='\e[0m' #Original Terminal Text Color Variable
BBlu='\e[1;34m' #Bold Blue Text Color Variable
BGre='\e[1;32m' #Bold Green Text Color Variable
BRed='\e[1;31m' #Bold Red Text Volor Variable
UWhi='\e[4;37m' #Underlined White Text Color Variable

# Makes sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

#Clear the terminal screen
clear

#Fancy ASCII Art
echo -e "${BGre}
 _____     _       _____         _
|_   _|___| |_ ___|_   _|___ ___| |___
  | | | -_| '_|_ -| | | | . | . | |_ -|
  |_| |___|_,_|___| |_| |___|___|_|___|
"

#Disclaimer
echo -e "${BGre}Installs all of Teks recommended useful Tools and Software for Kali\n"
echo -e "${BRed}**I do not own, nor did I make any of these tools or Software!**\n"

echo -e "${RCol}These are simply tools and software I use and recommend,\n
as well as this is a simple script to save me time from installing them all myself."

#Check for updates with apt-get update
echo -e "${BBlu}Checking for updates..."
sudo apt-get -qq update -y &>/dev/null
echo -e "${BGre}Done!\n"

#Adds i386 Architechture to your dpkg list
echo -e "${BBlu}Adding i386 Architecture..."
sudo dpkg --add-architecture i386
echo -e "${BGre}Done!\n"

#Installs linux-headers
echo -e "${BBlu}Installing linux headers..."
sudo apt-get install linux-headers-$(uname -r) -y &>/dev/null
echo -e "${BGre}Done!\n"

#Installs Libre Office
echo -e "${BBlu}Installing Libre Office..."
sudo apt-get install libreoffice -y &>/dev/null
echo -e "${BGre}Done!\n"

#Installs Microsoft-Core fonts
echo -e "${BBlu}Installing Microsoft Fonts..."
sudo apt-get install ttf-mscorefonts-installer -y &>/dev/null
echo -e "${BGre}Done!\n"

#Installs the Terminator Terminal
echo -e "${BBlu}Installing Terminator..."
sudo apt-get install terminator -y &>/dev/null
echo -e "${BGre}Done!\n"

#Install Tor
echo -e "${BBlu}Installing Tor..."
sudo apt-get install tor -y &>/dev/null
echo -e "${BGre}Done!\n"

#Installs HexChat IRC Client
echo -e "${BBlu}Installing Hexchat..."
sudo apt-get install hexchat -y &>/dev/null
echo -e "${BGre}Done!\n"

#Installs the Gnome Screenshot tool
echo -e "${BBlu}Installing Gnome Screenshot tool..."
sudo apt-get install gnome-screenshot -y &>/dev/null
echo -e "${BGre}Done!\n"

#Install Cups Printing Service
echo -e "${BBlu}Installing Cups printing service..."
sudo apt-get install cups -y &>/dev/null
echo -e "${BGre}Done!"
echo -e "${RCol}Be sure to run 'service cups start' before trying to add a printer/printing"

#Installs the most recent Network Miner and adds it as a command to be run from anywhere.
echo -e "${BBlu}Removing older versions of NetworkMiner..."
sudo rm /tmp/nm.zip
sudo rm -rf /opt/NetworMiner*
echo -e "${BBlu}Installing Network Miner..."
sudo apt-get install libmono-system-windows-forms4.0-cil -y &>/dev/null
sudo apt-get install libmono-system-web4.0-cil -y &>/dev/null
sudo apt-get install libmono-system-net4.0-cil -y &>/dev/null
sudo apt-get install libmono-system-runtime-serialization4.0-cil -y &>/dev/null
sudo wget www.netresec.com/?download=NetworkMiner -O /tmp/nm.zip
sudo unzip /tmp/nm.zip -d /opt/
sudo chmod +x /opt/NetworkMiner*/NetworkMiner.exe
sudo chmod -R go+w /opt/NetworkMiner*/AssembledFiles/
sudo chmod -R go+w /opt/NetworkMiner*/Captures/
sudo mv /opt/NetworkMiner* /opt/NetworkMiner
sudo touch NetworkMiner
echo "mono /opt/NetworkMiner/NetworkMiner.exe &" > NetworkMiner
sleep 1
sudo chmod +x NetworkMiner
sudo mv NetworkMiner /usr/bin/NetworkMiner
echo -e "${BGre}Done! To run Networkminer simlpy run the command: NetworkMiner\n"

echo -e "${UWhi}All done! Happy Hacking! :)"
