extends Node

@export var player: CharacterBody2D

@onready var move_sm = $"../Move SM"

var move_speed: int
var dodge_speed: int

var roll_direction: Vector2

func init(move_s: int, dodge_s: int):
	move_speed = move_s
	dodge_speed = dodge_s

func get_input_direction() -> Vector2:
	var x = Input.get_axis("Left", "Right")
	var y = Input.get_axis("Up", "Down")
	var direction = Vector2(x, y).normalized()
	
	return direction

func get_move_velocity() -> Vector2:
	return move_speed * get_input_direction()

func set_roll_direction() -> void:
	roll_direction = get_input_direction()

func get_dodge_velocity() -> Vector2:
	return roll_direction * dodge_speed

func get_velocity() -> Vector2:
	var state_name = move_sm.current_state.get_state_name().to_lower()
	
	match state_name:
		"move":
			return get_move_velocity()
		"idle":
			return Vector2()
		"dodge":
			return get_dodge_velocity()
	return Vector2()
