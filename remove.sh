#!/bin/bash

# Remove installed packages
sudo pacman -Rns hyprland kitty waybar \
swaybg swaylock-effects wofi wlogout mako thunar \
ttf-jetbrains-mono-nerd noto-fonts-emoji \
polkit-gnome python-requests starship \
swappy grim slurp pamixer brightnessctl gvfs \
bluez bluez-utils lxappearance xfce4-settings \
dracula-gtk-theme dracula-icons-git xdg-desktop-portal-hyprland

# Remove Asus ROG packages (if installed)
sudo pacman -Rns asusctl supergfxctl rog-control-center

# Remove additional configurations
sudo rm /etc/NetworkManager/conf.d/wifi-powersave.conf

# Remove additional repositories (if added)
sudo sed -i '/\[g14\]/,/Server = https:\/\/arch.asus-linux.org/ d' /etc/pacman.conf

# Remove copied config files
rm -rf ~/.config/hypr
rm -rf ~/.config/kitty
rm -rf ~/.config/mako
rm -rf ~/.config/waybar
rm -rf ~/.config/swaylock
rm -rf ~/.config/wofi
rm -rf ~/.config/starship.toml

# Remove additions to .bashrc (if applicable)
sed -i '/eval "$(starship init bash)"/d' ~/.bashrc

# Remove Asus ROG keys (if added)
sudo pacman-key --delete 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --delete 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --delete 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35

# Update the system
sudo pacman -Suy
