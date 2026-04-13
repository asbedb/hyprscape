## HyprScape: An OSRS Inspired Arch Theme

A collection of dotfiles to **Lumby tele** your Hyprland setup. Whether you're woodcutting or rice-ing, this theme brings the 2007 aesthetic to your desktop.

## Current Config Files
* **Window Manager:** `hyprland`
* **Terminal:** `kitty`
* **App Launcher:** `rofi` (Wayland fork)
* **Status Bar:** `waybar`
* **Wallpaper Engine:** `waypaper` (swww backend recommended)
* **Logout Menu:** `wlogout`


## Screenshots
![waypaper](/screenshots/waypaper.png)
![Kitty with Waybar](/screenshots/waybar-terminal.png)
![rofi](/screenshots/rofi.png)
![wlogout](/screenshots/wlogout.png)

## Installation Guide

Before you begin, ensure you are on an Arch-based system and have a basic Hyprland environment functional.

### 1. Install Dependencies
You will need the following packages. You can install them via `pacman` or your preferred AUR helper (like `yay` or `paru`).

```bash
# Core components
sudo pacman -S hyprland kitty rofi-wayland waybar waypaper wlogout swww
```

Copy the font into your `~/.local/share/fonts/` folder to ensure its accessible by the system. 

### 2. Backup Your Existing Configs
Back up your current files first:
```bash
mkdir -p ~/dot_backups
cp -r ~/.config/{hypr,kitty,rofi,waybar,waypaper,wlogout} ~/dot_backups/
```

### 3. Clone and Deploy
Clone this repository and symlink (or copy) the files to your `.config` directory.

```bash
git clone https://github.com/yourusername/HyprScape.git
cd HyprScape

# Copying the configuration files
cp -r config/* ~/.config/
```

### 4. Apply the Wallpaper
1. Launch `waypaper`.
2. Select the OSRS-themed wallpaper from the `screenshots/` or `wallpapers/` folder.
3. Click **Apply**. (Ensure `swww` or `hyprpaper` is selected as the backend).

### 5. Refresh Hyprland
Press `Super + M` (or your configured reload bind) to restart Hyprland and see the changes.


## Credits & Notes
* **Colors:** Inspired by the classic OSRS UI gold, brown, and stone textures.
* **Fonts:** Best paired with "Runescape UF" fonts for the authentic 2007 look.