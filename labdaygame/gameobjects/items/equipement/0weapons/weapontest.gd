extends "res://gameobjects/items/equipement/0weapons/weaponparscr.gd"

func _ready() -> void:
	super._ready()
	setstats(0,0,0,0,0,0)
	
func onattack()->void:
	super.onattack()
	Gamemanager.playermovementvar.attackbehaviorvar.spawnprojectilecharacterstats(Gamemanager.playermovementvar.attackbehaviorvar.playershootdirection.angle() * (180 / PI))
	#
