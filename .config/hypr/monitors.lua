-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 1
local omarchy_monitor_scale = 1

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))

-- Monitors
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "0x0", scale = omarchy_monitor_scale })
hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "1920x0", scale = omarchy_monitor_scale })

for i = 1, 9 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "HDMI-A-1",
		persistent = true,
	})
end

hl.workspace_rule({ workspace = "10", monitor = "eDP-1", persistent = true })
