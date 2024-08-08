extends MoveState

@export var move_state: MoveState
@export var dodge_state: MoveState

@export var player: CharacterBody2D

func enter() -> void:
	super()
	parent.velocity = Vector2()
	
func process_input(input: InputEvent) -> MoveState:
	if get_movement_input() != Vector2():
		return move_state
	return null
