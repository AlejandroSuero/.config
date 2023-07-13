sketchybar --add item clock right \
    --set clock \
    icon=󰃰 \
    icon.padding_left=10 \
    label.padding_right=10 \
    label.padding_left=10 \
    icon.y_offset=1 \
    background.color=$RED \
    update_freq=10 \
    script="$PLUGIN_SHARED_DIR/clock.sh"

sketchybar --add item clock.separator right \
    --set clock.separator \
    background.color=$GREEN \
    icon= \
    icon.color=$RED \
    icon.font="$FONT_FACE:Bold:23.0" \
    icon.padding_left=0 \
    icon.padding_right=-1 \
    icon.y_offset=1 \
    label.drawing=off
