class_name MultiplayerManager extends Node

const PORT = 9999
const IP_ADDRESS = "localhost" 

@export var scene_manager:SceneManager

var player_scene = preload("res://systems/player/Player.tscn") 
var enet = ENetMultiplayerPeer.new()

func _ready():
	scene_manager.server_created.connect(create_server)
	scene_manager.client_created.connect(create_client)

func create_server(port:=9999):
	enet.create_server(port)
	multiplayer.multiplayer_peer = enet
	enet.peer_connected.connect(_create_player)
	
	_create_player(multiplayer.get_unique_id())
	
func create_client(port:=9999):
	enet.create_client(IP_ADDRESS, port)
	multiplayer.multiplayer_peer = enet

func _create_player(_id):
	
	var player = player_scene.instantiate()
	player.name = str(_id)
	scene_manager.current_scene.add_child(player)
	
