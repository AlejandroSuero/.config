#!/usr/bin/env zsh

# Max number of characters so it fits nicely to the right of the notch
# MAY NOT WORK WITH NON-ENGLISH CHARACTERS

source "$HOME/.config/sketchybar/colors.sh"

MAX_LENGTH=35

# Logic starts here, do not modify
HALF_LENGTH=$(((MAX_LENGTH + 1) / 2))

# Spotify JSON / $INFO comes in malformed, line below sanitizes it
SPOTIFY_JSON="$INFO"

update_track() {

    if [[ -z $SPOTIFY_JSON ]]; then
        sketchybar --set $NAME background.color=$GREY label.drawing=no \
            icon.padding_left=50 \
            icon.padding_right=50
        return
    fi

    PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '.["Player State"]')

    if [ $PLAYER_STATE = "Playing" ]; then
        TRACK="$(echo "$SPOTIFY_JSON" | jq -r .Name)"
        ARTIST="$(echo "$SPOTIFY_JSON" | jq -r .Artist)"

        # Calculations so it fits nicely
        TRACK_LENGTH=${#TRACK}
        ARTIST_LENGTH=${#ARTIST}

        if [ $((TRACK_LENGTH + ARTIST_LENGTH)) -gt $MAX_LENGTH ]; then
            # If the total length exceeds the max
            if [ $TRACK_LENGTH -gt $HALF_LENGTH ] && [ $ARTIST_LENGTH -gt $HALF_LENGTH ]; then
                # If both the track and artist are too long, cut both at half length - 1

                # If MAX_LENGTH is odd, HALF_LENGTH is calculated with an extra space, so give it an extra char
                TRACK="${TRACK:0:$((MAX_LENGTH % 2 == 0 ? HALF_LENGTH - 2 : HALF_LENGTH - 1))}…"
                ARTIST="${ARTIST:0:$((HALF_LENGTH - 2))}…"

            elif [ $TRACK_LENGTH -gt $HALF_LENGTH ]; then
                # Else if only the track is too long, cut it by the difference of the max length and artist length
                TRACK="${TRACK:0:$((MAX_LENGTH - ARTIST_LENGTH - 1))}…"
            elif [ $ARTIST_LENGTH -gt $HALF_LENGTH ]; then
                ARTIST="${ARTIST:0:$((MAX_LENGTH - TRACK_LENGTH - 1))}…"
            fi
        fi

        sketchybar --set $NAME label="${TRACK}  ${ARTIST}" label.drawing=yes background.color=$BLUE \
            icon.padding_left=20 \
            icon.padding_right=10 \
            label.color=$GREY \
            icon.color=$GREY \
            label.padding_right=20


    elif [ $PLAYER_STATE = "Paused" ]; then

        sketchybar --set $NAME background.color=$GREY \
            icon.padding_left=20 \
            label.color=$BLUE \
            icon.color=$BLUE \
            label.drawing=yes \
            label.padding_right=20 \
            icon.padding_right=10


    elif [ $PLAYER_STATE = "Stopped" ]; then

        sketchybar --set $NAME background.color=$GREY label.drawing=no \
            icon.color=$BLUE \
            label.color=$BLUE \
            label.drawing=off \
            icon.padding_left=50 \
            icon.padding_right=50


    else

        sketchybar --set $NAME background.color=$GREY \
            icon.color=$BLUE \
            label.color=$BLUE \
            label.drawing=off \
            icon.padding_left=50 \
            icon.padding_right=50

        echo $PLAYER_STATE

    fi
}

case "$SENDER" in
"mouse.clicked")
    osascript -e 'tell application "Spotify" to playpause'
    ;;
*)
    update_track
    ;;
esac
