extends MoveState

@export var idle_state: MoveState
@export var follow_state: MoveState

var wander_time: float

var player: CharacterBody2D

func randomize_wander():
	wander_time = randf_range(1, 3)

func enter() -> void:
	super()
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()

func process(delta: float) -> MoveState:
	if not player:
		return null
	
	var distance_to_player = player.global_position - owner.global_position
	if distance_to_player.length() < move_component.detection_distance:
		return follow_state
	return null

func process_physics(delta: float) -> MoveState:
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()
		parent.velocity = move_component.get_parent_velocity()
	return null
