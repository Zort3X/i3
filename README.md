# 🏔️ Arch Linux + i3wm Rice: Custom Desktop Environment

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Arch Linux](https://img.shields.io/badge/OS-Arch%20Linux-blue?logo=arch-linux)](https://archlinux.org/)
[![Window Manager](https://img.shields.io/badge/WM-i3wm-lightgrey?logo=i3)](https://i3wm.org/)

## 📖 Project Overview
This repository contains my final school project: a fully customized, optimized, and visually cohesive desktop environment built from scratch on **Arch Linux** using the **i3 window manager (i3wm)**. 

The goal of this project was to move away from windows and bloated, pre-configured desktop environments (like GNOME or KDE) to build a minimal, keyboard-driven workflow that maximizes system resource efficiency and developer productivity.

### 🎯 Key Objectives
* **Minimalism & Efficiency:** Idle RAM usage kept under 400MB.
* **Keyboard-Driven Workflow:** Tiling window management to eliminate mouse dependency.
* **Aesthetic Cohesion:** A strict, dark-mode color palette applied across all system applications.
* **Automation:** Dotfiles organized and easily deployable via a setup script.

---

## ⌨️ Keybindings Quick Reference
The system relies heavily on the **Mod key** (configured to the `Super`/`Windows` key).

* `Mod + Enter` ➡️ Open Terminal
* `Mod + d` ➡️ Open Rofi (App Launcher)
* `Mod + Shift + q` ➡️ Close Focused Window
* `Mod + Arrow Keys` ➡️ Navigate between windows
* `Mod + Shift + e` ➡️ Exit i3 / Log out

---

## 🚀 Installation & Deployment

> [!IMPORTANT]
> **Project Pivot Note:** The automatic installation scripts were deprecated and removed. I have since migrated my primary workflows to **Wayland** (using **Sway** as a modern drop-in replacement for i3, and **Hyprland** depending on the machine). 
> 
> As a result, these specific i3 files are preserved here as a snapshot of my stable X11 configuration. They are intended to be audited and copied manually.

### 📁 Manual Installation

Because hardware configurations vary, it is highly recommended to manually copy only the configurations you need into your `$HOME/.config/` directory.
### Prerequisite
Ensure you have a fresh installation of Arch Linux with a display server (Xorg) installed.

### 1. Clone the Repository
```bash
git clone [https://github.com/your-username/your-repo-name.git](https://github.com/your-username/your-repo-name.git)
cd your-repo-name
