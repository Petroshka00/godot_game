extends State
class_name WeaponState

var animation_player: AnimationPlayer
var hitbox_area: CollisionShape2D

func enter() -> void:
	animation_player.play(animation_name)
