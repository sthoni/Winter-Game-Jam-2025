class_name Level extends Node2D

func _ready() -> void:
	SignalBus.bullet_fired.connect(_on_bullet_fired)

func _on_bullet_fired(bullet: Bullet) -> void:
	add_child(bullet)
