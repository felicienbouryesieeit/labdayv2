extends Node
class_name behaviorattackclass


var typeofenemy: int
var timerattack: Timer
var bosspatternint: int
var lastattack: int = -1

var attackserieint: int =0
var attackseriecadence: float=0
var attackseriemax: int=0
var invisibleprojectile : bool = false

var charactermovementvar : charactermovementclass

var isanimated : bool = true

@export var projectile_directory = "res://gameobjects/characters/characterwithlife/projectiles/playerprojectile/playerattackbase/playerattackbaseobject.tscn"

var projectile = load(projectile_directory)

@export var range : float = 0.5
@export var cadence : float = 1
@export var shotspeedmax : float = 100
@export var shotaccelerationmax : float = 100
@export var strengh : float = 2



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
	#print("epee")
	match typeofenemy :
		0:
			
			timerattack.one_shot=true;
			timerattack.start(cadence)  # Démarre le Timer pour 2 secondes
			timerattack.timeout.connect(timerattackvoid)
			spawnprojectile()
			
				
				#pass
		1:
			#bosspatternint
			
			print("zubata cocoma: "+str(lastattack))
			
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
	






func spawnprojectile2(angle3 : float,range2 : float,speedmax2 :float,acceleration2:float) ->void:
	var projectile2 = projectile.instantiate()
	projectile2.spawnposition.x=charactermovementvar.position.x+Gamemanager.decalagex
	projectile2.spawnposition.y=charactermovementvar.position.y+Gamemanager.decalagey
	
	projectile2.charactermovementvar=charactermovementvar
	projectile2.rotationvar = angle3 #charactermovementvar.character_rotation
	projectile2.behaviorattackvar=self
	projectile2.attackrange=range2
	projectile2.speedmax=speedmax2
	projectile2.acceleration=acceleration2
	projectile2.strengh=strengh
	projectile2.visible=!invisibleprojectile
	#projectile2.rotationvar =90
	#damagevar.rotationvarbegin=0
		#fleche2.spawnPos=actorposition
	print("toto"+str(Gamemanager))
	Gamemanager.objectspawnervar.spawn.call_deferred(projectile2)
	#add_child(projectile2)
	#charactermovementvar.main2.add_child.call_deferred(projectile2)

func spawnprojectilecharacterstats(angle3 : float) ->void:
	spawnprojectile2(angle3,range,shotspeedmax,shotaccelerationmax)


func spawnprojectile() ->void:
	pass
	
func spawnprojectilecharacterrotation(range2:float,speedmax2 :float,acceleration2:float) ->void:
	#var distance= (Gamemanager.playerposition - c.global_position).normalized()
	
	#var angle2 = distance.angle()
	
	
	spawnprojectile2(charactermovementvar.character_rotation,range2,speedmax2,acceleration2)


func spawnprojectileaimplayer(range2:float,speedmax2 :float,acceleration2:float)->void:
	var distance= (Gamemanager.playerposition - charactermovementvar.global_position).normalized()
	
	var angle2 = distance.angle()
	#print("tunic"+str(angle2 * (180 / PI)))
	spawnprojectile2((angle2 * (180 / PI)),range2,speedmax2,acceleration2)


func spawnprojectilecircle(angle: float,projectilenumber: int , range2:float,speedmax2 :float,acceleration2:float)->void:
	for i in range(projectilenumber):
		var indexfloat = float(i)
		indexfloat=(360/projectilenumber)*indexfloat
		print("zubibi"+str(indexfloat))
		spawnprojectile2((indexfloat+angle),range2,speedmax2,acceleration2)

func spawnprojectilecircleaimplayer(projectilenumber: int , range2:float,speedmax2 :float,acceleration2:float)->void:
	var distance= (Gamemanager.playerposition - charactermovementvar.global_position).normalized()
	
	var angle2 = distance.angle()
	spawnprojectilecircle((angle2 * (180 / PI)),projectilenumber,range2,speedmax2,acceleration2)

func spawnprojectileshotgunaimplayer(angle2: float,projectilenumber: int , range2:float,speedmax2 :float,acceleration2:float)->void:
	var distance= (Gamemanager.playerposition - charactermovementvar.global_position).normalized()
	
	var angle3 = distance.angle()
	spawnprojectileshotgun(angle2,(angle3 * (180 / PI)),projectilenumber,range2,speedmax2,acceleration2)

	
func spawnprojectileshotgun(angle2: float,angle: float,projectilenumber: int , range2:float,speedmax2 :float,acceleration2:float)->void:
	var angleb=angle
	var angle4=0
	var projectilemax=0
	for i in range(projectilenumber):
		
		
		
		var indexfloat = float(i)
		
		
		
		var canattack = true
		if i==0 :
			if projectilenumber%2==0 :
				canattack=false
				
		if i==1 :
			if projectilenumber%2==0 :
				indexfloat*=0.7
				
		var angle3=(angle+(angle2*indexfloat))#/((angle2*projectilenumber)/2)
		var angle5=(angle+(angle2*-indexfloat))
			
			
		if canattack==true :
			if projectilemax<projectilenumber :
				spawnprojectile2(angle5,range2,speedmax2,acceleration2)
				projectilemax+=1
				
				if i!=0 :
					
					projectilemax+=1
					spawnprojectile2(angle3,range2,speedmax2,acceleration2)
		
		
		

func setattackbehavior() ->void:
	
	pass


func onanimationend(currentframe : int) ->void:
	pass








func attackseriebegin(attackserieintmax2 : int,attackseriecadence2 : float) ->void:
	attackserieint=0
	attackseriecadence=attackseriecadence2
	attackseriemax=attackserieintmax2+1
	
	attackserie()
	#attackserieintmax,attackseriecadence

func ondamage() ->void:
	pass
	
func currentattackserie() ->void:
	pass
	
func endattackserie() ->void:
	pass
func attackserie() ->void:
	#attackserieintmax : int,attackseriecadence : float
	#print("zubzub bis bis"+str(attackserieint)+" "+str(attackserieintmax)) 
	if attackserieint!=0:
		currentattackserie()
	attackserieint+=1
	if attackserieint==attackseriemax:
		timerattack.timeout.disconnect(attackserie)
		endattackserie()
	else:
		timerattack.start(attackseriecadence)  # Démarre le Timer pour 2 secondes
		timerattack.timeout.connect(attackserie)
	
	

func oninteract(isopened : bool )->void:
	pass

func onhaveinteracted()->void:
	pass
	
func getitemtext(isopened : bool )->String:
	return ""
