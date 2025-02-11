extends Node
var gmtest : int = 0
var playerposition : Vector2
var decalagex : float = 10
var decalagey : float = -5
var playerlife : int
var playermovementvar : charactermovementclass
var objectspawnervar : objectspawnerclass
var playerdirection : int
var doorindex : int
var heartbarvar : heartbar #res://system/ui/receptacle_bar/receptacle_bar.gd
var equipmentlist : Array[String]
var equipmentlistingame : Array[equipmentclass] 
#var weaponvar : weaponclass
#var beginposition : Vector2 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gmtest=19
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func beginlocationvoid() ->void:
	pass
	#playermovementvar.beginlocationvoid()
