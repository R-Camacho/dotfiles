
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
        class = "pwvucontrol|bluetui|nmgui|nmtui|thunar|org.gnome.Nautilus|imv|feh|mpv|vlc|nm-connection-editor",
    },
    float = true,
    no_initial_focus = false,
    center = true,
    opacity = "1.0",
    pin = false,
    decorate = true,
    --size = {"(monitor_w*0.48)","(monitor_h*0.50)"},
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

hl.layer_rule({
  name  = "Essential blur",
  match = { namespace = "logout_dialog|rofi|quickshell" },
  blur = true,
  ignore_alpha = 0,
})

hl.layer_rule({
  name      = "no-anim-for-selection",
  match     = { namespace = "selection" },
  no_anim   = true,
})

