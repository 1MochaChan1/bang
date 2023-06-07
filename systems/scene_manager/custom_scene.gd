class_name CustomScene extends Node

signal on_scene_change(from:StringName, to:StringName, scene_data:Dictionary)

const MAIN_MENU:StringName="res://systems/ui/menu/MainMenu.tscn"
const SINGLE_PLAYER_LEVEL:StringName = "res://levels/SinglePlayerLevel.tscn"
const MULTIPLAYER_LEVEL:StringName = "res://levels/MultiplayerLevel.tscn"

var scene_data:Dictionary = {
	GlobalConst.NETWORK_ROLE:null,
	GlobalConst.IS_MULTIPLAYER:false,
}
