extends Node2D

var lives := 3
var score := 0

@onready var player: Player = $Player
@onready var hud: HUD = $UI/HUD

func _ready() -> void:
	hud.set_score_label(score)

func _on_death_zone_area_entered(area: Area2D) -> void:
	(area as Enemy).die()

func _on_player_took_damage() -> void:
	lives -= 1
	if lives == 0:
		player.die()
		print("Game over")
	else:
		print("Lives: " + str(lives))

func _on_enemy_spawner_enemy_spawned(enemy_instance: Enemy) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died() -> void:
	score += 100
	hud.set_score_label(score)
