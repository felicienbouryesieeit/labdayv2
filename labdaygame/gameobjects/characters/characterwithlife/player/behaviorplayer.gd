extends "res://gameobjects/characters/behaviorpar.gd"

var playershootdirection
var playercanattack : bool
var isnotattacking : bool
@export var equipmentmanager : equipmentmanagervar
var isinteracting : bool
var interactvar : interactclass
@export var savesystem : savesystemclass

func setbehavior() -> void:
	super.setbehavior()
	Gamemanager.playerposition = actorposition
	Gamemanager.playerlife=charactermovementvar.typeofcharactervar.life
	
	if Input.is_action_just_pressed("attack"):
		
		#print("alkpote")
		pass
		#charactermovementvar.spawnattack()
		#spawnbaseprojectile()

	behaviordirection=Input.get_vector("move_left","move_right","move_up","move_down")
	playershootdirection=Input.get_vector("leftshoot","rightshoot","upshoot","downshoot")
	isinteracting=Input.is_action_just_pressed("interact");
	isnotattacking = (playershootdirection.x==0 and playershootdirection.y==0)
	
	#if interactvar!=null:
		#print("la chine 6"+str(interactvar))
	if isinteracting==true:
		savesystem.load_game()
		#savesystem.my_int_list.append(0)	
		#savesystem.inventoryvar.append("miaou")
		print("bougibouga"+str(savesystem.inventoryvar))
		#savesystem.save_game()
		#Gamemanager.savesystem.inventoryvar=Gamemanager.equipmentmanager.inventoryvar
		#Gamemanager.savesystem.save_game()
		if interactvar!=null:
			interactvar.oninteract()
			#print("arcane : "+str(interactvar)) #+str(interactvar)
		pass
	if (Input.is_action_just_pressed("rightshoot") or Input.is_action_just_pressed("leftshoot") or Input.is_action_just_pressed("upshoot") or Input.is_action_just_pressed("downshoot")):
		#spawnprojectileangle(playershootdirection.angle() * (180 / PI))
		pass
	#print("maroc: "+str(playershootdirection))
	
	if isnotattacking==false and playercanattack==true :
		playerattackvoid()
		#startattackloop()
		

func _ready() -> void:
	super._ready()
	isplayer = true
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
	equipmentmanager.beginequipment()
	beginplayer()
	#print("zumb"+str(Gamemanager.charactermovementvar))


func oninteractvar(interactvar : interactclass) -> void : 
	
	super.oninteractvar(interactvar)
	print("la chine 5 ")
	self.interactvar=interactvar

func onexitinteractvar(interactvar : interactclass) -> void : 
	
	super.onexitinteractvar(interactvar)
	
	self.interactvar=null

func beginplayer() ->void:
	pass
