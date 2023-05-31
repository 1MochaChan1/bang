extends CharacterBody2D


const SPEED = 40.0
const GRAVITY = 80.0

@onready var knockback_timer = $Knockback
@onready var weapon = $Weapon

var is_getting_knocked_back:bool = false
var knockback:Vector2


func _process(_delta):
	pass
#	weapon.shoot()
#	if(!is_getting_knocked_back):
#		velocity.x = SPEED
#		velocity.y += GRAVITY * _delta
#	else:
#		velocity = knockback
#	move_and_slide()


func add_knockback(dir:Vector2):
	knockback = dir
	is_getting_knocked_back = true
	knockback_timer.start()


func _on_knockback_timeout():
	is_getting_knocked_back = false
