extends "res://gameobjects/items/equipement/0weapons/weaponparscr.gd"

func _ready() -> void:
	super._ready()
	setstats(0,0,0,0,2,0)
	
	nameindex=22
	descriptionindex=23
	
func onattack()->void:
	super.onattack()
	Gamemanager.playermovementvar.attackbehaviorvar.spawnprojectilecircle(0,4,0.6,150,150)
	
	
