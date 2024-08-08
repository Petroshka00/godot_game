extends CharacterBody2D

@onready var animations = $Animations
@onready var health_component = $HealthComponent
@onready var hurtbox_component = $HurtboxComponent
@onready var move_sm = $"Move SM"
@onready var move_component = $MoveComponent

func _ready() -> void:
	health_component.init(100)
	hurtbox_component.init(3)
	move_component.init(150, 240)
	move_sm.init(self, animations, move_component)

func _unhandled_input(event: InputEvent) -> void:
	move_sm.process_input(event)

func _physics_process(delta: float) -> void:
	move_sm.process_physics(delta)

func _process(delta: float) -> void:
	move_sm.process(delta)
