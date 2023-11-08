extends Node2D

@export var mob_scene: PackedScene = preload("res://key_object.tscn")

var positions: Array = []
var collisionCount = 0
var KeyInstance
var pos
var tiempo = 0

func _ready():
	positions.append($Objects/CircleObject.global_position.x)
	positions.append($Objects/CircleObject2.global_position.x)
	positions.append($Objects/CircleObject3.global_position.x)

func _process(delta):
	tiempo+=1
	if tiempo >= 1500:
		KeyInstance.speed = 300
		$Timer.wait_time = 1
	if tiempo >= 3000:
		KeyInstance.speed = 400
		$Timer.wait_time = 0.5
	if tiempo >= 3500:
		KeyInstance.speed = 500
		$Timer.wait_time = 0.25
	print(tiempo)

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

