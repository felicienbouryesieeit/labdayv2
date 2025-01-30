extends Control
	
func _on_button_2_pressed() -> void:
	print("en cours de céation")

func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
	
func _on_volume_slider_value_changed(value: float):
	var audio_player = get_node("MusicPlayer")
	if audio_player:
		audio_player.set_custom_volume_db(value)
	else:
		print("Erreur : le noeud 'MusicPlayer' est introuvable.")
