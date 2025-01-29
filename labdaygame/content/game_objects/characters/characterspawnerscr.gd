extends Node2D

var fleche = preload("res://content/game_objects/characters/characterwithlife/player/characterplayer.tscn")

@export var pathstring : String
@onready var main2 = get_tree().get_root().get_node("game_scene")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#pass # Replace with function body.
	print("etats unis"+str(fleche))
	fleche = load(pathstring)
	var fleche2 = fleche.instantiate()
	fleche2.position=position
	#fleche2.charactermovementvar=self
	#fleche2.rotationvar = character_rotation
		#fleche2.spawnPos=actorposition
	
	main2.add_child.call_deferred(fleche2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
