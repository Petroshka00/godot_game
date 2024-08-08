extends State

@export var follow_state: State

@export var slime: CharacterBody2D

var attack_direction: Vector2
var player: CharacterBody2D
var attack_speed := 150
var attack_duration: float

func enter() -> void:
	super()
	attack_duration = 0.4
	player = get_tree().get_first_node_in_group("Player")
	attack_direction = player.global_position - slime.global_position
	
func process_physics(delta: float) -> State:
	if not player:
		return follow_state
	attack_duration -= delta
	slime.velocity = attack_direction.normalized() * attack_speed
	if attack_duration <= 0:
		return follow_state
	return null
