class_name DashAttack extends Hitbox


func _on_area_entered(area: Area2D) -> void:
	if area is Hurtbox:
		DebugMenu.log("Dash attack")
		var hurtbox: Hurtbox = area
		var attack: Attack = Attack.new()
		attack.damage = 9999
		attack.freeze_amount = 0.0
		attack.is_dash_attack = true
		hurtbox.take_damage(attack)
