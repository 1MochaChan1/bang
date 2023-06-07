class_name MainMenu extends CustomScene


func _on_join_pressed():
	scene_data[GlobalConst.IS_MULTIPLAYER] = true
	scene_data[GlobalConst.NETWORK_ROLE] = GlobalConst.NetworkRole.Client
	on_scene_change.emit(
		self.MAIN_MENU, self.MULTIPLAYER_LEVEL,
		scene_data)


func _on_host_pressed():
	scene_data[GlobalConst.IS_MULTIPLAYER] = true
	scene_data[GlobalConst.NETWORK_ROLE] = GlobalConst.NetworkRole.Host
	on_scene_change.emit(
		self.MAIN_MENU, self.MULTIPLAYER_LEVEL,
		scene_data)
