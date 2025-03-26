extends "res://gameobjects/items/equipement/equipmentparscr.gd"

func _ready() -> void:
	super._ready()
	setequipmenttype(5)
	
func beginitem():
	super.beginitem()
	imagepath = "res://Ninja Adventure - Asset Pack/Ui/Icon/Items&Weapon/Amulet"
