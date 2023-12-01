extends Node2D

signal enemy_spawned(enemy_instance: Enemy)

@onready var spawn_positions: Node2D = $SpawnPositions

var enemy_scene: PackedScene = preload("res://scenes/enemy.tscn")

func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy() -> void:
	var spawn_position_children := spawn_positions.get_children()
	var random_spawn_position: Marker2D = spawn_position_children.pick_random()
	
	var enemy_instance := enemy_scene.instantiate()
	enemy_instance.global_position = random_spawn_position.global_position
	emit_signal("enemy_spawned", enemy_instance)
