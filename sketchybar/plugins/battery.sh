#!/usr/bin/env zsh

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
    exit 0
fi

case ${PERCENTAGE} in
    [8-9][0-9] | 100) # 100%-80%
        ICON=󰁹
        ;;
    [6-7][0-9]) # 70%-60%
        ICON=󰂀
        ;;
    [4-5][0-9]) # 50%-40%
        ICON=󰁾
        ;;
    [1-3][0-9]) # 30%-10%
        ICON=󰁻
        ;;
    [0-9])
        ICON=󰂃
        ;;
esac

if [[ $CHARGING != "" ]]; then
    ICON=󰂄
    ICON_COLOR=$BLACK
fi

sketchybar --set $NAME \
    icon=$ICON \
    icon.padding_right=10 \
    icon.y_offset=1  \
    label="${PERCENTAGE}%" \
    icon.color=0xff24273a

