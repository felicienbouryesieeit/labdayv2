extends Node2D

class_name objectspawnerclass
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Gamemanager.objectspawnervar=self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawn(spawnvar) ->void:
	print("pinata")
	add_child(spawnvar)
