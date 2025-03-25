extends "res://gameobjects/items/equipement/equipmentparscr.gd"
 #class_name weaponclass

func _ready() -> void:
	super._ready()
	setequipmenttype(0)
	nameindex=0
	descriptionindex=1
	
	
func onattack()->void:
	#super.onattack()
	print("attaque zer")
	
func beginitem():
	super.beginitem()
	imagepath = "res://Ninja Adventure - Asset Pack/Ui/Icon/Spell/AttackUpgrade"
				#res://Ninja Adventure - Asset Pack/Ui/Icon/Spell/AttackUpgradeDisabled.png
