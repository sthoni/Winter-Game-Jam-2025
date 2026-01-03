class_name Enemy extends CharacterBody2D

@export var stats: CharacterStats

@onready var health: HealthComponent = %HealthComponent
@onready var freeze: FreezeComponent = %FreezeComponent
@onready var sprite: Sprite2D = %Sprite2D
@onready var death_particle: CPUParticles2D = %DeathParticle
@onready var hitbox: Hitbox = %Hitbox

@export var max_fall_speed := 250.0
var is_frozen := false

func _ready() -> void:
	health.current_health = stats.max_health
	health.health_depleted.connect(func() -> void: die())
	freeze.current_heat = stats.max_heat
	freeze.freeze_state_changed.connect(func(frozen: bool) -> void:
		if frozen:
			is_frozen = true
			modulate = Color(0, 1.0, 1.0, 1.0)
			hitbox.monitoring = false
		else:
			is_frozen = false
			modulate = Color(1.0, 1.0, 1.0, 1.0)
			hitbox.monitoring = true
	)


func _physics_process(delta: float) -> void:
	if is_frozen:
		velocity.y = 100.0
		velocity.x = 0.0
	else:
		var player: Player = get_tree().get_first_node_in_group("Player")
		var direction := player.position - position
		direction = direction.normalized()
		velocity = direction * 50.0
	move_and_slide()


func die() -> void:
	SoundManager.play_sfx(load("res://assets/sfx/explosion.wav"), 0.2)
	death_particle.emitting = true
	SignalBus.enemy_killed.emit()
	death_particle.finished.connect(func() -> void: queue_free())
