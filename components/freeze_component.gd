class_name FreezeComponent extends Node

signal freeze_state_changed(is_frozen: bool)

@export var max_heat: float = 100.0
@export var heat_regen_rate: float = 10.0

var freeze_timer: Timer = Timer.new()
var is_heating_up: bool = false

var current_heat: float :
	get:
		return current_heat
	set(value):
		var old_heat := current_heat
		current_heat = clampf(value, 0, max_heat)
		emit_signal("freeze_state_changed", is_frozen())
		if old_heat > 0.0 and is_frozen():
			SoundManager.play_sfx(AudioStreamWAV.load_from_file("assets/sfx/freeze.wav"), 0.3)
			freeze_timer.start()

func _ready() -> void:
	freeze_timer.wait_time = 3.0
	freeze_timer.one_shot = true
	add_child(freeze_timer)
	freeze_timer.timeout.connect(func() -> void:
		is_heating_up = true
	)

func _process(delta: float) -> void:
	if is_heating_up:
		current_heat += heat_regen_rate * delta
		if current_heat >= max_heat:
			current_heat = max_heat
			is_heating_up = false

func is_frozen() -> bool:
	return current_heat == 0.0
