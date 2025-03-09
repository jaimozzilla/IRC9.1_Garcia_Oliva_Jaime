import request

url = "https://127.0.0.1:5000/tasks"

response = requests.get(url)

if response.status_code == 200:
	data = response.json()
	print ('solicitud exitosa')
	print ("Datos: ", data)
else:
	print ("Error en la solicitud: ", response.text)


