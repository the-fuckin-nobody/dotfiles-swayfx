# dotfiles-swayfx

**Dotfiles for my sway workflow**
# Showcase
![image](https://github.com/the-fuckin-nobody/dotfiles-swayfx/assets/97352165/9a08993a-7197-495b-9f65-d3e3dae19dc9)
![image](https://github.com/the-fuckin-nobody/dotfiles-swayfx/assets/97352165/3643461d-5a1c-4a4a-b242-31fedcb1cf6b)
![image](https://github.com/the-fuckin-nobody/dotfiles-swayfx/assets/97352165/4323cda9-507a-4b4f-bb93-0d001fd3e775)
![image](https://github.com/the-fuckin-nobody/dotfiles-swayfx/assets/97352165/e9f716d1-8353-41b0-9bff-a04155a23ed2)
![image](https://github.com/the-fuckin-nobody/dotfiles-swayfx/assets/97352165/cbcee880-4439-47b6-9aa4-104fa27d4d4a)



## How to install ?

There's a few steps involved in the installation process: 

1. Clone the repo:
    ```
    git clone https://github.com/the-fuckin-nobody/dotfiles-swayfx ~/
    ```

1. Install the following packages from the arch repo: (Assuming, you are using Arch Linux)
    - [**foot**](https://codeberg.org/dnkl/foot) (An awesome terminal emulator by [*dnkl*](https://codeberg.org/dnkl) that supports rendering images using sixel)
    - [**waybar**](https://github.com/Alexays/Waybar) (A heavily customizable status bar for wayland)
    - [**fish**](https://fishshell.com) (A smart and user-friendly command line shell for Linux, macOS, and the rest of the family.)
    - [**starship**](https://starship.rs) (The minimal, blazing-fast, and infinitely customizable prompt for any shell! )
    - [**neovim**](https://nvim.io) (Hyperextensible Vim-based text editor configurable through lua.)
    - [**dunst**](https://dunst-project.org) (A highly customizable yet lighweight notification daemon.)
    - **kvantum** (Useful for styling qt applications.)
    - **qt5ct** (Applying themes for qt5 applications.)
    - **qt6ct** (Applying themes for qt6 applications.)
    - [**swayimg**](https://github.com/artemsen/swayimg) (A lightweight image viewer for wayland.)
    - [**jq**](https://github.com/jqlang/jq) (A Command-line JSON processor)
    - **slurp** (Select a region in a Wayland Compositor)
    - **pacman-contrib** (Contributed scripts and tools for pacman systems.)
    - **ttf-iosevkaterm-nerd**
    - **ttf-fantasque-nerd**

    Alternatively you can use the following command to install all of the above packages:
    ```
    sudo pacman -Syyu foot waybar fish starship neovim dusnt kvantum qt5ct qt6ct swayimg slurp pacman-contrib jq ttf-iosevkaterm-nerd ttf-fantasque-nerd
    ```

1. Install the following packages from the [**AUR**](https://aur.archlinux.org), manually or from your favourite AUR helper like [**paru**](https:/github.com/https://github.com/Morganamilo/paru):
    - [**swayfx-git**](https://github.com/WillPower3309/swayfx) (Sway, but with eye candy!)
    - [**hyprpicker-git**](https://github.com/hyprwm/hyprpicker) (A color picker utility for Hyprland and other wlroots based compositors.)
    - [**rofi-lbonn-wayland-git**](https://github.com/lbonn/rofi) (A Rofi fork with native wayland support.)
    - [**swaylock-effects-imporved-git**](https://github.com/Xenfo/swaylock-effects-improved) (A fancier screen locker for Wayland.)
    - [**wayshot**](https://github.com/waycrate/wayshot) (A Screenshot utility for wl-roots based compositors written in Rust.)
    - [**sddm-git**](https://github.com/sddm/sddm) (A QML based display manager for X11 and Wayland.)
    - [**ttf-apple-emoji**] (Apple Color Emoji's)

    If you are using `paru`, you can run the following command in your terminal to install all of the above packages:
    ```
    paru -Syyu swayfx-git swaylock-effects-improved-git rofi-lbonn-wayland-git hyprpicker-git wayshot sddm-git ttf-apple-emoji
    ```

1. Now copy all the files in the `config` folder to the `~/.config/`folder: 
    ```
    cd ~/dotfiles-swayfx/
    cp -r * ~/.config/
    ```
    > Note: Be sure to create a backup of the following folders in your config file before running the above command:
    ```
    nvim
    foot
    dunst
    rofi
    Kvantum
    sway
    swaylock
    zathura
    ```

1. Copy all the files in the `bin` folder to the `~/.local/bin/` folder:
    ```
    mkdir -p ~/.local/bin/
    cd ~/dotfiles-swayfx/
    cp -r bin/* ~/.local/bin 
    ```

1. Copy all the files in the `share` folder to the `~/.local/share/` folder:
    ```
    mkdir -p ~/.local/share/themes/
    mkdir -p ~/.local/share/icons/
    mkdir -p ~/.local/share/wallpapers/
    cd ~/dotfiles-swayfx/
    cp -r share/icons/* ~/.local/share/icons/
    cp -r share/themes/* ~/.local/share/themes/
    cp -r share/wallpapers/* ~/.local/share/wallpapers
    ```
1. Install the sddm theme:
    ```
    cd ~/dotfiles-swayfx/
    sudo cp -r sddm/kanagawa /usr/share/sddm/themes/
    sudo cp sddm/sddm.conf /etc/
    ```

1. Copy the `environment` file to the `/etc` folder:
    ```
    cd ~/dotfiles-swayfx
    sudo cp environment /etc/environment
    ```
## Note:
I have just included a single wallpaper here, to keep the size of the repo as minimal as possible. So if you need more wallpapers, check out [this](https://github.com/the-fuckin-nobody/wallpapers) repository

**The setup must now be completed! Just give your system a reboot :-)**

**I cannot gaurantee if it'll work perfectly for you. So feel free to raise issue if you encounter one, I'll be more than happy to help!**
