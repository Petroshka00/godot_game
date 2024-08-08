extends WeaponState

@export var idle_state: WeaponState
@export var attack_state: WeaponState

func enter():	#No re resetea la animacion
	super()

func process(delta: float) -> WeaponState:
	return null
	
func process_physics(delta: float) -> WeaponState:
	return null
	
func process_input(input: InputEvent) -> WeaponState:
	if input.is_action("Attack"):
		return attack_state
	return null
