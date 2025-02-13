extends Control

signal close_inventory

func _ready():
	$ChooseItem/CloseButton.pressed.connect(_on_CloseButton_pressed)

func _on_CloseButton_pressed():
	visible = false
	
	emit_signal("close_inventory")
