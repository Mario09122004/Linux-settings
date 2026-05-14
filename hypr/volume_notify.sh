#!/bin/bash
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')

case $1 in
    up)
        wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+
        ;;
    down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        ;;
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
esac

new_volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}' | cut -d. -f1)
is_muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -c "MUTED")

if [ "$is_muted" -eq 1 ]; then
    notify-send -h string:x-canonical-private-synchronous:volume \
                -u low -i audio-volume-muted "Silenciado"
else
    notify-send -h string:x-canonical-private-synchronous:volume \
                -h int:value:"$new_volume" \
                -u low -i audio-volume-high "Volumen: ${new_volume}%"
fi
