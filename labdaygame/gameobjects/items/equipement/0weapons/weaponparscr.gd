extends "res://gameobjects/items/equipement/equipmentparscr.gd"
 #class_name weaponclass

func _ready() -> void:
	super._ready()
	setequipmenttype(0)
	
	
func onattack()->void:
	print("attaque zer")
