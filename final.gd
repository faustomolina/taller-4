extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("proton") or Input.is_action_just_pressed("electron") or Input.is_action_just_pressed("neutron"):
		get_tree().change_scene_to_file("res://inicio.tscn")

