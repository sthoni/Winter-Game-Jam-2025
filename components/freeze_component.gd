class_name FreezeComponent extends Node

signal freeze_state_changed(is_frozen: bool)

@export var max_heat: float = 100.0
@export var heat_regen_rate: float = 10.0

var current_heat: float :
	get:
		return current_heat
	set(value):
		current_heat = clampf(value, 0, max_heat)
		emit_signal("freeze_state_changed", is_frozen())



func is_frozen() -> bool:
	return current_heat == 0.0
