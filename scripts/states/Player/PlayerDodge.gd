extends MoveState

@export var idle_state: MoveState
@export var move_state: MoveState

@export var player: CharacterBody2D
@onready var hurtbox_area = $"../../HurtboxComponent/HurtboxArea"


func enter() -> void:
	super()
	move_component.set_roll_direction()
	hurtbox_area.disabled = true
	
func exit() -> void:
	hurtbox_area.disabled = false

func process_physics(delta: float) -> MoveState:
	parent.velocity = move_component.get_velocity()
	
	if parent.velocity == Vector2():
		return idle_state
	
	parent.animations.flip_h = parent.velocity[0] < 0
	parent.move_and_slide()
	return null

func process(delta: float) -> MoveState:
	if animations.is_playing():
		return null
	return idle_state
