#!/bin/bash

echo "Select an option:"
echo "1) Install amd64 / x86_64"
echo "2) Install i686 / x86"
echo "3) Install both (amd64 and i686)"
echo "4) Uninstall everything and clean up"
printf "Enter your choice (1, 2, 3 or 4): "
read choice < /dev/tty

# Update packages and install common dependencies unless cleaning
if [[ "$choice" != "4" ]]; then
    echo "Updating packages..."
    apt update -y && apt upgrade -y
    apt install git blink proot-distro dos2unix -y
fi

# Function: Install amd64 support
setup_amd64() {
    echo "Installing support for amd64 / x86_64..."
    apt install qemu-user-x86-64 -y
    cp ./distros-x86_64/* $PREFIX/etc/proot-distro
    dos2unix $PREFIX/etc/proot-distro/*-x86_64.sh > /dev/null
}

# Function: Install i686 support
setup_i686() {
    echo "Installing support for i686 / x86..."
    apt install qemu-user-i386 -y
    cp ./distros-i686/* $PREFIX/etc/proot-distro
    dos2unix $PREFIX/etc/proot-distro/*-i686.sh > /dev/null
}

# Function: Full cleanup
cleanup_all() {
    echo "Cleaning up all files and packages..."

    # Remove cloned repo
    rm -rf ~/termux-proot-x86

    # Remove installed PRoot-distro scripts
    rm -f $PREFIX/etc/proot-distro/*-x86_64.sh
    rm -f $PREFIX/etc/proot-distro/*-i686.sh

    # Optional: Remove installed packages
    pkg uninstall qemu-user-x86-64 qemu-user-i386 blink proot-distro git dos2unix -y

    echo "Cleanup complete."
    exit 0
}

# Clone repo if needed
if [[ "$choice" =~ [1-3] ]]; then
    if [ ! -d "termux-proot-x86" ]; then
        git clone https://github.com/cvnertnc/termux-proot-x86
    fi
    cd termux-proot-x86 || exit 1
fi

# Perform operation based on user choice
case "$choice" in
    1) setup_amd64 ;;
    2) setup_i686 ;;
    3)
        setup_amd64
        setup_i686
        ;;
    4) cleanup_all ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "Done. You can now run: proot-distro list"
echo "Then install a distro using: proot-distro install <distro-name>"