#!/bin/bash

PACMAN_PACKAGES=(
  "alacritty" "base-devel" "btop" "file-roller" "hyprland" "hyprpaper" "ly" "nano" "neofetch" "nvidia" "pulsemixer" "steam" "thunar" "waybar" "rofi-wayland" "plymouth"
)

PARU_PACKAGES=(
  "bibata-cursor-theme-bin" "google-chrome" "gruvbox-gtk-theme-git" "gruvbox-icon-theme-git" "hyprshot" "spicetify-cli" "spotify" "vesktop-bin" "plymouth-theme-loader-2-git"
)

gsettings set org.gnome.desktop.interface gtk-theme 'Gruvbox-Green-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'Gruvbox-Dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
gsettings set org.gnome.desktop.interface font-name 'SourceCodePro 11'
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
spicetify update
sudo cp -f ~/Hypr/mkinitcpio.conf /etc/
sudo mkinitcpio -p linux
sudo cp -f ~/Hypr/grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo plymout-default-theme -R loader_2
sudo cp -f ~/Hypr/pltmouth.conf /etc/plymouth/
sudo mkinitcpio -p linux

# === Step 7: Final cleanup ===
sudo pacman -Rns $(pacman -Qdtq) --noconfirm
sudo pacman -Scc --noconfirm
