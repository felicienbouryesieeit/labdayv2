extends "res://gameobjects/characters/characterwithlife/behaviorattackpar.gd"


func beginattackbehavior() -> void:
	super.beginattackbehavior()
	charactermovementvar.behaviorvar.enemymovementint=1
	

func spawnprojectile() ->void:
	super.spawnprojectile()
	spawnprojectileaimplayer(10,150,150)
	
	#spawnprojectilecircle(0,4,10,160,160)
