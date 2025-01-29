extends Node
class_name behaviorclass

var behaviordirection : Vector2
var actorposition : Vector2
var charactermovementvar : charactermovementclass
@export var enemymovementint : int

var timermovement: Timer







# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func setbehavior() -> void:
	#print("algerie")
	pass


func beginbehavior() ->void:
	timermovement=charactermovementvar.timermovement
	
	
	timermovement.start(1)  # Démarre le Timer pour 2 secondes
	timermovement.timeout.connect(timermovementvoid)
	
	

func timermovementvoid() -> void :
	
	pass
	
	

	
	
	
func spawnbaseprojectile() -> void : 
	#spawnprojectile()
	print("vladimir")
