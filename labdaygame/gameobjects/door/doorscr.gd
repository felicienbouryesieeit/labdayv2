extends Node2D
#@export var location : String
@export var location2 = "res://game_scene2.tscn"
@export var timervar = Timer
var global_position2 : Vector2
var direction : int = 0
var distancetodoor : float = 30
@export var doorindex : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Gamemanager.doorindex==doorindex :
		call_deferred("setplayerposition2")
		#pass

func setplayerposition2() -> void :
	print("danslaporte")
	global_position2 = global_position
	
	match Gamemanager.playerdirection:
		0:
			#global_position2.x+=distancetodoor
			global_position2.y+=distancetodoor
		1:
			#global_position2.x+=distancetodoor
			global_position2.y-=distancetodoor
		2:
			global_position2.x-=distancetodoor
		3:
			#global_position2.y-=distancetodoor
			global_position2.x+=distancetodoor
	
	
	
	
	
	
	
	
	#Gamemanager.beginposition=global_position2
	call_deferred("setplayerposition")

	


func setplayerposition() -> void :
	Gamemanager.playermovementvar.global_position=global_position2
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	print("direction: "+str(Gamemanager.playermovementvar.animation_direction2) )
	Gamemanager.playerdirection = Gamemanager.playermovementvar.animation_direction2
	Gamemanager.doorindex = doorindex
	get_tree().change_scene_to_file(location2)
	 # Replace with function body.
