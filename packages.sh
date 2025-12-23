#!/bin/bash

# jq Exists?
if ! command -v jq  &> /dev/null; then # if not exists..
    echo "Installing Jq For Read Json..."
    sleep 2
    sudo apt install -y jq
fi

# Install Default Packages
sudo apt update && sudo apt full-upgrade -y

# Locals
pack="pack.json"
Packages=($(jq -r '.Packages[]' "$pack"))

echo "Installing packages Please Wite......."
# Read Json And Install PKG
for pkg in "${Packages[@]}"; do
    echo -e "\e[96mInstalling $pkg......\e[0m"
    sleep 2
    sudo apt install -y "$pkg"
done

clear

Sleep 3
# Restart System
read -p "The package installation was successful. Do you want to restart? (y/n): " restart
if [[ "$restart" == "y" ]] || [[ "$restart" == "Y" ]]; then 
    echo "5 seconds until restart to cancel (CTRL + C)! "
    sleep 5
    reboot
else
    clear
    echo "Restart later and let it settle. XD"
    echo "Good Lock!<3"
    neofetch || fastfetch
fi

# Created By GodFather
