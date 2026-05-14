#!/bin/bash

if pgrep -x "rofi" > /dev/null; then
    killall rofi
    exit 0
fi

shortcuts="󰖳 SUPER + T      -> Terminal
󰖳 SUPER + Q      -> Cerrar Ventana
󰖳 SUPER + E      -> Archivos
󰖳 SUPER + M      -> Menú Apps
󰖳 SUPER + F      -> Flotante
󰖳 CTRL+SUP+M     -> Salir
󰖳 PRINT          -> Captura
󰖳 SUPER + H      -> Manual
󰖳 SUPER + [0-9]  -> Escritorios
󰖳 FN + F6/F7     -> Brillo
󰖳 TECLAS VOL     -> Volumen
󰖳 MIC MUTE       -> Micro"

echo -e "$shortcuts" | rofi -dmenu -p "Manual de Atajos" -config ~/.config/rofi/modal_shortcuts.rasi
