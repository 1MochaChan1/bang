class_name WeaponPickup extends RigidBody2D

@export var weapon_type:Weapon

@onready var sprite = $Sprite2D


func _ready():
	if(weapon_type):
		sprite.texture = weapon_type.sprite

func _process(_delta):
	pass

func destroy():
	queue_free()


func _on_area_2d_body_entered(body):
	if(body is Player):
		body.weapon.switch(weapon_type)
		queue_free()
