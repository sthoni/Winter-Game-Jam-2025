class_name Hurtbox extends Area2D

@export var health_component: HealthComponent
@export var freeze_component: FreezeComponent

func take_damage(attack: Attack) -> void:
	if health_component:
		if not attack.is_dash_attack:
			health_component.current_health -= attack.damage
		elif freeze_component.is_frozen():
			health_component.current_health -= attack.damage
			SignalBus.emit_signal("camera_shake_requested", 0.5)
	if freeze_component:
		freeze_component.current_heat -= attack.freeze_amount
