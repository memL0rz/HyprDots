#!/bin/bash


#### Check for yay ####
ISYAY=/sbin/yay
if [ -f "$ISYAY" ]; then 
    echo -e "yay was located, moving on.\n"
    yay -Suy
else 
    echo -e "yay was not located, please install yay. Exiting script.\n"
    exit 
fi
clear



echo "  ██████  █     █░▓█████ ▓█████▄▄▄█████▓    ██░ ██▓██   ██▓ ██▓███   ██▀███  "
echo "▒██    ▒ ▓█░ █ ░█░▓█   ▀ ▓█   ▀▓  ██▒ ▓▒   ▓██░ ██▒▒██  ██▒▓██░  ██▒▓██ ▒ ██▒"
echo "░ ▓██▄   ▒█░ █ ░█ ▒███   ▒███  ▒ ▓██░ ▒░   ▒██▀▀██░ ▒██ ██░▓██░ ██▓▒▓██ ░▄█ ▒"
echo "  ▒   ██▒░█░ █ ░█ ▒▓█  ▄ ▒▓█  ▄░ ▓██▓ ░    ░▓█ ░██  ░ ▐██▓░▒██▄█▓▒ ▒▒██▀▀█▄  "
echo "▒██████▒▒░░██▒██▓ ░▒████▒░▒████▒ ▒██▒ ░    ░▓█▒░██▓ ░ ██▒▓░▒██▒ ░  ░░██▓ ▒██▒"
echo "▒ ▒▓▒ ▒ ░░ ▓░▒ ▒  ░░ ▒░ ░░░ ▒░ ░ ▒ ░░       ▒ ░░▒░▒  ██▒▒▒ ▒▓▒░ ░  ░░ ▒▓ ░▒▓░"
echo "░ ░▒  ░ ░  ▒ ░ ░   ░ ░  ░ ░ ░  ░   ░        ▒ ░▒░ ░▓██ ░▒░ ░▒ ░       ░▒ ░ ▒░"
echo "░  ░  ░    ░   ░     ░      ░    ░          ░  ░░ ░▒ ▒ ░░  ░░         ░░   ░ "
echo "      ░      ░       ░  ░   ░  ░            ░  ░  ░░ ░                 ░     "
echo "                                                   ░ ░                       "






### Install all of the above pacakges ####
read -n1 -rep 'Install Packages for Hyprland? (y,n)' INST
if [[ $INST == "Y" || $INST == "y" ]]; then
    yay -S --noconfirm hyprland kitty waybar \
    swaybg swaylock-effects wofi wlogout mako thunar \
    ttf-jetbrains-mono-nerd noto-fonts-emoji \
    polkit-gnome python-requests starship \
    swappy grim slurp pamixer brightnessctl gvfs \
    bluez bluez-utils lxappearance xfce4-settings \
    dracula-gtk-theme dracula-icons-git xdg-desktop-portal-hyprland \
    firefox-developer-edition gnome-software flatpak discord betterdiscord-installer-bin \
    spotify postman virtualbox qbittorrent filezilla arduino code htop bashtop fish dolphin

    # Start the bluetooth service
    echo -e "Starting the Bluetooth Service...\n"
    sudo systemctl enable --now bluetooth.service
    sleep 2
    
    # Clean out other portals
    echo -e "Cleaning out conflicting xdg portals...\n"
    yay -R --noconfirm xdg-desktop-portal-gnome xdg-desktop-portal-gtk
fi

### Copy Config Files ###
read -n1 -rep 'Would you like to copy config files? (y,n)' CFG
if [[ $CFG == "Y" || $CFG == "y" ]]; then
    echo -e "Copying config files...\n"
    cp -R .config ~/
    
    # Set some files as exacutable 
    chmod +x ~/.config/hypr/xdg-portal-hyprland
    chmod +x ~/.config/waybar/scripts/waybar-wttr.py
fi

### Script is done ###
echo -e "Script had completed.\n"
echo -e "You can start Hyprland by typing Hyprland (note the capital H).\n"
read -n1 -rep 'Start Hypr? (y,n)' HYP
if [[ $HYP == "Y" || $HYP == "y" ]]; then
    exec Hyprland
else
    exit
fi
