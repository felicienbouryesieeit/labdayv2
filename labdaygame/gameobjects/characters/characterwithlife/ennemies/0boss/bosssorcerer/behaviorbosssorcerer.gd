extends "res://gameobjects/characters/characterwithlife/behaviorattackpar.gd"

func beginattackbehavior() -> void:
	super.beginattackbehavior()
	projectile_directory = "res://gameobjects/characters/characterwithlife/projectiles/projectileinfini.tscn"
	charactermovementvar.behaviorvar.enemymovementint=1
	spawnchildprojectile(0,0.1,0,0)
