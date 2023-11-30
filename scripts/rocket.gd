extends Area2D

class_name Rocket

@export var speed := 300

func _physics_process(delta: float) -> void:
	global_position.x += speed * delta
