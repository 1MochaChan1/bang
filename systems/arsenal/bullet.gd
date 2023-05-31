class_name BulletScene extends Node2D

@export var bullet_type:Bullet

@onready var sprite = $Sprite2D

signal hit(knockback:float, direction:Vector2)


func _ready():
	if(bullet_type):
		sprite.texture = bullet_type.sprite

func _process(_delta):
	pass
	if(bullet_type):
		move_local_x(bullet_type.speed * _delta)


func _on_area_2d_body_entered(_body):
	if(_body.is_in_group("Player")):
		var force := global_transform.x * bullet_type.knockback
		if(_body.has_method("add_knockback")):
			_body.add_knockback(force)
	queue_free()
