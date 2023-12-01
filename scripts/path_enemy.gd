extends Path2D

class_name PathEnemy

@onready var path_follow_2d: PathFollow2D = $PathFollow2D
@onready var enemy: Area2D = $PathFollow2D/Enemy

func _ready() -> void:
	path_follow_2d.set_progress_ratio(1)

func _process(delta: float) -> void:
	path_follow_2d.progress_ratio -= 0.25 * delta
	if path_follow_2d.progress_ratio == 0:
		queue_free()
