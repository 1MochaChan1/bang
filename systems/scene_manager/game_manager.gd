class_name GameManager extends Node

@onready var multiplayer_manager:MultiplayerManager = $MultiplayerManager
@onready var scene_manager:SceneManager = $SceneManager

var network_role = GlobalConst.NetworkRole.Host

func _ready():
	scene_manager.scene_changed.connect(on_scene_changed)
	scene_manager.current_scene.on_scene_change.connect(handle_scene_change)


func on_scene_changed(new_scene):
	if(new_scene is CustomScene):
		new_scene.on_scene_change.connect(handle_scene_change)
		if(new_scene.scene_data[GlobalConst.IS_MULTIPLAYER]):
			match new_scene.scene_data[GlobalConst.NETWORK_ROLE]:
				GlobalConst.NetworkRole.Host:
					multiplayer_manager.create_server()
				GlobalConst.NetworkRole.Client:
					multiplayer_manager.create_client()


func handle_scene_change(from:StringName, to:StringName, scene_data:Dictionary):
	scene_manager.change_scene(from, to, scene_data)
