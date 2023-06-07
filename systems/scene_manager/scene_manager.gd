class_name SceneManager extends Node

var current_scene:CustomScene
var _current_scene_path:String = CustomScene.MAIN_MENU

signal scene_changed(new_scene:Node)


func _ready():
	current_scene = load(_current_scene_path).instantiate()
	add_child(current_scene)
	scene_changed.emit(current_scene)

func change_scene(_from:StringName, to:StringName, scene_data=null):
	if(_current_scene_path != to):
		var next_scene:CustomScene = load(str(to)).instantiate()
		if(scene_data):
			next_scene.scene_data = scene_data
		add_child(next_scene)
		current_scene.queue_free()
		current_scene = next_scene
		_current_scene_path = to
		scene_changed.emit(current_scene)
