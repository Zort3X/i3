#!/bin/bash

PACMAN_PACKAGES=(
  "alacritty" "base-devel" "btop" "file-roller" "nano" "neofetch" "pulsemixer" "steam" "thunar" "polybar" "rofi" "plymouth"
)

PARU_PACKAGES=(
  "bibata-cursor-theme-bin" "google-chrome" "gruvbox-gtk-theme-git" "gruvbox-icon-theme-git" "spicetify-cli" "spotify" "vesktop-bin" "plymouth-theme-loader-2-git" "ttf-adobe-source-code-pro-fonts"
)


# === Step 1: Update pacman.conf ===
cd ~
sudo cp -f ~/i3/pacman.conf /etc/
sudo cp -f ~/i3/nanorc /etc/

# === Step 2: Install essential packages with pacman ===
sudo pacman -Sy --noconfirm "${PACMAN_PACKAGES[@]}"

# === Step 3: Install paru (AUR helper) and essential packeges ===
git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si --noconfirm
cd ~
sudo rm -rf paru/

# === Step 4: Install essential packages with paru ===
paru -Sy --noconfirm "${PARU_PACKAGES[@]}"

# === Step 6: Clone and copy dotfiles ===
sudo cp -r ~/i3/.config ~
gsettings set org.gnome.desktop.interface gtk-theme 'Gruvbox-Green-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'Gruvbox-Dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
gsettings set org.gnome.desktop.interface font-name 'SourceCodePro 11'
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
spicetify update

# === Step 7: Final cleanup ===
sudo pacman -Rns $(pacman -Qdtq) --noconfirm
sudo pacman -Scc --noconfirm
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" & cp -f ~/i3/.bashrc ~ & sudo rm -rf ~/i3/ & reboot
