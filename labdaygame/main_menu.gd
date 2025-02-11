extends Control

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://game_scene.tscn")


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://option_menu.tscn")

func _on_button_4_pressed() -> void:
	get_tree().quit()
