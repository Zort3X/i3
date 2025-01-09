#!/bin/bash

PACMAN_PACKAGES=(
  "alacritty" "base-devel" "btop" "file-roller" "nano" "neofetch" "pulsemixer" "steam" "thunar" "polybar" "rofi" "plymouth" "feh" "ttf-sourcecodepro-nerd"
)

PARU_PACKAGES=(
  "pod2man" "bibata-cursor-theme-bin" "google-chrome" "gruvbox-gtk-theme-git" "gruvbox-icon-theme-git" "spicetify-cli" "spotify" "vesktop-bin" "plymouth-theme-loader-2-git" "i3-rounded-border-patch-git" "i3-auto-tiling" "picom-simpleanims-next-git" "gscreenshot"
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
cp -f ~/i3/mkinitcpio.conf /etc/
cp -f ~/i3/grub /etc/default/
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo plymouth-set-default-theme -R loader_2
cp -f ~/i3/grub.cfg /boot/grub/
sudo cp -r ~/i3/.config ~
sudo cp -r ~/i3/.Xresources ~
xrdb -merge ~/.Xresources
sudo chmod +x ~/.config/lang_tog.sh
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
spicetify update

# === Step 7: Final cleanup ===
sudo pacman -Rns $(pacman -Qdtq) --noconfirm
sudo pacman -Sc --noconfirm
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" 
