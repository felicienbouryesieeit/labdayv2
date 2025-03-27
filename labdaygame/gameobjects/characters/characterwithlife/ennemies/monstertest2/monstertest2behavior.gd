extends "res://gameobjects/characters/characterwithlife/behaviorattackpar.gd"


func beginattackbehavior() -> void:
	super.beginattackbehavior()
	charactermovementvar.behaviorvar.enemymovementint=1
	

func spawnprojectile() ->void:
	super.spawnprojectile()
	#spawnprojectileaimplayer(10,150,150)
	
	spawnprojectilecircle(45,4,0.6,150,150)
