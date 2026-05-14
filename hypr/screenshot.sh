#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
TEMP_FILE="$DIR/screenshot_temp.png"
FINAL_NAME="$DIR/Captura_$(date +%Y%m%d_%H%M%S).png"

grim -g "$(slurp)" "$TEMP_FILE"

if [ ! -s "$TEMP_FILE" ]; then
    rm -f "$TEMP_FILE"
    exit
fi

ACTION=$(notify-send "Captura Tomada" "Selecciona qué hacer con la imagen" \
    -i "$TEMP_FILE" \
    --action="save=Guardar y Copiar" \
    --action="edit=Editar (Swappy)" \
    --action="copy=Solo Copiar")

case "$ACTION" in
    "save")
        mv "$TEMP_FILE" "$FINAL_NAME"
        wl-copy < "$FINAL_NAME"
        notify-send "Éxito" "Guardada en Screenshots y copiada." -i "$FINAL_NAME"
        ;;
    "edit")
        swappy -f "$TEMP_FILE" -o "$DIR/Captura_Editada_$(date +%Y%m%d_%H%M%S).png"
        rm -f "$TEMP_FILE"
        ;;
    "copy")
        wl-copy < "$TEMP_FILE"
        rm -f "$TEMP_FILE"
        notify-send "Portapapeles" "Copiada sin guardar archivo." -i camera-photo
        ;;
    *)
        # Si cierras la notificación sin elegir, se queda en temporal o se borra
        rm -f "$TEMP_FILE"
        ;;
esac
