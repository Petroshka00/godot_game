extends State

@export var idle_state: State
@export var follow_state: State
@export var buildup_state: State
@export var attack_state : State

@export var slime: CharacterBody2D

var attack_range := 40

var move_direction: Vector2
var player: CharacterBody2D

func enter() -> void:
	super()
	player = get_tree().get_first_node_in_group("Player")
	
func process_physics(delta: float) -> State:
	if not player:
		return idle_state
	if animations.is_playing():
		var direction = player.global_position - slime.global_position
		slime.velocity = Vector2()
		if direction.length() < attack_range:
			return null
		return follow_state
	return attack_state
