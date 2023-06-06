class_name CustomScene extends Node

signal scene_changed(from:StringName, to:StringName, scene_data:Dictionary)

const MainMenu:StringName="res://systems/ui/menu/MainMenu.tscn"
const SinglePlayerLevel:StringName = "res://levels/SinglePlayerLevel.tscn"
const MultiplayerLevel:StringName = "res://levels/MultiplayerLevel.tscn"
