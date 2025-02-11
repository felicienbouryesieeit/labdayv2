extends "res://gameobjects/characters/characterwithlife/behaviorattackpar.gd"
var playershootdirection
var playercanattack : bool
var isnotattacking : bool
@export var timercooldowndamagevar : Timer

func setattackbehavior() -> void:
	super.setattackbehavior()
	#Gamemanager.playerposition = actorposition

	if Input.is_action_just_pressed("attack"):
		
		#print("alkpote")
		pass
		#charactermovementvar.spawnattack()
		#spawnbaseprojectile()

	#behaviordirection=Input.get_vector("left","right","up","down")
	playershootdirection=Input.get_vector("leftshoot","rightshoot","upshoot","downshoot")
	
	isnotattacking = (playershootdirection.x==0 and playershootdirection.y==0)
	
	
	
	if (Input.is_action_just_pressed("rightshoot") or Input.is_action_just_pressed("leftshoot") or Input.is_action_just_pressed("upshoot") or Input.is_action_just_pressed("downshoot")):
		#spawnprojectileangle(playershootdirection.angle() * (180 / PI))
		pass
	#print("maroc: "+str(playershootdirection))
	
	if isnotattacking==false and playercanattack==true :
		playerattackvoid()
		startattackloop()
		
func timerattackvoid() -> void :
	if isnotattacking==true  :
		playercanattack=true
	else :
		playerattackvoid()
		
		
func playerattackvoid() ->void :
	if Gamemanager.equipmentlistingame[0]!=null:
		Gamemanager.equipmentlistingame[0].onattack()
	
		playercanattack=false

func ondamage() ->void :
	super.ondamage()
	Gamemanager.heartbarvar.setlife(charactermovementvar.typeofcharactervar.life)
	charactermovementvar.typeofcharactervar.canbeattacked=false
	timercooldowndamagevar.one_shot=true;
	timercooldowndamagevar.start(1)  # Démarre le Timer pour 2 secondes
	timercooldowndamagevar.timeout.connect(aftercooldowndamage)


func aftercooldowndamage() ->void:
	charactermovementvar.typeofcharactervar.canbeattacked=true
	timercooldowndamagevar.timeout.disconnect(aftercooldowndamage)
	
func beginattackbehavior()->void :
	super.beginattackbehavior()
	equipmentsetmaxlife(charactermovementvar.typeofcharactervar.maxlife)
	
func equipmentsetmaxlife(maxlife : int)->void :
	#print("franchise"+str())
	charactermovementvar.typeofcharactervar.maxlife=maxlife
	charactermovementvar.typeofcharactervar.life=maxlife;
	Gamemanager.heartbarvar.setmaxlife(charactermovementvar.typeofcharactervar.maxlife)
	Gamemanager.heartbarvar.setlife(charactermovementvar.typeofcharactervar.life)
	
	
func equipmentaddmaxlife(maxlife : int)->void : 
	equipmentsetmaxlife(charactermovementvar.typeofcharactervar.maxlife+(maxlife*4))
	
