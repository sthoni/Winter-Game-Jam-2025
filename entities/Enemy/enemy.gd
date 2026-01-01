class_name Enemy extends CharacterBody2D

@export var stats: CharacterStats

@onready var health: HealthComponent = %HealthComponent

@export var max_fall_speed := 250.0
var current_gravity := 20.0

func _ready() -> void:
	health.init_health(stats.max_health)
	health.health_depleted.connect(func() -> void: queue_free())


func _physics_process(delta: float) -> void:
	velocity.y += current_gravity * delta
	velocity.y = minf(velocity.y, max_fall_speed)
	move_and_slide()
