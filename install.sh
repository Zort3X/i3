#!/bin/bash

# === Global Variables ===
PACMAN_PACKAGES=(
  # Essential utilities
  "base-devel" "nano" "file-roller" "neofetch" "btop" "pulsemixer"

  # Desktop environment and tools
  "alacritty" "thunar" "polybar" "rofi" "feh"

  # Fonts and extras
  "ttf-sourcecodepro-nerd"
)

PARU_PACKAGES=(
  # Development tools
  "pod2man"

  # Themes and appearance
  "bibata-cursor-theme-bin" "gruvbox-gtk-theme-git" "gruvbox-icon-theme-git"

  # Applications
  "google-chrome" "gscreenshot"

  # Window manager utilities
  "i3-rounded-border-patch-git" "i3-auto-tiling" "picom-simpleanims-next-git"
)

OH_MY_BASH_INSTALL_URL="h"
cd ~

# === Functions ===
handle_error() {
  echo "Error: $1"
  exit 1
}

install_pacman_packages() {
  echo "Installing pacman packages..."
  sudo pacman -Sy --noconfirm "${PACMAN_PACKAGES[@]}" || handle_error "Failed to install pacman packages."
}

install_paru() {
  echo "Cloning and installing Paru..."
  git clone https://aur.archlinux.org/paru.git || handle_error "Failed to clone Paru."
  cd paru/ || handle_error "Failed to change to paru directory."
  makepkg -si --noconfirm || handle_error "Failed to install Paru."
  cd ~
  sudo rm -rf paru/ || handle_error "Failed to clean up Paru directory."
}

install_paru_packages() {
  echo "Installing Paru packages..."
  paru -Sy --noconfirm "${PARU_PACKAGES[@]}" || handle_error "Failed to install Paru packages."
}

configure_system() {
  echo "Copying configuration files..."
  sudo cp -f ~/i3/nanorc /etc/ || handle_error "Failed to copy nanorc."
  sudo cp -rf ~/i3/.config ~/ || handle_error "Failed to copy .config directory."
  sudo cp -f ~/i3/.Xresources ~/ || handle_error "Failed to copy .Xresources."
  sudo chmod +x ~/.config/lang_tog.sh || handle_error "Failed to set permissions for lang_tog.sh."
}

cleanup_system() {
  echo "Cleaning up the system..."
  sudo pacman -Rns $(pacman -Qdtq) --noconfirm || handle_error "Failed to remove unused packages."
  sudo pacman -Sc --noconfirm || handle_error "Failed to clean package cache."
}

install_oh_my_bash() {
  echo "Installing Oh My Bash..."
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" || handle_error "Failed to install Oh My Bash."
}

# === Main Execution ===
install_pacman_packages
install_paru
install_paru_packages
configure_system
cleanup_system
install_oh_my_bash
