-- Extra autostart processes.

-- Dropdown terminal on the scratchpad special workspace (SUPER+GRAVE).
o.launch_on_start("kitty --title kitty-dropdown")

-- Input method framework.
o.launch_on_start("fcitx5 --disable notificationitem")
