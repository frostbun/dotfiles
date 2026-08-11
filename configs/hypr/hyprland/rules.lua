-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    match = {
        class = "dev.noctalia.Noctalia",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "org.pulseaudio.pavucontrol",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "blueman-manager",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "nm-connection-editor",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "org.fcitx.fcitx5-config-qt",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "org.gnome.*",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "xdg-desktop-portal-gtk",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "steam",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "net.lutris.Lutris",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "Aseprite",
    },
    fullscreen = true,
})
