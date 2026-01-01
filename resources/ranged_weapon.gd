class_name RangedWeapon extends Resource

@export var name: String
@export var sprite: Texture2D
@export var fire_sound: AudioStream
@export var hit_sound: AudioStream
@export var fire_rate: float = 1.0
@export var bullet_scene: PackedScene
@export var bullet_speed: float = 1000.0
@export var bullet_damage: int = 10

func execute_attack(weapon: WeaponComponent) -> void:
    var bullet: Bullet = bullet_scene.instantiate()
    bullet.position = weapon.nozzle.global_position
    bullet.rotation = weapon.rotation
    bullet.velocity = Vector2(bullet_speed, 0).rotated(bullet.rotation)
    bullet.damage = bullet_damage
    SignalBus.emit_signal("bullet_fired", bullet)
