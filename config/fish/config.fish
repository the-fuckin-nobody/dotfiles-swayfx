if status is-interactive
    source /home/dex/.python-venv/DAV-Project/bin/activate.fish
    source (/usr/bin/starship init fish --print-full-init | psub)
    set fish_greeting ""
    set WAYLAND_DISPLAY "wayland-1"
    alias ls "exa -lh --icons --git --group-directories-first"
    # Commands to run in interactive sessions can go here
end
