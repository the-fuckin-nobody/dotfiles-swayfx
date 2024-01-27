export XCURSOR_SIZE=30
export XCURSOR_THEME=Captaine-Kanagawa-cursors
export GTK_THEME=Kanagawa-B
export SHELL=/bin/fish
#Start the swww daemon and set wallpaper
if [[ $(pidof swww-daemon) ]]; then
    swww kill && swww init --no-cache && swww img /home/$USER/.local/share/wallpapers/wallhaven-k77xrm_1920x1080.png --resize crop --filter Nearest --transition-type wipe --transition-step 90 --transition-duration 1 --transition-angle 45 --transition-pos top-left
else
    swww init --no-cache && swww img /home/$USER/.local/share/wallpapers/wallhaven-k77xrm_1920x1080.png --resize crop --filter Nearest --transition-type wipe --transition-step 90 --transition-duration 1 --transition-angle 45 --transition-pos top-left 
fi

#Start the polkit agent
if [[ $(pidof /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1) ]]; then
	killall /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 && /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
else
	/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
fi

#Start waybar
if [[ $(pidof waybar) ]]; then
	killall waybar && waybar --config ~/.config/sway/waybar/config.json --style ~/.config/sway/waybar/style.css &
else
	waybar --config ~/.config/sway/waybar/config.json --style ~/.config/sway/waybar/style.css &
fi

#Start the clipboard manager
#if [[ $(pidof clipmon) -eq "" ]]; then
#   /usr/lib/polkit-gnome/clipmon &
#   else
#    killall /usr/lib/polkit-gnome/clipmon && /usr/lib/polkit-gnome/clipmon &
#fi

#Start swaync notification daemon
if [[ $(pidof dunst) ]]; then
	killall dunst && dunst &
else
	dunst&
fi
