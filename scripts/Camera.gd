extends Camera2D

@onready var player = $"../Player"


func _process(delta):
	global_position = (player.global_position + get_global_mouse_position()/3) / 2 
