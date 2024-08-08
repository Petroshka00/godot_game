extends MoveState

@export var follow_state: MoveState
@export var attack_state: MoveState

var player: CharacterBody2D

func enter() -> void:
	super()
	player = get_tree().get_first_node_in_group("Player")

func process(delta: float) -> MoveState:
	if not player:
		return follow_state
	var distance_to_player = player.global_position - parent.global_position
	if distance_to_player.length() < move_component.attack_range and not animations.is_playing():
		return attack_state
	if distance_to_player.length() > move_component.attack_range:
		return follow_state
	return null

func process_physics(delta: float) -> MoveState:
	if not player:
		return follow_state
	parent.velocity = move_component.get_parent_velocity()
	return null
