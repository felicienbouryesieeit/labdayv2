extends Node

class_name animatedspriteclass

@export var timervar : Timer

var animation_direction2 : int = 0
var animation_frame : int = 0
var sprite_2d : Array[Sprite2D]
var animation_state_bool : bool = false
var charactermovementvar : charactermovementclass

var xlist : Array[int]
var ylist : Array[int]
var durationlist : Array[float]
var animationlistindex : int
var walkduration : float = 0.15

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	


	timervar.start(0.15)  # Démarre le Timer pour 2 secondes
	timervar.timeout.connect(animationframefunc)  # Connecte le signal timeout

func animationlist(xlist2 : Array[int],ylist2 : Array[int],durationlist2 : Array[float] ) -> void:
	animationlistindex=0
	xlist=xlist2
	ylist=ylist2
	durationlist=durationlist2

func animationframefunc() -> void:
	#print("Fonction appelée après 2 secondes")
	if charactermovementvar.iswalkinganim : 
		if animation_frame==3:
			animation_frame=0
		else :
			animation_frame+=1
		timervar.start(walkduration) 
	else : 
		set_sprite_index(xlist[animationlistindex],xlist[animationlistindex])
		animationlistindex+=1
		
		timervar.start(durationlist[animationlistindex])  # Démarre le Timer pour 2 secondes
	timervar.timeout.connect(animationframefunc)
	






func update_sprite_direction(animation_direction3 : int) -> void:
	
	#print("youpiland"+str(sprite_2d.size()))
	
	#update_sprite2(sprite_2d,animation_direction2,true)
	
	if charactermovementvar.iswalkinganim : 
		change_sprite(true,animation_direction3)

	#animation_state_bool = ismoving
	#velocity.length()>0
	
func update_sprite(ismoving : bool) -> void:
	if charactermovementvar.iswalkinganim : 
		if ismoving == false :
			pass
			change_sprite(false,0)
			
			#change_sprite(true,0)
			#change_sprite(false,6)
				
		else : 
			
			change_sprite(false,animation_frame) #animation_frame

func set_sprite_index(x : int, y : int) -> void:
	change_sprite(true,x)
	change_sprite(false,y)
	
func change_sprite(isx : bool,current_frame : int) -> void:
	if charactermovementvar.iswalkinganim : 
		for i in range(sprite_2d.size()):
			if isx :
				sprite_2d[i].frame_coords.x=current_frame
			else :
				sprite_2d[i].frame_coords.y=current_frame
