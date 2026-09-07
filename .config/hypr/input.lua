-- Personal input overrides (loaded after Omarchy's defaults).

hl.config({
  input = {
    -- US + Persian layouts, toggled with Caps Lock (overrides Omarchy's
    -- Caps-as-compose-key default).
    kb_layout = "us,ir",
    kb_options = "grp:caps_toggle",

    -- No mouse acceleration.
    accel_profile = "flat",
  },
})

-- Touchpad gestures.
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "up", action = function() hl.dispatch(hl.dsp.window.fullscreen({ mode = "fullscreen" })) end })
hl.gesture({ fingers = 3, direction = "down", mod = "SUPER", action = function() hl.dispatch(hl.dsp.window.close()) end })
