extends Node2D

var suma = 0
var key_r = KEY_R
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("proton") or Input.is_action_just_pressed("electron") or Input.is_action_just_pressed("neutron"):
		suma += 1
		$ImagenInicio2.visible = 1
		$ImagenInicio.visible = 0
		
	if suma == 2:
		get_tree().change_scene_to_file("res://node_2d.tscn")

