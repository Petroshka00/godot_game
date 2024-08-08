extends Node
class_name State

@export var state_name: String
@export var animation_name: String

var parent: CharacterBody2D
var animations: AnimatedSprite2D

func enter() -> void:
	animations.play(animation_name)
	
func exit() -> void:
	pass
	
func process_input(event: InputEvent) -> State:
	return null

func process(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null

func get_state_name() -> String:
	return state_name
