from flask import Flask, jsonify

app = Flask(_name_)

task = [
	{"id":1, "nombre":"guts", "enable":True},
	{"id":2, "nombre":"casca", "enable":True},
	{"id":3, "nombre":"griffith", "enable":True},
	{"id":4, "nombre":"pipin", "enable":True},
]

@app.route('/tasks', methods=['GET'])
def get_tasks():
	return jsonify(task)
	
if _name_ == '_main_':
	app.run(debug=True)
