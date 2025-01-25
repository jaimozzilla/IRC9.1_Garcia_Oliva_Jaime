#!/bin/bash

# Nombre de la carpeta y archivo
CARPETA="Carpeta-script3"
ARCHIVO="archivo.txt"

# Verificar si la carpeta existe
if [ ! -d "$CARPETA" ]; then
    echo "La carpeta '$CARPETA' no existe. Creándola..."
    mkdir -p "$CARPETA"
    echo "Carpeta '$CARPETA' creada exitosamente."
else
    echo "La carpeta '$CARPETA' ya existe."
fi

# Ruta completa del archivo
RUTA_ARCHIVO="$CARPETA/$ARCHIVO"

# Verificar si el archivo existe
if [ -f "$RUTA_ARCHIVO" ]; then
    echo "El archivo '$RUTA_ARCHIVO' ya existe. Creando un backup..."
    FECHA=$(date +"%Y-%m-%d")
    mv "$RUTA_ARCHIVO" "$CARPETA/${ARCHIVO%.*}_backup_$FECHA.${ARCHIVO##*.}"
    echo "Backup creado como '${ARCHIVO%.*}_backup_$FECHA.${ARCHIVO##*.}'."
else
    echo "El archivo '$RUTA_ARCHIVO' no existe. Creándolo..."
fi

# Crear un nuevo archivo
echo "Este es el contenido del archivo creado el $(date)" > "$RUTA_ARCHIVO"
echo "Archivo '$RUTA_ARCHIVO' creado exitosamente."

# Fin del script
