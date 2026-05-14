#!/bin/bash

wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

is_muted=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -c "MUTED")

if [ "$is_muted" -eq 1 ]; then
    notify-send -h string:x-canonical-private-synchronous:mic \
                -t 1500 -u low -i microphone-sensitivity-muted-symbolic "Micrófono: SILENCIADO"
else
    notify-send -h string:x-canonical-private-synchronous:mic \
                -t 1500 -u low -i microphone-sensitivity-high-symbolic "Micrófono: ACTIVADO"
fi
