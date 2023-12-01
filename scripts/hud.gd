extends Control

class_name HUD

@onready var score: Label = $Score

func set_score_label(new_score: int): 
	score.text = "SCORE: %s" % str(new_score)
