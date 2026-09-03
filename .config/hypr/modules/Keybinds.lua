local mainMod = "SUPER"

local terminal = "kitty"
local fileManager = "thunar"
--local menu = "wofi --show drun"
local menu = "rofi -show drun -theme ~/.config/rofi/launchpad.rasi"
local primary_browser = "brave"
local secondary_browser = "firefox"

-- TODO: add more and order alphabetically

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(primary_browser))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("bash $HOME/.config/Scripts/rofi_clipboard.sh"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("bash $HOME/.config/Scripts/dashboard_toggle.sh"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(terminal .. " --app-id btop btop"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("bash $HOME/.config/Scripts/rofi_powermenu.sh"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { repeating = true })
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(secondary_browser))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))

hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("bash $HOME/.config/Scripts/select_wallpaper.sh"))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(terminal .. " --app-id yazi yazi"))

hl.bind("F11", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + H",    hl.dsp.focus({ direction = "l" }))

hl.bind(mainMod .. " + right",hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + L",    hl.dsp.focus({ direction = "r" }))

hl.bind(mainMod .. " + up",   hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + K",    hl.dsp.focus({ direction = "u" }))

hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + J",    hl.dsp.focus({ direction = "d" }))


for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
  hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272",  hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",  hl.dsp.window.resize(), { mouse = true })

hl.bind("ALT + Space",          hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + Space",  hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind("ALT + TAB",    hl.dsp.window.cycle_next(), { repeating = true })

hl.bind("XF86AudioRaiseVolume",    hl.dsp.exec_cmd("wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"),        { locked = true, repeating = true })
hl.bind("XF86AudioMute",           hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),        { locked = true, repeating = false })
hl.bind("XF86AudioMicMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),      { locked = true, repeating = false })
hl.bind("XF86MonBrightnessUp",     hl.dsp.exec_cmd("brightnessctl set -e4 set 5%+"),                            { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",   hl.dsp.exec_cmd("brightnessctl -n2 set 5%-"),                            { locked = true, repeating = true })

-- Asus laptop specific
hl.bind("XF86KbdBrightnessDown",   hl.dsp.exec_cmd("asusctl leds prev"))
hl.bind("XF86KbdBrightnessUp",     hl.dsp.exec_cmd("asusctl leds next"))
hl.bind("XF86Launch1",             hl.dsp.exec_cmd("rog-control-center"))
-- TODO: see "AURA" key, set to "asusctl aura effect --next-mode"

hl.bind("XF86AudioNext",           hl.dsp.exec_cmd("playerctl next"),          { locked = true })
hl.bind("XF86AudioPause",          hl.dsp.exec_cmd("playerctl play-pause"),    { locked = true })
hl.bind("XF86AudioPlay",           hl.dsp.exec_cmd("playerctl play-pause"),    { locked = true })
hl.bind("XF86AudioPrev",           hl.dsp.exec_cmd("playerctl previous"),      { locked = true })

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock -q"))

-- Print screen
-- On my Asus laptop, pressing fn + f6 (print screen) is the same as pressing s + shift + super
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot of region taken" -t 1500'))
hl.bind("Print",                   hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot of region taken" -t 1500'))

