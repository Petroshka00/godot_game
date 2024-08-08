extends Node2D
class_name HealthComponent

var max_health: int
var current_health: int

func init(max_hp: int) -> void:
	max_health = max_hp
	current_health = max_health

func take_damage(damage: int):
	current_health -= damage
	if current_health <= 0:
		die()

func die():
	get_parent().queue_free()

func heal(healing_amount: int):
	if current_health + healing_amount > max_health:
		current_health = max_health
	else:
		current_health += healing_amount
