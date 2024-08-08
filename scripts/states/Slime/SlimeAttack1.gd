extends MoveState

@export var idle_state: MoveState
@export var follow_state: MoveState

var player: CharacterBody2D

func enter() -> void:
	super()
	move_component.set_attack_direction()
	player = get_tree().get_first_node_in_group("Player")

func process(delta: float) -> MoveState:
	if animations.is_playing():
		return null
	return idle_state

func process_physics(delta: float) -> MoveState:
	if not player:
		return idle_state
	parent.velocity = move_component.get_parent_velocity()
	return null
