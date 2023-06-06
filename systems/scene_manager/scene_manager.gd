class_name SceneManager extends Node

var current_scene:CustomScene
var _current_scene_path:String = CustomScene.MainMenu

signal server_created()
signal client_created()


func _ready():
	current_scene = load(_current_scene_path).instantiate()
	current_scene.scene_changed.connect(_handle_scene_change)
#	if(current_scene is MainMenu):
#		current_scene.on_click_server_create.connect(
#			func():server_created.emit())
#		current_scene.on_click_client_create.connect(
#			func():client_created.emit())
	add_child(current_scene)

func _handle_scene_change(_from:StringName, to:StringName):
	if(_current_scene_path != to):
		var next_scene:CustomScene = load(str(to)).instantiate()
		next_scene.scene_changed.connect(_handle_scene_change)
		add_child(next_scene)
		current_scene.queue_free()
		current_scene = next_scene
		_current_scene_path = to
		
