hl.config({
    binds = {
        drag_threshold = 10,
        scroll_event_delay = 0
    }
})


hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})


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
hl.bind("SUPER + T", hl.dsp.exec_cmd("google-chrome-stable"))


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
hl.bind("SUPER + X", hl.dsp.exec_cmd("wl-paste | swappy -f -"))
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


hl.bind("SUPER + Left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + Down", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + Up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + Right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + SHIFT + Left", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + Down", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + SHIFT + Up", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + Right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

hl.bind("SUPER + SHIFT + CTRL + Left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + CTRL + Down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + CTRL + Up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + CTRL + Right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + CTRL + H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + CTRL + J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + CTRL + K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + CTRL + L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })


for i = 1, 9 do
    hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
end

hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind("SUPER + Minus", hl.dsp.focus({ workspace = "empty" }))
hl.bind("SUPER + Q", hl.dsp.workspace.toggle_special(""))
hl.bind("SUPER + Tab", hl.dsp.focus({ workspace = "m+1" }))
hl.bind("SUPER + Grave", hl.dsp.focus({ workspace = "m-1" }))

for i = 1, 9 do
    hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))
hl.bind("SUPER + SHIFT + Minus", hl.dsp.window.move({ workspace = "empty" }))
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.move({ workspace = "special" }))
hl.bind("SUPER + SHIFT + Tab", hl.dsp.window.move({ workspace = "m+1" }))
hl.bind("SUPER + SHIFT + Grave", hl.dsp.window.move({ workspace = "m-1" }))

for i = 1, 9 do
    hl.bind("SUPER + SHIFT + CTRL + " .. i, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind("SUPER + SHIFT + CTRL + 0", hl.dsp.window.move({ workspace = 10, follow = false }))
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
hl.bind("SUPER + mouse:272", hl.dsp.window.float({ action = "toggle" }), { mouse = true, click = true })

if layout == "dwindle" then
    hl.bind("SUPER + mouse:273", hl.dsp.layout("togglesplit"), { mouse = true, click = true })
elseif layout =="master" then
    hl.bind("SUPER + mouse:273", hl.dsp.layout("swapwithmaster"), { mouse = true, click = true })
end


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
