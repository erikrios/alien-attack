extends Control

class_name GameOverScreen

@onready var score_label: Label = %ScoreLabel

func set_score_label(new_score: int):
	score_label.text = "SCORE: %s" % str(new_score)

func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()
