#!/bin/bash

echo "Select your architecture:"
echo "1) amd64 / x86_64"
echo "2) i686 / x86"
echo "3) Both (amd64 and i686)"
read -p "Enter your choice (1, 2 or 3): " choice

# General update
echo "Updating packages..."
apt update -y && apt upgrade -y

# Common dependencies
apt install git blink proot-distro dos2unix -y

# Clone the repo once
if [ ! -d "termux-proot-x86" ]; then
    git clone https://github.com/cvnertnc/termux-proot-x86
fi
cd termux-proot-x86 || exit 1

# Function for amd64 setup
setup_amd64() {
    echo "Installing for amd64 / x86_64..."
    apt install qemu-user-x86-64 -y
    cp ./distros-x86_64/* $PREFIX/etc/proot-distro
    dos2unix $PREFIX/etc/proot-distro/*-x86_64.sh > /dev/null
}

# Function for i686 setup
setup_i686() {
    echo "Installing for i686 / x86..."
    apt install qemu-user-i386 -y
    cp ./distros-i686/* $PREFIX/etc/proot-distro
    dos2unix $PREFIX/etc/proot-distro/*-i686.sh > /dev/null
}

# Operation by selection
case "$choice" in
    1)
        setup_amd64
        ;;
    2)
        setup_i686
        ;;
    3)
        setup_amd64
        setup_i686
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "Done. You can now run: proot-distro list"
echo "Then install with: proot-distro install <distro>"
