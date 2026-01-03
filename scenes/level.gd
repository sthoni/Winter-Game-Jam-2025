class_name Level extends Node2D

func _ready() -> void:
	SignalBus.bullet_fired.connect(_on_bullet_fired)


func _process(delta: float) -> void:
	if get_tree().get_node_count_in_group("Enemies") == 0:
			GameManager.change_scene(preload("res://ui/EndMenu.tscn"))

func _on_bullet_fired(bullet: Bullet) -> void:
	add_child(bullet)
