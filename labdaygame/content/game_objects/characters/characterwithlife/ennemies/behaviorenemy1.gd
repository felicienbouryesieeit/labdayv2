extends "res://gameobjects/characters/behaviorpar.gd"


	
func setbehavior() -> void:
	super.setbehavior()
	match enemymovementint :
		0 : behaviordirection= Vector2(0,0)
		1 : behaviordirection= (Gamemanager.playerposition - actorposition).normalized()
	
	#

func _ready() -> void:
	super._ready()
	#singleattack=true
	
	
		

func timermovementvoid() -> void :
	super.timermovementvoid()
	#print("bouge"+str(timermovement))
	
	
	
#func timerattackvoid() -> void :
	#super.timerattackvoid()
	
	
	
	
func beginbehavior() ->void:
	super.beginbehavior()
