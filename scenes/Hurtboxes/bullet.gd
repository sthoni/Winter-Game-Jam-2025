class_name Bullet extends Hitbox

@export var velocity: Vector2 = Vector2(1, 0)
@export var hit_sound: AudioStreamWAV

func _physics_process(delta: float) -> void:
    position += velocity * delta

func _on_area_entered(area: Area2D) -> void:
    super(area)
    SoundManager.play_sfx(hit_sound, 0.3)
    queue_free()
