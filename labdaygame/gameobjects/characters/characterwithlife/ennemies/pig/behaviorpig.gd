extends "res://gameobjects/characters/characterwithlife/behaviorattackpar.gd"


func beginattackbehavior() -> void:
	super.beginattackbehavior()
	charactermovementvar.behaviorvar.enemymovementint=1
	invisibleprojectile=true

func spawnprojectile() ->void:
	super.spawnprojectile()
	spawnprojectileaimplayer(0.15,150,150)
	
	#spawnprojectilecircle(0,4,10,160,160)
