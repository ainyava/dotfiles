-- Keybinding overrides migrated from the legacy yavaos Hyprland config
-- (~/.local/share/yavaos/config/hypr/bindings*). Everything else in the legacy
-- config (workspaces, tiling, groups, media keys, notifications, webapps,
-- captures, control panels) is already an Omarchy default binding.

-- Applications ---------------------------------------------------------------

-- SUPER+E: file manager (legacy binding; Omarchy only binds SUPER+SHIFT+F)
o.bind("SUPER + E", "File manager", { omarchy = "nautilus" })

-- SUPER+Q: close window (legacy binding; Omarchy uses SUPER+W)
o.bind("SUPER + Q", "Close window", hl.dsp.window.close())

-- SUPER+SHIFT+W: Typora (was Omawrite)
hl.unbind("SUPER + SHIFT + W")
o.bind("SUPER + SHIFT + W", "Typora", "uwsm-app -- typora --enable-wayland-ime")

-- Clipboard ------------------------------------------------------------------

-- SUPER+V: clipboard manager (was Universal paste; Omarchy default is SUPER+CTRL+V)
hl.unbind("SUPER + V")
o.bind("SUPER + V", "Clipboard manager", "omarchy-shell shell toggle omarchy.clipboard")

-- Scratchpad on grave keys (legacy binding; Omarchy uses SUPER+S / SUPER+ALT+S)
o.bind("SUPER + GRAVE", "Toggle scratchpad", hl.dsp.workspace.toggle_special("scratchpad"))
o.bind("SUPER + ALT + GRAVE", "Move window to scratchpad", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

-- SUPER+S: toggle grouping (legacy binding; Omarchy default is scratchpad)
hl.unbind("SUPER + S")
o.bind("SUPER + S", "Toggle window grouping", hl.dsp.group.toggle())

-- Menus ----------------------------------------------------------------------

-- SUPER+SLASH: app launcher (was Monitor scaling up; Omarchy default apps menu
-- is SUPER+ALT+SPACE)
hl.unbind("SUPER + SLASH")
o.bind("SUPER + SLASH", "Launch apps", "omarchy-menu toggle apps")

-- Lock -----------------------------------------------------------------------

-- SUPER+L: lock system (was Toggle workspace layout; Omarchy default is SUPER+CTRL+L)
hl.unbind("SUPER + L")
o.bind("SUPER + L", "Lock system", "omarchy-system-lock")

-- Hardware -------------------------------------------------------------------

-- CTRL+grave: toggle mic mute
o.bind("CTRL + GRAVE", "Toggle mic mute", "omarchy-audio-input-mute")

-- XF86PowerOff: system menu
o.bind("XF86PowerOff", "Power menu", "omarchy-menu toggle system", { locked = true })

-- Apple Display brightness
o.bind("CTRL + F1", "Apple Display brightness down", "omarchy-brightness-display-apple -5000")
o.bind("CTRL + F2", "Apple Display brightness up", "omarchy-brightness-display-apple +5000")
o.bind("SHIFT + CTRL + F2", "Apple Display full brightness", "omarchy-brightness-display-apple +60000")

-- Skipped from the legacy config (no Omarchy equivalent / not installed):
--   * SUPER+CTRL+X dictation (voxtype) - voxtype is not installed
--   * SUPER+BACKSLASH monitor scaling cycle - omarchy-hyprland-monitor-scaling
--     only supports up/down/SCALE, not cycle
--   * SUPER+P monitor tool (yavaos-hyprmon) - SUPER+P is Pseudo window
