-- App-specific window/layer rules migrated from the legacy yavaos configs.
-- Rules already covered by Omarchy defaults (bitwarden, browser, geforce,
-- localsend, pip, qemu, retroarch, steam, system, webcam-overlay, screenshot
-- selection) are not repeated here.

-- Terminals: legacy opacity (defaults only tag +terminal).
o.window({ tag = "terminal" }, { opacity = "0.97 0.9" })

-- VS Code: same styling as terminals.
o.window("code", { opacity = "0.97 0.9" })

-- Telegram: float the main window and don't steal focus on new messages.
o.window("org.telegram.desktop", { float = true, size = { 1024, 768 }, focus_on_activate = false })

-- Kitty dropdown terminal on Omarchy's scratchpad special workspace
-- (toggled with SUPER+GRAVE / SUPER+S).
o.window({ title = "^(kitty-dropdown)$" }, {
  float = true,
  size = { "(monitor_w*1)", "(monitor_h*0.8)" },
  move = { "(0)", "(50)" },
  workspace = "special:scratchpad",
})

-- Rofi: always float.
o.window("Rofi", { float = true })

-- JetBrains extras (defaults only set no_follow_mouse).
-- Fix splash screen placement and prevent focus takeovers.
o.window({ class = "^(jetbrains-.*)$", title = "^(splash)$", float = true }, {
  tag = "+jetbrains-splash",
  center = true,
  no_focus = true,
  border_size = 0,
})

-- Center popups/find windows (stay_focused makes popups accept input).
o.window({ class = "^(jetbrains-.*)$", title = "^(| )$", float = true }, {
  center = true,
  stay_focused = true,
  border_size = 0,
  min_size = { "(monitor_w*0.5)", "(monitor_h*0.5)" },
})

-- Disable window flicker when autocomplete or tooltips appear.
o.window({ class = "^(jetbrains-.*)$", title = "^(win.*)$", float = true }, {
  no_initial_focus = true,
})

-- Launcher layers: no compositor animation.
hl.layer_rule({ match = { namespace = "walker" }, no_anim = true })

-- Blur the waybar layer (if waybar is used alongside the Omarchy shell).
hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
