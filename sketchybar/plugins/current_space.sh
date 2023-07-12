#!/usr/bin/env zsh

source "$HOME/.config/sketchybar/icons.sh"

update_space() {
    SPACE_ID=$(echo "$INFO" | jq -r '."display-1"')

    case $SPACE_ID in
    1)
        ICON="$TERMINAL_ICON terminal"
        ICON_PADDING_LEFT=10
        ICON_PADDING_RIGHT=10
        ;;
    2)
        ICON="$CHROME_ICON  web"
        ICON_PADDING_LEFT=10
        ICON_PADDING_RIGHT=10
        ;;
    3)
        ICON="$MOBILE_ICON  sims"
        ICON_PADDING_LEFT=10
        ICON_PADDING_RIGHT=10
        ;;
    4)
        ICON="$KRITA_ICON  art"
        ICON_PADDING_LEFT=10
        ICON_PADDING_RIGHT=10
        ;;
    5)
        ICON="$SPOTIFY_ICON  music"
        ICON_PADDING_LEFT=10
        ICON_PADDING_RIGHT=10
        ;;
    *)
        ICON=$SPACE_ID
        ICON_PADDING_LEFT=10
        ICON_PADDING_RIGHT=10
        ;;
    esac

    sketchybar --set $NAME \
        icon=$ICON \
        icon.padding_left=$ICON_PADDING_LEFT \
        icon.padding_right=$ICON_PADDING_RIGHT
}

case "$SENDER" in
"mouse.clicked")
    # Reload sketchybar
    sketchybar --remove '/.*/'
    source $HOME/.config/sketchybar/sketchybarrc
    ;;
*)
    update_space
    ;;
esac
