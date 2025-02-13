extends Control
	
func _on_button_2_pressed() -> void:
	print("en cours de céation")

func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
