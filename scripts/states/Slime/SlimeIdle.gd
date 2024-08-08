extends State

@export var idle_state: State
@export var follow_state: State
@export var buildup_state: State

@export var slime: CharacterBody2D

var move_direction: Vector2
var wander_time: float

var move_speed: int = 10
var detection_distance: int = 150

var player: CharacterBody2D

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1, 3)

func enter() -> void:
	super()
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()

func process(delta: float) -> State:
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()
	return null

func process_physics(delta: float) -> State:
	if slime:
		slime.velocity = move_direction * move_speed
	if not player:
		return null
	
	var direction = player.global_position - slime.global_position
	if direction.length() < detection_distance:
		return follow_state
	return null
