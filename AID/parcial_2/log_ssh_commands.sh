#!/bin/bash

# Definir el archivo de log
LOGFILE="/var/log/ssh_session_$(date +'%Y-%m-%d_%H-%M-%S').log"

# Registrar inicio de sesión
echo "===== Nueva sesión SSH iniciada en $(date) =====" >> "$LOGFILE"
echo "Usuario: $USER" >> "$LOGFILE"
echo "IP de origen: $SSH_CLIENT" >> "$LOGFILE"
echo "----------------------------------------" >> "$LOGFILE"

# Habilitar historial en tiempo real
export HISTFILE="$HOME/.bash_history"
export PROMPT_COMMAND='history -a'

# Capturar cada comando ejecutado y escribirlo en el log
trap 'cmd=$(history 1 | sed "s/^[ ]*[0-9]\+[ ]*//"); echo "$(date +"%Y-%m-%d %H:%M:%S") - $USER ejecutó: $cmd" >> "$LOGFILE"' DEBUG

# Mantener la sesión activa hasta que el usuario salga
bash

# Registrar cierre de sesión
echo "===== Sesión SSH finalizada en $(date) =====" >> "$LOGFILE"
