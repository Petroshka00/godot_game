extends State
class_name MoveState

var move_component

func get_movement_input() -> Vector2:
	return move_component.get_input_direction()
