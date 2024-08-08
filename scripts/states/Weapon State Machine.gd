extends BaseFSM
class_name WeaponFSM

func init(parent: Node2D, animation_player: AnimationPlayer, hitbox: CollisionShape2D = null):
	for child in get_children():
		child.parent = parent
		child.animation_player = animation_player
		child.hitbox_area = hitbox
	change_state(initial_state)
