extends Area2D
class_name HurtboxComponent

@export var health_component: HealthComponent

func init(mask: int) -> void:
	self.set_collision_mask_value(mask, true)

func _ready() -> void:
	connect("area_entered", self.on_area_entered)

func on_area_entered(hitbox: HitboxComponent):
	if hitbox == null:
		return
	receive_hit(hitbox.damage_component.damage)

func receive_hit(amount: int):
	if health_component:
		health_component.take_damage(amount)
