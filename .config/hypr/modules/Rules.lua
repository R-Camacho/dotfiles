
hl.window_rule({
    name   = "float-file-pickers",
    match  = { title = "^(Open File|Open Folder|Open|Save|Save As|Export|Import|Choose File|Rename)$" },
    match  = { class = "xdg-desktop-portal-gtk" },
    float  = true,
    center = true,
    decorate = false
})

hl.window_rule({
    name = "float-windows",
    -- TODO: check this again and add more if needed
    match = {
        class = "pwvucontrol|bluetui|nmgui|nmtui|thunar|org.gnome.Nautilus",
    },
    float = true,
    no_initial_focus = false,
    move = {960,510},
    opacity = "1.0",
    pin = true,
    decorate = false,
    size = {"(monitor_w*0.48)","(monitor_h*0.50)"},
})

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

