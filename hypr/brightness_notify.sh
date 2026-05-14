#!/bin/bash

case $1 in
    up)
        brightnessctl set 5%+
        ;;
    down)
        brightnessctl set 5%-
        ;;
esac

current_brightness=$(brightnessctl -m | awk -F, '{print substr($4, 0, length($4)-1)}')

notify-send -h string:x-canonical-private-synchronous:brightness \
            -h int:value:"$current_brightness" \
            -u low -i display-brightness-symbolic "Brillo: ${current_brightness}%"
