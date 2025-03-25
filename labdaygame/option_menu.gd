extends Control

func _on_music_button_pressed() -> void:
	print("en cours de céation")
	
func _on_music_button_mouse_entered() -> void:
	$hover.play()

func _on_option_button_pressed() -> void:
	print("en cours de céation")
	
func _on_option_button_mouse_entered() -> void:
	$hover.play()

func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_return_button_mouse_entered() -> void:
	$hover.play()
