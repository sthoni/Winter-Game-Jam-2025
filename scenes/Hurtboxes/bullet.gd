class_name Bullet extends Hitbox

@export var velocity: Vector2 = Vector2(1, 0)

func _physics_process(delta: float) -> void:
    position += velocity * delta

func _on_area_entered(area: Area2D) -> void:
    super(area)
    queue_free()
