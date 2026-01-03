class_name WeaponComponent extends Node2D

@export var current_weapon: RangedWeapon

@onready var nozzle: Marker2D = %Nozzle
@onready var cooldown_timer: Timer = Timer.new()

func _ready() -> void:
	cooldown_timer.one_shot = true
	cooldown_timer.wait_time = current_weapon.fire_rate
	add_child(cooldown_timer)

func try_attack() -> void:
	if cooldown_timer.is_stopped():
		current_weapon.execute_attack(self)
		cooldown_timer.start()
