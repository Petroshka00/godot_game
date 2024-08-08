extends BaseFSM
class_name EnemyFSM

func init(parent: CharacterBody2D, animations: AnimatedSprite2D, move_component: Node = null):
	for child in get_children():
		child.parent = parent
		child.animations = animations
		child.move_component = move_component
	change_state(initial_state)
