hl.config({
    binds = {
        drag_threshold = 10,
        scroll_event_delay = 0
    }
})


hl.gesture({ fingers = 3, direction = "left", action = function() hl.dsp.focus({ direction = "left" }) end })
hl.gesture({ fingers = 3, direction = "down", action = function() hl.dsp.focus({ direction = "down" }) end })
hl.gesture({ fingers = 3, direction = "up", action = function() hl.dsp.focus({ direction = "up" }) end })
hl.gesture({ fingers = 3, direction = "right", action = function() hl.dsp.focus({ direction = "right" }) end })

hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })


hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd("xdg-terminal-exec btop", { float = true }))


hl.bind("SUPER + Return", hl.dsp.exec_cmd("noctalia msg panel-open launcher"))
hl.bind("SUPER + Escape", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Escape", hl.dsp.window.kill())
hl.bind("F11", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))


hl.bind("SUPER + W", hl.dsp.exec_cmd("noctalia msg window-switcher"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("xdg-terminal-exec yazi", { float = true }))
hl.bind("SUPER + R", hl.dsp.exec_cmd("xdg-terminal-exec"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("google-chrome-stable --profile-directory='Default'"))


hl.bind("SUPER + A", hl.dsp.exec_cmd("pidof hyprpicker || hyprpicker --render-inactive --autocopy"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("pidof hyprpicker || hyprshot --mode=active --mode=window --output-folder=$HOME/Pictures/Screenshots"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("noctalia msg screenshot-region"))
hl.bind("Print", hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("noctalia msg panel-open launcher /win"))
hl.bind("SUPER + F", hl.dsp.window.float({ action = "toggle" }))

if layout == "dwindle" then
    hl.bind("SUPER + G", hl.dsp.layout("togglesplit"))
elseif layout =="master" then
    hl.bind("SUPER + G", hl.dsp.layout("swapwithmaster"))
end


hl.bind("SUPER + Z", hl.dsp.exec_cmd("noctalia msg settings-open"))
hl.bind("SUPER + SHIFT + Z", hl.dsp.exec_cmd("code ~/dotfiles"))
hl.bind("SUPER + SHIFT + CTRL + Z", hl.dsp.exec_cmd("code ~/.local/state/noctalia"))
hl.bind("SUPER + X", hl.dsp.exec_cmd("noctalia msg annotate"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("noctalia msg panel-open clipboard"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("noctalia msg panel-open launcher /emo"))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("noctalia msg panel-open launcher /kao"))


hl.bind("ALT + Tab", hl.dsp.window.cycle_next({ next = true }))
hl.bind("ALT + Tab", hl.dsp.window.alter_zorder({ mode = "top" }))

if layout == "master" then
    hl.bind("ALT + Tab", hl.dsp.layout("swapwithmaster"))
end

hl.bind("ALT + SHIFT + Tab", hl.dsp.window.cycle_next({ next = false }))
hl.bind("ALT + SHIFT + Tab", hl.dsp.window.alter_zorder({ mode = "top" }))

if layout == "master" then
    hl.bind("ALT + SHIFT + Tab", hl.dsp.layout("swapwithmaster"))
end


for _, d in ipairs({
    { "Left", "H", "left", -10, 0 },
    { "Down", "J", "down", 0, 10 },
    { "Up", "K", "up", 0, -10 },
    { "Right", "L", "right", 10, 0 },
}) do
    local arrow, letter, direction, x, y = d[1], d[2], d[3], d[4], d[5]
    local focus = hl.dsp.focus({ direction = direction })
    local move = hl.dsp.window.move({ direction = direction })
    local resize = hl.dsp.window.resize({ x = x, y = y, relative = true })

    hl.bind("SUPER + " .. arrow, focus)
    hl.bind("SUPER + " .. letter, focus)
    hl.bind("SUPER + SHIFT + " .. arrow, move)
    hl.bind("SUPER + SHIFT + " .. letter, move)
    hl.bind("SUPER + SHIFT + CTRL + " .. arrow, resize, { repeating = true })
    hl.bind("SUPER + SHIFT + CTRL + " .. letter, resize, { repeating = true })
end


for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    hl.bind("SUPER + SHIFT + CTRL + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind("SUPER + Minus", hl.dsp.focus({ workspace = "empty" }))
hl.bind("SUPER + Q", hl.dsp.workspace.toggle_special(""))
hl.bind("SUPER + Tab", hl.dsp.focus({ workspace = "m+1" }))
hl.bind("SUPER + Grave", hl.dsp.focus({ workspace = "m-1" }))

hl.bind("SUPER + SHIFT + Minus", hl.dsp.window.move({ workspace = "empty" }))
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.move({ workspace = "special" }))
hl.bind("SUPER + SHIFT + Tab", hl.dsp.window.move({ workspace = "m+1" }))
hl.bind("SUPER + SHIFT + Grave", hl.dsp.window.move({ workspace = "m-1" }))

hl.bind("SUPER + SHIFT + CTRL + Minus", hl.dsp.window.move({ workspace = "empty", follow = false }))
hl.bind("SUPER + SHIFT + CTRL + Q", hl.dsp.window.move({ workspace = "special", follow = false }))
hl.bind("SUPER + SHIFT + CTRL + Tab", hl.dsp.window.move({ workspace = "m+1", follow = false }))
hl.bind("SUPER + SHIFT + CTRL + Grave", hl.dsp.window.move({ workspace = "m-1", follow = false }))


hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "m-1" }))
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "m+1" }))

hl.bind("SUPER + SHIFT + mouse_up", hl.dsp.window.move({ workspace = "m-1" }))
hl.bind("SUPER + SHIFT + mouse_down", hl.dsp.window.move({ workspace = "m+1" }))

hl.bind("SUPER + SHIFT + CTRL + mouse_up", hl.dsp.window.move({ workspace = "m-1", follow = false }))
hl.bind("SUPER + SHIFT + CTRL + mouse_down", hl.dsp.window.move({ workspace = "m+1", follow = false }))


hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })


hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), { locked = true })


hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })


hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -n1 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -n1 set 5%+"), { locked = true, repeating = true })
