extends  "res://gameobjects/characters/characterwithlife/projectiles/projectilebehaviorpar.gd"





func beginbehavior() -> void:
	super.beginbehavior()
	var distance= (Gamemanager.playerposition - damagevar.global_position).normalized()
	
	var angle2 = distance.angle()
	
	#damagevar.rotation= (Gamemanager.playerposition - damagevar.global_position).normalized()
	damagevar.rotation=angle2
	damagevar.rotationvarbegin=angle2 * (180 / PI)
	damagevar.rotateprojectile()

func processbehavior() -> void:
	super.processbehavior()
	damagevar.moveforward()
	
