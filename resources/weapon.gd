class_name Weapon extends Resource

@export var fire_rate:float = 5
@export var max_ammo:int = 15
@export var bullet:Bullet
@export var reload_time:float = 1
@export var sprite:AtlasTexture
var current_ammo:int 

func _init():
	current_ammo = max_ammo

# setters
func set_reload_time(val):
	current_ammo = val

func shoot():
	if(current_ammo > 0 ):
		current_ammo = current_ammo - 1


func reload():
	current_ammo = max_ammo
