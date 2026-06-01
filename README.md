# 🏔️ Arch Linux + i3wm Rice: Custom Desktop Environment

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Arch Linux](https://img.shields.io/badge/OS-Arch%20Linux-blue?logo=arch-linux)](https://archlinux.org/)
[![Window Manager](https://img.shields.io/badge/WM-i3wm-lightgrey?logo=i3)](https://i3wm.org/)

## 📖 Project Overview
This repository contains my final school project: a fully customized, optimized, and visually cohesive desktop environment built from scratch on **Arch Linux** using the **i3 window manager (i3wm)**. 

The goal of this project was to move away from bloated, pre-configured desktop environments (like GNOME or KDE) to build a minimal, keyboard-driven workflow that maximizes system resource efficiency and developer productivity.

### 🎯 Key Objectives
* **Minimalism & Efficiency:** Idle RAM usage kept under 400MB.
* **Keyboard-Driven Workflow:** Tiling window management to eliminate mouse dependency.
* **Aesthetic Cohesion:** A strict, dark-mode color palette applied across all system applications.
* **Automation:** Dotfiles organized and easily deployable via a setup script.

---

## 📸 Screenshots
*(Pro-tip: Take a screenshot of your clean desktop and another with several windows open, save them in a `screenshots/` folder, and link them here!)*

| Clean Desktop | Working Desktop |
| :---: | :---: |
| ![Clean Setup](screenshots/clean.png) | ![Busy Setup](screenshots/dirty.png) |

---

## 🛠️ Tech Stack & Components

| Component | Software Used | Description |
| :--- | :--- | :--- |
| **OS** | Arch Linux | Lightweight, bleeding-edge Linux distribution. |
| **WM** | i3-gaps / i3wm | Tiling window manager (with gaps for aesthetics). |
| **Bar** | Polybar / i3status | Highly customizable status bar showing system metrics. |
| **Terminal** | Alacritty / Kitty | GPU-accelerated terminal emulator. |
| **Shell** | Zsh + Oh My Zsh | Enhanced shell with syntax highlighting and autocompletions. |
| **Application Launcher** | Rofi / dmenu | Keyboard-driven application menu and runner. |
| **Notifications** | Dunst | Lightweight notification daemon. |
| **Compositor** | Picom | Handles window transparency, shadows, and fading animations. |

---

## ⌨️ Keybindings Quick Reference
The system relies heavily on the **Mod key** (configured to the `Super`/`Windows` key).

* `Mod + Enter` ➡️ Open Terminal
* `Mod + d` ➡️ Open Rofi (App Launcher)
* `Mod + Shift + q` ➡️ Close Focused Window
* `Mod + Arrow Keys` (or `hjkl`) ➡️ Navigate between windows
* `Mod + Shift + e` ➡️ Exit i3 / Log out

---

## 🚀 Installation & Deployment

> [!WARNING]
> These dotfiles are tailored specifically for my hardware configuration. Backup your existing configurations before running any install scripts.

### Prerequisite
Ensure you have a fresh installation of Arch Linux with a display server (Xorg) installed.

### 1. Clone the Repository
```bash
git clone [https://github.com/your-username/your-repo-name.git](https://github.com/your-username/your-repo-name.git)
cd your-repo-name
