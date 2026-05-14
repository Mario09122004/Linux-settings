#!/bin/bash
LOW_LEVEL=20
NOTIFIED=0

while true; do
    BAT_PATH="/sys/class/power_supply/BAT0"
    LEVEL=$(cat $BAT_PATH/capacity)
    STATUS=$(cat $BAT_PATH/status)

    if [ "$LEVEL" -le "$LOW_LEVEL" ] && [ "$STATUS" != "Charging" ] && [ "$NOTIFIED" -eq 0 ]; then
        notify-send -u critical -i -t 1000 "battery-low" "Low battery: $LEVEL%" "Load me!"
        NOTIFIED=1
    fi

    if [ "$STATUS" == "Charging" ] || [ "$LEVEL" -gt "$LOW_LEVEL" ]; then
        NOTIFIED=0
    fi

    sleep 60
done
