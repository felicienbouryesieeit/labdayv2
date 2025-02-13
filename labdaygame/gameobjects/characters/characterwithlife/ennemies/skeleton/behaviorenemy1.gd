extends "res://gameobjects/characters/behaviorpar.gd"

var stopdistance : float = 22;
	
func setbehavior() -> void:
	super.setbehavior()
	match enemymovementint :
		0 : behaviordirection= Vector2(0,0)
		1 : behaviordirection= followplayer()
	
	#

func _ready() -> void:
	super._ready()
	#singleattack=true
	
	
func followplayer():
	var behaviordirection2 : Vector2 = Vector2(0,0)
	behaviordirection2= (Gamemanager.playerposition - actorposition).normalized()
	var distancetoplayer : float = Gamemanager.playerposition.distance_to( actorposition)
	if distancetoplayer<stopdistance:
		behaviordirection2 = Vector2(0,0)
	#print("ang"+str(distancetoplayer))
	return behaviordirection2
	
func timermovementvoid() -> void :
	super.timermovementvoid()
	#print("bouge"+str(timermovement))
	
	
	
#func timerattackvoid() -> void :
	#super.timerattackvoid()
	
	
	
	
func beginbehavior() ->void:
	super.beginbehavior()
