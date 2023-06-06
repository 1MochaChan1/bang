class_name GameManager extends Node

@onready var multiplayer_manager:MultiplayerManager = $MultiplayerManager
@onready var scene_manager:SceneManager = $SceneManager

func _ready():
	if(scene_manager.current_scene is MainMenu):
		scene_manager.current_scene.on_click_server_create.connect(
			func():print("server created"))
