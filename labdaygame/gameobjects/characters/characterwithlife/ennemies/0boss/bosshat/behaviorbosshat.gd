extends "res://gameobjects/characters/characterwithlife/behaviorattackpar.gd"

@export var hatsprite : Sprite2D
var speedboost = 2
func _ready() -> void:
	super._ready()
	typeofenemy=1
	bosspatternint=2
	lastattack=1
	
func beginattackbehavior() -> void:
	super.beginattackbehavior()
	changecolor2()


func bosspattern(currentattack : int) ->void:
	super.bosspattern(currentattack)
	
	
	
	
	#charactermovementvar.iswalkinganim=true
	
	
	charactermovementvar.iswalkinganim=false
	#charactermovementvar.ismovinganim=false
	#charactermovementvar.ismovinganimdirection=false
	charactermovementvar.behaviorvar.enemymovementint=0
			#charactermovementvar.animatedspritevar.set_sprite_index(1,6)
	charactermovementvar.animatedspritevar.animationlist([1,0],[6,6],[1,0.02])
			
	"""
	match currentattack :
		0:
			charactermovementvar.behaviorvar.enemymovementint=1
			spawnprojectile()
			cadence=0.1
			
			
			timerattack.timeout.disconnect(timerattackvoid) 
			timerattack.start(cadence)  # Démarre le Timer pour 2 secondes
			timerattack.timeout.connect(timerattackvoid)
	
		1:
			charactermovementvar.iswalkinganim=false
			charactermovementvar.ismovinganim=false
			charactermovementvar.ismovinganimdirection=false
			charactermovementvar.behaviorvar.enemymovementint=0
			#charactermovementvar.animatedspritevar.set_sprite_index(1,6)
			charactermovementvar.animatedspritevar.animationlist([1,0],[6,6],[0.1,0.1])
			
			#charactermovementvar.animatedspritevar.update_sprite_direction(0)
			
			#spawnprojectile()
			cadence=1
		2:
			charactermovementvar.behaviorvar.enemymovementint=1
			spawnprojectile()
			cadence=0.1
			
			timerattack.timeout.disconnect(timerattackvoid) 
			timerattack.start(cadence)  # Démarre le Timer pour 2 secondes
			timerattack.timeout.connect(timerattackvoid)
	"""
func onanimationend(currentframe : int) ->void:
	super.onanimationend(currentframe)
	
	
	if currentframe==-1 :
		#timerattack.stop()
		timerattack.timeout.disconnect(timerattackvoid) 
		changecolor()
		#timerattack.start(0.1) 
		#timerattack.timeout.connect(changecolor)

		

func changecolor2() ->void : 
	match lastattack:
		0:charactermovementvar.sprite_2d[1].modulate = Color(1, 1, 0)
		1:charactermovementvar.sprite_2d[1].modulate = Color(1, 0, 0)
		2:charactermovementvar.sprite_2d[1].modulate = Color(0.4, 1, 1)
	
func changecolor() ->void : 
	changecolor2()
	#spawnprojectile()
	
	
	
	timerattack.timeout.disconnect(changecolor) 
	timerattack.start(0.4)  
	timerattack.timeout.connect(aftercolorchange)
	
func aftercolorchange() ->void :
	charactermovementvar.iswalkinganim=true
	charactermovementvar.behaviorvar.enemymovementint=1
	timerattack.timeout.disconnect(aftercolorchange)
	
	charactermovementvar.movement_speed=70
	match lastattack:
		
		0:
			
			
			attackseriebegin(3,1)
			print("zubzub") 
		1:
			
			
			attackseriebegin(3,0.5)
			print("zubzub") 
		2:
			attackseriebegin(3,1)
			print("zubzub") 

		
func currentattackserie() ->void:
	super.currentattackserie()
	#spawnprojectilecircle(0,5,10,100,100)
	#spawnprojectilecircleaimplayer(5,10,100,100)
	#spawnprojectileshotgunaimplayer(5,4,10,100,100)
	#spawnprojectileaimplayer(1,100,100)
	var speed1=160
	var speed2=speed1*1.2
	match lastattack:
		0:
			charactermovementvar.movement_speed+=7
			spawnprojectilecircle(0,8,10,speed1,speed1)
			#spawnprojectileshotgunaimplayer(7,4,10,speed1,speed1)
		1:
			
			spawnprojectileshotgunaimplayer(15,5,10,speed2,speed2)
		2:
			var angle:float=0
			if attackserieint%2==0 :
				angle=15
			spawnprojectilecircle(angle,12,10,speed1,speed1)
	
	
	
func endattackserie() ->void:
	super.endattackserie()
	timerattack.start(1.0)  # Démarre le Timer pour 2 secondes
	timerattack.timeout.connect(timerattackvoid)
	
	
	
