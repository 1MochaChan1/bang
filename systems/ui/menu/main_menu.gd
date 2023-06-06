class_name MainMenu extends CustomScene

signal on_click_server_create()
signal on_click_client_create()


func _on_join_pressed():
	on_click_client_create.emit()
#	scene_changed.emit(self.MainMenu, self.MultiplayerLevel)


func _on_host_pressed():
	on_click_server_create.emit()
#	scene_changed.emit(self.MainMenu, self.MultiplayerLevel)


func _on_area_2d_area_entered(area):
	print(area)
