extends MoveState

@export var idle_state: MoveState
@export var buildup_state: MoveState

var player: CharacterBody2D

func enter() -> void:
	super()
	player = get_tree().get_first_node_in_group("Player")

func process(delta: float) -> MoveState:
	if not player:
		return idle_state
	
	var distance_to_player = player.global_position - parent.global_position
	if distance_to_player.length() < move_component.attack_range:
		return buildup_state
	if distance_to_player.length() < move_component.detection_distance:
		return null
	return idle_state

func process_physics(delta: float) -> MoveState:
	if not player:
		return idle_state
	parent.velocity = move_component.get_parent_velocity()
	return null
