
sketchybar --add item           wifi.control right                      \
                                                                        \
           --set wifi.control   icon=$WIFI_ICON                         \
                                icon.padding_right=10                   \
                                icon.padding_left=5                    \
                                icon.y_offset=1 \
                                label.drawing=off                       \
                                background.drawing=on                   \
                                background.color=$GREEN

sketchybar --add item wifi.separator right \
    --set wifi.separator \
    background.color=$TRANSPARENT \
    icon= \
    icon.color=$GREEN \
    icon.font="$FONT_FACE:Bold:23.0" \
    icon.padding_left=10 \
    icon.padding_right=-1 \
    icon.y_offset=1 \
    label.drawing=off

