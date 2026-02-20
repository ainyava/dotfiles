#!/bin/bash

CONF_FILE="$HOME/.config/hypr/monitors.conf"
monitors=($(hyprctl monitors all -j | jq -r '.[] | .name'))

if [ ${#monitors[@]} -eq 0 ]; then
    echo "No monitors detected."
    exit 1
fi

echo "Select the PRIMARY monitor:"
select PRIMARY in "${monitors[@]}"; do
    if [ -n "$PRIMARY" ]; then break; else echo "Invalid selection."; fi
done

# Clear the old config
echo "# Monitors and workspaces" > "$CONF_FILE"

# 1. Primary Monitor & Workspaces
primary_width=$(hyprctl monitors all -j | jq -r ".[] | select(.name==\"$PRIMARY\") | .width")

echo "monitor = $PRIMARY, preferred, 0x0, auto" >> "$CONF_FILE"
for i in {1..9}; do
    echo "workspace = $i, monitor:$PRIMARY, persistent:true" >> "$CONF_FILE"
done

# 2. Secondary and Mirrors
SECONDARY=""
for m in "${monitors[@]}"; do
    if [ "$m" != "$PRIMARY" ]; then
        SECONDARY=$m
        break
    fi
done

if [ -n "$SECONDARY" ]; then
    echo "monitor = $SECONDARY, preferred, ${primary_width}x0, 1" >> "$CONF_FILE"
    echo "workspace = 10, monitor:$SECONDARY, persistent:true" >> "$CONF_FILE"

    for m in "${monitors[@]}"; do
        if [ "$m" != "$PRIMARY" ] && [ "$m" != "$SECONDARY" ]; then
            echo "monitor = $m, preferred, auto, 1, mirror, $SECONDARY" >> "$CONF_FILE"
        fi
    done
fi

# 3. Reload Hyprland to apply changes immediately
hyprctl reload
echo "Config saved to $CONF_FILE and reloaded!"
