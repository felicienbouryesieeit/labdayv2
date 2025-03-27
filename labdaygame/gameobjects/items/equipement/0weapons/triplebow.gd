extends "res://gameobjects/items/equipement/0weapons/weaponparscr.gd"

func _ready() -> void:
	super._ready()
	setstats(0,0,0,0,0,0)
	
func onattack()->void:
	super.onattack()
	Gamemanager.playermovementvar.attackbehaviorvar.spawnprojectileshotgun(30,Gamemanager.playermovementvar.attackbehaviorvar.playershootdirection.angle() * (180 / PI),3,Gamemanager.playermovementvar.attackbehaviorvar.range,Gamemanager.playermovementvar.attackbehaviorvar.shotspeedmax,Gamemanager.playermovementvar.attackbehaviorvar.shotspeedmax)
	
	
	#
