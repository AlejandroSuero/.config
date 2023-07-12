#!/usr/bin/env sh

source "$HOME/.config/sketchybar/icons.sh"

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"

sketchybar --add event spotify_change $SPOTIFY_EVENT \
    --add item spotify center \
    --set spotify \
    icon=󰓇 \
    background.corner_radius=10 \
    icon.y_offset=1 \
    label.drawing=off \
    label.padding_left=5 \
    script="$PLUGIN_DIR/spotify.sh" \
    --subscribe spotify spotify_change mouse.clicked
