#!/bin/bash

# Lista de URLs
urls=("https://www.facebook.com/" "https://www.instagram.com/" "https://www.reddit.com/")

# Archivos de salida
csv_file="output.csv"
yml_file="output.yml"
xml_file="output.xml"
json_file="output.json"

# Inicializar archivos
> "$csv_file"
> "$yml_file"
> "$xml_file"
> "$json_file"

# Cabeceras de los archivos
echo "url,status_code" > "$csv_file"
echo "urls:" > "$yml_file"
echo "<urls>" > "$xml_file"
echo "{" > "$json_file"

# Recorrer las URLs
for url in "${urls[@]}"; do
    # Obtener el código de estado
    status_code=$(curl -o /dev/null -s -w "%{http_code}\n" "$url")
    
    # Escribir en CSV
    echo "$url,$status_code" >> "$csv_file"
    
    # Escribir en YML
    echo "  - url: $url" >> "$yml_file"
    echo "    status_code: $status_code" >> "$yml_file"
    
    # Escribir en XML
    echo "  <url>" >> "$xml_file"
    echo "    <location>$url</location>" >> "$xml_file"
    echo "    <status_code>$status_code</status_code>" >> "$xml_file"
    echo "  </url>" >> "$xml_file"
    
    # Escribir en JSON
    echo "  \"$url\": {" >> "$json_file"
    echo "    \"status_code\": $status_code" >> "$json_file"
    echo "  }," >> "$json_file"
done

# Cerrar el archivo JSON
sed -i '$ s/,$//' "$json_file"
echo "}" >> "$json_file"

# Cerrar el archivo XML
echo "</urls>" >> "$xml_file"

echo "Archivos generados:"
echo "- $csv_file"
echo "- $yml_file"
echo "- $xml_file"
echo "- $json_file"
