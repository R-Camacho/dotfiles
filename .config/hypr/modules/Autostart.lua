
hl.on("hyprland.start", function ()
    hl.exec_cmd("kitty")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")

    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    hl.exec_cmd("mako")
    hl.exec_cmd("nm-applet")

    -- clipboard manager
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
