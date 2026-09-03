hl.config({
    decoration = {
        rounding = 6,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,
        fullscreen_opacity = 1,

        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "0x1a1a1aee",
        },

        --blur = {
        --    enabled = false,
        --    size = 3,
        --    passes = 1,
        --    vibrancy = 0.1696,
        --}

        blur = {
            enabled   = true,
            passes    = 2,
            size      = 6,
            new_optimizations = true,
            xray = false,
            popups = false,
            popups_ignorealpha = 0,
            noise = 0.02,
            contrast = 1.6,
            brightness = 0.9,
            vibrancy  = 0.4,
            vibrancy_darkness = 0.4,
            special = false
        },
    }
})
