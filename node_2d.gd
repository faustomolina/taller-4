extends Node2D

@export var mob_scene: PackedScene = preload("res://key_object.tscn")

var positions: Array = []
var collisionCount = 0
var KeyInstance
var pos

func _ready():
	positions.append($Objects/CircleObject.global_position.x)
	positions.append($Objects/CircleObject2.global_position.x)
	positions.append($Objects/CircleObject3.global_position.x)


func _spawn():
	KeyInstance = mob_scene.instantiate()
	pos = $Marker2D.position
	pos.x = positions[randi() % 3]
	KeyInstance.spawn(randi() % 3, pos)
	add_child(KeyInstance)

func _on_bottom_area_area_entered(_area):
	# Incrementar el contador cuando una "bolita" colisiona
	collisionCount += 1
	# Comprobar el valor del contador y cambiar los sprites en consecuencia
	if collisionCount == 2:
		$Luces1.visible = true
		$Luces2.visible = true
		$Luces3.visible = false
	elif collisionCount == 4:
		$Luces1.visible = true
		$Luces2.visible = false
		$Luces3.visible = false
	elif collisionCount == 6:
		$Luces1.visible = false
		$Luces2.visible = false
		$Luces3.visible = false

func _on_timer_timeout():
	_spawn()

