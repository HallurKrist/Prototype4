class_name Gun
extends Position2D
# Represents a weapon that spawns and shoots bullets.
# The Cooldown timer controls the cooldown duration between shots.

signal on_shoot()

const BULLET_VELOCITY = 4000.0
const Bullet = preload("res://src/Objects/Bullet.tscn")

onready var sound_shoot = $Shoot
onready var timer = $Cooldown

onready var coin_counter = get_node(@"../../../../InterfaceLayer/CoinsCounter")


# This method is only called by Player.gd.
func shoot(direction = 1):
	if coin_counter.coins_collected <= 0:
		 return false;
	if not timer.is_stopped():
		return false
	var bullet = Bullet.instance()
	bullet.global_position = global_position
	bullet.linear_velocity = Vector2(direction * BULLET_VELOCITY, 0)
	bullet.gravity_scale=0
	
	bullet.set_as_toplevel(true)
	add_child(bullet)
	sound_shoot.play()
	timer.start()
	emit_signal("on_shoot")
	return true
