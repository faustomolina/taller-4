extends Area2D



const GRAVITY = 100

var inside_area = false
var selected_key = 0
var texture_name = ""  # Nombre de la textura
var speed = GRAVITY

func _process(delta):
	position.y += speed * delta
	apretar()
	
func apretar():
	if inside_area:
		if Input.is_action_just_pressed(selected_key):
			print("debug => ¡qué bien! ")
			queue_free()

func spawn(key: int, pos: Vector2) -> void:
	position = pos
	match key:
		0:
			selected_key = "electron"
			texture_name = "electron.png"
		1:
			selected_key = "neutron"
			texture_name = "neutron.png"
		2:
			selected_key = "proton"
			texture_name = "proton.png"
	
	set_texture(texture_name)  # Llama a una función para cambiar la textura

func set_texture(texture_name: String) -> void:
	# Asigna la nueva textura al Sprite2D
	var sprite = $Sprite2D
	sprite.set_texture(load("res://img/" + texture_name))


func _on_area_entered(_area):
	inside_area = true

func _on_area_exited(_area):
	inside_area = false
