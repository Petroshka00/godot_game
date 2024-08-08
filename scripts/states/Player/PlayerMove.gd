extends MoveState

@export var idle_state: MoveState
@export var dodge_state: MoveState

func enter() -> void:
	super()

func process_physics(delta: float) -> MoveState:
	parent.velocity = move_component.get_velocity()
	
	if parent.velocity == Vector2():
		return idle_state
	
	parent.animations.flip_h = parent.velocity[0] < 0
	parent.move_and_slide()
	return null

func process_input(input: InputEvent) -> MoveState:
	if input.is_action("Dodge"):
		return dodge_state
	return null
