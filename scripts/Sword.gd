extends Node2D

@onready var damage_component = $DamageComponent
@onready var hitbox_component = $Pivot/HitboxComponent
@onready var collision_shape_2d = $Pivot/HitboxComponent/CollisionShape2D
@onready var state_machine = $"State Machine"
@onready var animation_player = $AnimationPlayer #Probablemente tenga que ser un
@onready var sprite_2d = $Pivot/Sprite2D		 #AnimatedSprite2D para las animaciones


# Called when the node enters the scene tree for the first time.
func _ready():
	damage_component.init(10)
	hitbox_component.init(2)
	collision_shape_2d.disabled = true
	state_machine.init(self, animation_player, collision_shape_2d)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	state_machine.process(delta)
