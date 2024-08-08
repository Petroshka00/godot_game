extends CharacterBody2D
class_name Slime

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var move_state_machine = $"Move State Machine"
@onready var health_component = $HealthComponent
@onready var damage_component = $DamageComponent
@onready var hitbox_component = $HitboxComponent
@onready var hurtbox_component = $HurtboxComponent
@onready var charge_enemy_comp = $ChargeEnemyComp

func _ready() -> void:
	health_component.init(100)
	damage_component.init(20)
	hitbox_component.init(3)
	hurtbox_component.init(2)
	charge_enemy_comp.init(15, 20, 0, 100, 1, 4, 80, 40)
	move_state_machine.init(self, animated_sprite_2d, charge_enemy_comp)
	
func _physics_process(delta: float) -> void:
	move_state_machine.process_physics(delta)
	move_and_slide()
	
func _process(delta: float) -> void:
	move_state_machine.process(delta)
