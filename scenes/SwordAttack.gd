extends WeaponState

@export var idle_state: WeaponState
@export var attack_state: WeaponState
@onready var collision_shape_2d = $"../../Pivot/HitboxComponent/CollisionShape2D"

# Called when the node enters the scene tree for the first time.
func enter():
	super()
	collision_shape_2d.disabled = false

func exit():
	collision_shape_2d.disabled = true
	animation_player.stop()
	
func process(delta: float) -> WeaponState:
	return null
	
func process_physics(delta: float) -> WeaponState:
	if animation_player.is_playing():
		return null
	return idle_state
	
func process_input(input: InputEvent) -> WeaponState:
	return null
