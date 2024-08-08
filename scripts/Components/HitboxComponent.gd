extends Area2D
class_name HitboxComponent

@export var damage_component: DamageComponent

func init(layer: int) -> void:
	set_collision_layer_value(layer, true)

