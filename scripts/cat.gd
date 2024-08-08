extends CharacterBody2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var direccion: int = 0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()

func _process(delta: float) -> void:
	position.x += direccion * (30 * delta)
	
	if direccion > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	

func _on_timer_timeout() -> void:
	direccion = randi() % 3 - 1
