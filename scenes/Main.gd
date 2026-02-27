extends Node
@onready var player = $Player


func _physics_process(_delta):
	if player.global_position.y > 750:
		get_tree().reload_current_scene()
