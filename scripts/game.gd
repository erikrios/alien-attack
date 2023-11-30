extends Node2D

var lives := 3

@onready var player: Player = $Player

func _on_death_zone_area_entered(area: Area2D) -> void:
	(area as Enemy).die()

func _on_player_took_damage() -> void:
	lives -= 1
	if lives == 0:
		player.die()
		print("Game over")
	else:
		print(lives)
