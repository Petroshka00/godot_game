extends State

@export var idle_state: State
@export var follow_state: State
@export var buildup_state: State

@export var slime: CharacterBody2D

var detection_distance: int = 150
var attack_range: int = 40

var move_direction: Vector2
var move_speed := 15
var player: CharacterBody2D

func enter() -> void:
	super()
	player = get_tree().get_first_node_in_group("Player")
	
func process_physics(delta: float) -> State:
	if not player:
		return idle_state
	var direction = player.global_position - slime.global_position
	if direction.length() > attack_range and direction.length() < detection_distance:
		slime.velocity = direction.normalized() * move_speed
		return null
	elif direction.length() > detection_distance:
		return idle_state
	else:
		return buildup_state
