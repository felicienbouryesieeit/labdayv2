extends Control

func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://option_menu.tscn")

func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
	
	
