#!/bin/bash

# Declaramos un array con las URLs
declare -a urls=(
    "https://www.facebook.com"
    "https://www.instagram.com"
    "https://www.reddit.com"
)

# Creamos un archivo temporal para almacenar los resultados
file=urls.csv

printf "%s$(date)\n" > "$file"
for url in "${urls[@]}"; do
    status=$(curl -m 10 -s -I "$url" | head -n 1 | awk '{print $2}')
    printf "%s$url,$status\n" >> "$file"
done
column -s, -t "$file" 
