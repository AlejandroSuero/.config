source "$HOME/.config/sketchybar/colors.sh"

sketchybar --add item current_space left \
    --set current_space \
    background.color=$BLUE \
    label.drawing=on \
    script="$PLUGIN_SHARED_DIR/current_space.sh" \
    --subscribe current_space space_change mouse.clicked

sketchybar --add item front_app.separator left \
    --set front_app.separator \
    background.color=0x00000000 \
    icon= \
    icon.color=$BLUE \
    icon.font="$FONT_FACE:Bold:23.0" \
    icon.padding_left=0 \
    icon.padding_right=0 \
    icon.y_offset=1 \
    label.drawing=on

