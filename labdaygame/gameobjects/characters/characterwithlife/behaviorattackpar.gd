extends Node
class_name behaviorattackclass

var typeofenemy: int
var timerattack: Timer
var bosspatternint: int
var lastattack: int = -1

var charactermovementvar : charactermovementclass

@export var projectile_directory = "res://gameobjects/characters/characterwithlife/projectiles/playerprojectile/playerattackbase/playerattackbaseobject.tscn"

@export var range : float = 1
@export var cadence : float = 1

var projectile = load(projectile_directory)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	projectile = load(projectile_directory)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func beginattackbehavior() -> void:
	startattackloop()
	
	


func randombossattack() -> void :
	var randomattackint = RandomNumberGenerator.new().randi_range(0, bosspatternint)#int(rand_range(0, bosspatternint))
	print("gaspard")
	if lastattack== randomattackint:
		randombossattack()
	else :
		lastattack= randomattackint
	#return randomattackint
func timerattackvoid() -> void :
	print("epee")
	match typeofenemy :
		0:
			
			timerattack.one_shot=true;
			timerattack.start(cadence)  # Démarre le Timer pour 2 secondes
			timerattack.timeout.connect(timerattackvoid)
			spawnprojectile()
				
				#pass
		1:
			#bosspatternint
			
			print("cocoma: "+str(lastattack))
			randombossattack()
			bosspattern(lastattack)
			"""
			timerattack.start(cadence)  # Démarre le Timer pour 2 secondes
			timerattack.timeout.connect(timerattackvoid)
			"""
		2:
			print("Le nombre est 2")
		3:
			print("Le nombre est 3")
		_:
			print("Valeur par défaut")  # Équivalent du "default" dans un switch
			
			
	#if typeofenemy==0 :

func bosspattern(currentattack : int) ->void:
	pass
			
	
	
	

func startattackloop() ->void:
	#singleattack=true
	timerattack.one_shot=false;
	if typeofenemy==1 :
		timerattack.one_shot=true;
	timerattack.start(cadence)  # Démarre le Timer pour 2 secondes
	timerattack.timeout.connect(timerattackvoid)
	






func spawnprojectileangle(angle3 : float) ->void:
	var projectile2 = projectile.instantiate()
	projectile2.spawnposition=charactermovementvar.position
	projectile2.charactermovementvar=charactermovementvar
	projectile2.rotationvar = angle3 #charactermovementvar.character_rotation
	projectile2.behaviorattackvar=self
	projectile2.attackrange=range
	#projectile2.rotationvar =90
	#damagevar.rotationvarbegin=0
		#fleche2.spawnPos=actorposition
	
	charactermovementvar.main2.add_child.call_deferred(projectile2)




func spawnprojectile() ->void:
	spawnprojectileangle(charactermovementvar.character_rotation)




func setattackbehavior() ->void:
	pass
