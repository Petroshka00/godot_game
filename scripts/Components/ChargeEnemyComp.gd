extends Node

@export var enemy: CharacterBody2D
var player: CharacterBody2D

@onready var move_state_machine = $"../Move State Machine"

var move_direction: Vector2
var wander_time: float

var wander_move_speed: int
var follow_move_speed: int
var build_up_move_speed: int
var attack_move_speed: int

var attack_build_up_time: float
var attack_duration: float

var detection_distance: int
var attack_range: int


func init(wander_speed: int, follow_speed: int, build_up_speed: int, attack_speed: int, build_up_time: float, atk_duration: float, detection_dist: int, atk_range: int):
	wander_move_speed = wander_speed
	follow_move_speed = follow_speed
	build_up_move_speed = build_up_speed
	attack_move_speed = attack_speed
	
	attack_build_up_time = build_up_time
	attack_duration = atk_duration
	
	detection_distance = detection_dist
	attack_range = atk_range
	
	player = get_tree().get_first_node_in_group("Player")

func randomize_wander_direction():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func get_idle_movement() -> Vector2:
	randomize_wander_direction()
	return move_direction * wander_move_speed

func get_follow_movement() -> Vector2:
	return (player.global_position - enemy.global_position).normalized() * follow_move_speed

func get_buildup_movement() -> Vector2:
	return Vector2()

func set_attack_direction() -> void:
	move_direction = (player.global_position - enemy.global_position).normalized()

func get_attack_movement() -> Vector2:
	return move_direction * attack_move_speed

func get_parent_velocity() -> Vector2:
	var state_name: String = move_state_machine.current_state.get_state_name().to_lower()
	match state_name:
		"idle":
			return get_idle_movement()
		"follow":
			return get_follow_movement()
		"buildup":
			return get_buildup_movement()
		"attack":
			return get_attack_movement()
	return Vector2()
