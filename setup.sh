#!/bin/bash

echo "Select your architecture:"
echo "1) amd64 / x86_64"
echo "2) i686 / x86"
read -p "Enter your choice (1 or 2): " choice

# General update
echo "Updating packages..."
apt update -y && apt upgrade -y

# Common dependencies
apt install git blink proot-distro -y

# Operation by selection
if [ "$choice" == "1" ]; then
    echo "Installing for amd64 / x86_64..."
    apt install qemu-user-x86-64 -y
    git clone https://github.com/cvnertnc/termux-proot-x86
    cd termux-proot-x86
    cp ./distros-x86_64/* $PREFIX/etc/proot-distro
    dos2unix $PREFIX/etc/proot-distro/*-x86_64.sh > /dev/null 
    echo "Now run proot-distro list and for install do proot-distro install (distro)!"
elif [ "$choice" == "2" ]; then
    echo "Installing for i686 / x86..."
    apt install qemu-user-i386 -y
    git clone https://github.com/cvnertnc/termux-proot-x86
    cd termux-proot-x86
    cp ./distros-i686/* $PREFIX/etc/proot-distro
    dos2unix $PREFIX/etc/proot-distro/*-i686.sh > /dev/null
    echo "Now run proot-distro list and for install do proot-distro install (distro)!"
else
    echo "Invalid choice. Exiting."
    exit 1
fi
