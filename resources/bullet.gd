class_name Bullet extends Resource

@export var knockback:float = 400 : set = set_knockback
@export var speed:float = 10 : set = set_speed
@export var sprite:AtlasTexture


# setters
func set_speed(val):
	if(val > 1):
		speed = val
	
func set_knockback(val):
	if(val > 1):
		knockback = val
