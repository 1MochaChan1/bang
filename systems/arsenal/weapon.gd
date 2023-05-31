class_name WeaponScene extends Node2D

signal weapon_switched(changed_weapon_type:Weapon)

@export var weapon_type:Weapon

@onready var sprite = $Sprite2D
@onready var fire_rate_timer = $FireRateTimer
@onready var reload_timer = $ReloadTimer
@onready var bullet_spawner = $BulletSpawner

var bullet_scene = preload("res://systems/arsenal/Bullet.tscn")
var can_shoot = true;
var reloading = false;
var max_ammo:int



func _ready():
	if(weapon_type):
		init_stats()


func _process(_delta):
	if(weapon_type):
		if(!reloading):
			$Label.text = str(weapon_type.current_ammo)
		else:
			$Label.text = "reloading"
		#	if(Input.is_action_pressed("ui_accept")):
		#		shoot()
		if(weapon_type.current_ammo < 1 and not reloading):
			reload()

func init_stats():
	weapon_type = weapon_type.duplicate()
	fire_rate_timer.wait_time = 1/weapon_type.fire_rate
	reload_timer.wait_time = weapon_type.reload_time
	sprite.texture = weapon_type.sprite
	max_ammo = weapon_type.max_ammo
	weapon_type.current_ammo = weapon_type.max_ammo

func shoot():
	if(weapon_type):
		if(fire_rate_timer.is_stopped()):
			fire_rate_timer.start()
		if(can_shoot \
		and weapon_type.current_ammo > 0 \
		and not reloading):
			var bullet:BulletScene = bullet_scene.instantiate()
			bullet.bullet_type = weapon_type.bullet
			
			bullet.transform = bullet_spawner.global_transform
			get_tree().get_root().add_child(bullet)
			weapon_type.shoot()
			can_shoot = false


func reload():
	can_shoot = false
	reloading = true
	reload_timer.start()

func switch(new_weapon_type:Weapon):
	weapon_switched.emit(new_weapon_type)
	weapon_type = new_weapon_type.duplicate()
	init_stats()


func _on_fire_rate_timer_timeout():
	can_shoot = true
	

func _on_reload_timer_timeout():
	can_shoot = true
	reloading = false
	weapon_type.reload()
