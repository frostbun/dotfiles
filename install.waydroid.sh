#!/usr/bin/env sh

source ./common.sh


echo "Installing Waydroid..."
install waydroid
sudo waydroid init 


echo "Configuring Waydroid package forwarding..."

sudo sysctl net.ipv4.ip_forward=1
sudo sysctl net.ipv4.conf.all.forwarding=1
sudo sysctl net.ipv6.conf.all.forwarding=1

install ufw
sudo systemctl enable --now ufw.service
sudo ufw enable
sudo ufw allow 67
sudo ufw allow 53
sudo ufw default allow FORWARD


echo "Installing Waydroid ARM translation libraries..."
git clone --depth=1 https://github.com/casualsnek/waydroid_script
cd waydroid_script
python3 -m venv venv
venv/bin/pip install -r requirements.txt
sudo venv/bin/python3 main.py install {libhoudini, magisk, gapps}

read -p "Open Waydroid & press [Enter] to continue..."
sudo venv/bin/python3 main.py certified
echo "Follow the instructions & clear Google Play Services data after 15 mins"


cd ..
sudo rm -rf waydroid_script
