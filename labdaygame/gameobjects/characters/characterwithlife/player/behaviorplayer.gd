extends "res://gameobjects/characters/behaviorpar.gd"

var playershootdirection
var playercanattack : bool
var isnotattacking : bool

func setbehavior() -> void:
	super.setbehavior()
	Gamemanager.playerposition = actorposition
	
	if Input.is_action_just_pressed("attack"):
		
		#print("alkpote")
		pass
		#charactermovementvar.spawnattack()
		#spawnbaseprojectile()

	behaviordirection=Input.get_vector("left","right","up","down")
	playershootdirection=Input.get_vector("leftshoot","rightshoot","upshoot","downshoot")
	
	isnotattacking = (playershootdirection.x==0 and playershootdirection.y==0)
	
	
	if (Input.is_action_just_pressed("rightshoot") or Input.is_action_just_pressed("leftshoot") or Input.is_action_just_pressed("upshoot") or Input.is_action_just_pressed("downshoot")):
		#spawnprojectileangle(playershootdirection.angle() * (180 / PI))
		pass
	#print("maroc: "+str(playershootdirection))
	
	if isnotattacking==false and playercanattack==true :
		playerattackvoid()
		#startattackloop()
		

func _ready() -> void:
	super._ready()
	#singleattack=true

		

func timerattackvoid() -> void :
	if isnotattacking==true  :
		playercanattack=true
	else :
		playerattackvoid()
		
		
func playerattackvoid() ->void :
	#spawnprojectileangle(playershootdirection.angle() * (180 / PI))
	playercanattack=false
		
		
		
func beginbehavior() ->void:
	super.beginbehavior()
	Gamemanager.playermovementvar=charactermovementvar
	Gamemanager.beginlocationvoid()
	
	charactermovementvar.animation_direction2=Gamemanager.playerdirection
	#print("zumb"+str(Gamemanager.charactermovementvar))
