#!/bin/bash

# === Global Variables ===
PACMAN_PACKAGES=(
  # Essential utilities
  "base-devel" "nano" "file-roller" "neofetch" "btop" "pulsemixer"

  # Desktop environment and tools
  "alacritty" "thunar" "polybar" "rofi" "feh" "plymouth"

  # Fonts and extras
  "ttf-sourcecodepro-nerd" "steam"
)

PARU_PACKAGES=(
  # Development tools
  "pod2man"

  # Themes and appearance
  "bibata-cursor-theme-bin" "gruvbox-gtk-theme-git" "gruvbox-icon-theme-git"

  # Applications
  "google-chrome" "spotify" "vesktop-bin" "gscreenshot"

  # System enhancements
  "spicetify-cli" "plymouth-theme-loader-2-git"

  # Window manager utilities
  "i3-rounded-border-patch-git" "i3-auto-tiling" "picom-simpleanims-next-git"
)

I3_DIR="$HOME/i3"
CONFIG_DIR="$HOME/.config"
GRUB_CONFIG="/boot/grub/grub.cfg"
OH_MY_BASH_INSTALL_URL="https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh"

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

setup_audio() {
  echo "Setting audio volumes to 100%..."
  pactl set-sink-volume @DEFAULT_SINK@ 100% || handle_error "Failed to set sink volume."
  pactl set-source-volume @DEFAULT_SOURCE@ 100% || handle_error "Failed to set source volume."
}

configure_system() {
  echo "Copying configuration files..."
  sudo cp -f "$I3_DIR/pacman.conf" /etc/ || handle_error "Failed to copy pacman.conf."
  sudo cp -f "$I3_DIR/nanorc" /etc/ || handle_error "Failed to copy nanorc."
  sudo cp -f "$I3_DIR/mkinitcpio.conf" /etc/ || handle_error "Failed to copy mkinitcpio.conf."
  sudo cp -f "$I3_DIR/grub" /etc/default/ || handle_error "Failed to copy grub configuration."
  sudo mkinitcpio -P || handle_error "Failed to regenerate initramfs."
  sudo grub-mkconfig -o "$GRUB_CONFIG" || handle_error "Failed to update GRUB configuration."
  sudo plymouth-set-default-theme -R loader_2 || handle_error "Failed to set Plymouth theme."
  sudo cp -r "$I3_DIR/grub.cfg" "$GRUB_CONFIG" || handle_error "Failed to copy GRUB.cfg."
  sudo cp -r "$I3_DIR/.config" "$HOME/" || handle_error "Failed to copy .config directory."
  sudo cp -r "$I3_DIR/.Xresources" "$HOME/" || handle_error "Failed to copy .Xresources."
  xrdb -merge "$HOME/.Xresources" || handle_error "Failed to merge Xresources."
}

configure_spotify() {
  echo "Configuring Spotify..."
  sudo chmod +x "$CONFIG_DIR/lang_tog.sh" || handle_error "Failed to set permissions for lang_tog.sh."
  sudo chmod a+wr /opt/spotify || handle_error "Failed to set permissions for Spotify."
  sudo chmod a+wr /opt/spotify/Apps -R || handle_error "Failed to set permissions for Spotify Apps directory."
  spicetify update || handle_error "Failed to update Spicetify."
}

cleanup_system() {
  echo "Cleaning up the system..."
  sudo pacman -Rns $(pacman -Qdtq) --noconfirm || handle_error "Failed to remove unused packages."
  sudo pacman -Sc --noconfirm || handle_error "Failed to clean package cache."
}

install_oh_my_bash() {
  echo "Installing Oh My Bash..."
  bash -c "$(curl -fsSL $OH_MY_BASH_INSTALL_URL)" || handle_error "Failed to install Oh My Bash."
}

# === Main Execution ===
install_pacman_packages
install_paru
install_paru_packages
setup_audio
configure_system
configure_spotify
cleanup_system
install_oh_my_bash

echo "Setup completed successfully!"
