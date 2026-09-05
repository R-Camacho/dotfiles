hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        enable_swallow = true,
        swallow_regex = "^(Alacritty|kitty)$",
    },
})

-- ENV variables
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE","24")

hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("OZONE_PLATFORM","wayland")
hl.env("MOZ_ENABLE_WAYLAND","wayland")
hl.env("QT_QPA_PLATFORM","wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT","auto")
