class_name Enemy extends CharacterBody2D

@export var stats: CharacterStats

@onready var health: HealthComponent = %HealthComponent
@onready var freeze: FreezeComponent = %FreezeComponent
@onready var sprite: Sprite2D = %Sprite2D

@export var max_fall_speed := 250.0
var current_gravity := 20.0
var is_frozen := false

func _ready() -> void:
	health.current_health = stats.max_health
	health.health_depleted.connect(func() -> void: queue_free())
	freeze.current_heat = stats.max_heat
	freeze.freeze_state_changed.connect(func(frozen: bool) -> void: if frozen: sprite.modulate = Color(0, 1.0, 1.0, 1.0))


func _physics_process(delta: float) -> void:
	velocity.y += current_gravity * delta
	velocity.y = minf(velocity.y, max_fall_speed)
	move_and_slide()
