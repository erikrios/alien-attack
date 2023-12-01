extends Node2D

var lives := 3
var score := 0

@onready var player: Player = $Player
@onready var hud: HUD = $UI/HUD
@onready var ui: CanvasLayer = $UI
@onready var enemy_hit_sound: AudioStreamPlayer = $EnemyHitSound
@onready var player_took_damage_sound: AudioStreamPlayer = $PlayerTookDamageSound

var game_over_screen_scene: PackedScene = preload("res://scenes/game_over_screen.tscn")

func _ready() -> void:
	hud.set_score_label(score)
	hud.set_lives(lives)

func _on_death_zone_area_entered(area: Area2D) -> void:
	(area as Enemy).queue_free()
	
func _on_player_took_damage() -> void:
	player_took_damage_sound.play()
	lives -= 1
	hud.set_lives(lives)
	if lives == 0:
		player.die()
		
		await get_tree().create_timer(1.5).timeout
		
		var game_over_screen_instance: GameOverScreen = game_over_screen_scene.instantiate()
		ui.add_child(game_over_screen_instance)
		game_over_screen_instance.set_score_label(score)
		
func _on_enemy_spawner_enemy_spawned(enemy_instance: Enemy) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died() -> void:
	score += 100
	hud.set_score_label(score)
	enemy_hit_sound.play()

func _on_enemy_spawner_path_enemy_spawned(path_enemy_instance: PathEnemy) -> void:
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("died", _on_enemy_died)
