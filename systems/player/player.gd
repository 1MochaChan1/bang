class_name Player extends CharacterBody2D

const SPEED = 300.0
const JUMP_IMPUSLSE = 250.0
const GRAVITY = 400.0
const STOP_SPEED_WEIGHT = 0.1

@onready var weapon = $WeaponPos/Weapon
@onready var knockback_timer = $KnockbackTimer


var facing_right=true;
var is_getting_knocked_back:bool = false
var knockback_force:Vector2


func get_local_authority() -> bool:
	return is_multiplayer_authority()


func _enter_tree():
	set_multiplayer_authority(self.name.to_int())


func _ready():
	self.add_to_group("Player")
	if(get_local_authority()):
		weapon.connect("weapon_switched", weapon_switch)


func _process(_delta):
	if(get_local_authority()):
		handle_input(_delta)


func handle_input(delta):
	velocity.y += GRAVITY * delta
	var dir:Vector2
	dir = Input.get_vector("left","right","_","_")
	set_x_scale(dir)
	
	if(Input.is_action_just_pressed("jump") and is_on_floor()):
		velocity.y -= JUMP_IMPUSLSE
	
	if(Input.is_action_pressed("shoot")):
		shoot.rpc()
	
	
	if(dir.length() != 0 and !is_getting_knocked_back):
		velocity.x = dir.x * SPEED
	elif (is_getting_knocked_back):
		print(knockback_force.x * delta)
		velocity.x += knockback_force.x * delta
	else:
		velocity.x = lerpf(velocity.x, 0, STOP_SPEED_WEIGHT)
	move_and_slide()


func set_x_scale(dir:Vector2):
	var x_scale = dir.normalized().x
	if(x_scale > 0):
		scale.y = 1
		rotation_degrees = 0
	elif (x_scale < 0):
		scale.y = -1
		rotation_degrees = 180


@rpc("call_local")
func shoot():
	weapon.shoot()


@rpc("any_peer")
func weapon_switch(new_weapon:Weapon):
	weapon.weapon_type = new_weapon


@rpc("call_local")
func add_knockback(force:Vector2):
	knockback_force = force
	is_getting_knocked_back = true
	knockback_timer.start()


func _on_knockback_timer_timeout():
	is_getting_knocked_back = false
	knockback_force = Vector2.ZERO
	knockback_timer.stop()
