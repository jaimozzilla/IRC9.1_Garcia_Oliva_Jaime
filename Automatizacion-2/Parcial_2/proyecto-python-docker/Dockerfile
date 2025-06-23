# Imagen base ligera de Python 3.10
FROM python:3.10-slim

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos el archivo de dependencias
COPY app/requirements.txt .

# Instalamos las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos el resto del código de la aplicación
COPY app/ .

# Puerto en el que se ejecuta Flask por defecto
EXPOSE 5000

# Comando para iniciar la app
CMD ["python", "app.py"]
