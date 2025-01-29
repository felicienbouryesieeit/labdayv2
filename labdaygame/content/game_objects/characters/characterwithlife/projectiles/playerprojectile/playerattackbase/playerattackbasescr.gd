extends "res://content/game_objects/characters/characterwithlife/projectiles/projectilebehaviorpar.gd"






func beginbehavior() -> void:
	super.beginbehavior()
	#damagevar.rotationvarbegin=0
	damagevar.rotateprojectile()
	print("goty: "+str(damagevar))

func processbehavior() -> void:
	super.processbehavior()
	damagevar.moveforward()
	
