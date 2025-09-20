#!/usr/bin/env sh

source ./common.sh


echo "Installing Waydroid..."
install waydroid
waydroid init 


if prompt "Configure software rendering"; then
    echo "ro.hardware.gralloc=default" | sudo tee -a /var/lib/waydroid/waydroid.cfg
    echo "ro.hardware.egl=swiftshader" | sudo tee -a /var/lib/waydroid/waydroid.cfg
    waydroid upgrade --offline
fi


echo "Configuring Waydroid package forwarding..."

sudo sysctl net.ipv4.ip_forward=1
sudo sysctl net.ipv4.conf.all.forwarding=1
sudo sysctl net.ipv6.conf.all.forwarding=1

install ufw
sudo ufw allow 67
sudo ufw allow 53
sudo ufw default allow FORWARD
sudo ufw enable


echo "Installing Waydroid ARM translation libraries..."

git clone --depth=1 https://github.com/casualsnek/waydroid_script
cd waydroid_script
python3 -m venv venv
venv/bin/pip install -r requirements.txt

sudo venv/bin/python3 main.py install libhoudini
sudo venv/bin/python3 main.py install gapps

read -p "Open Waydroid & press [Enter] to continue..."
sudo python3 main.py google
echo "Follow the instructions & clear Google Play Services data after 15 mins"

cd ..
rm -rf waydroid_script
