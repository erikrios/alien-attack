extends Control

class_name HUD

@onready var score: Label = %Score
@onready var lives_left: Label = %LivesLeft

func set_score_label(new_score: int): 
	score.text = "SCORE: %s" % str(new_score)
	
func set_lives(amount: int):
	lives_left.text = str(amount)
