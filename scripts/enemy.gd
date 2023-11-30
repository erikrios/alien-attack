extends Area2D

class_name Enemy

@export var speed := 300

func _physics_process(delta: float) -> void:
	global_position.x += -speed * delta

func die() -> void:
	queue_free()
