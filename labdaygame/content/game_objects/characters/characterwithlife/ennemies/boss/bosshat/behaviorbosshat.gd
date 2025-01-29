extends "res://gameobjects/characters/characterwithlife/behaviorattackpar.gd"


func _ready() -> void:
	super._ready()
	typeofenemy=1
	bosspatternint=2


func bosspattern(currentattack : int) ->void:
	super.bosspattern(currentattack)
	
	
			
	charactermovementvar.iswalkinganim=true
	
	match currentattack :
		0:
			charactermovementvar.behaviorvar.enemymovementint=1
			spawnprojectile()
			cadence=0.1
		1:
			charactermovementvar.iswalkinganim=false
			charactermovementvar.ismovinganim=false
			charactermovementvar.ismovinganimdirection=false
			charactermovementvar.behaviorvar.enemymovementint=0
			charactermovementvar.animatedspritevar.set_sprite_index(1,6)
			
			#charactermovementvar.animatedspritevar.update_sprite_direction(0)
			
			spawnprojectile()
			cadence=1
		2:
			charactermovementvar.behaviorvar.enemymovementint=1
			spawnprojectile()
			cadence=0.1
	
	timerattack.start(cadence)  # Démarre le Timer pour 2 secondes
	timerattack.timeout.connect(timerattackvoid)
	
func kolantess() -> void :
	print("pipi")
	#charactermovementvar.animatedspritevar.set_sprite_index(0,6)
