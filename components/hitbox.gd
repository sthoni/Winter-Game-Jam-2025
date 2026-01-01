class_name Hitbox extends Area2D

@export var damage: int = 10
@export var freeze_amount: float = 50.0

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	if area is Hurtbox:
		var hurtbox: Hurtbox = area
		var attack: Attack = Attack.new()
		attack.damage = damage
		attack.freeze_amount = freeze_amount
		hurtbox.take_damage(attack)
