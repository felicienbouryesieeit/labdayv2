extends Node2D
class_name itemclass2

#var isactivacted : bool = false;
# Called when the node enters the scene tree for the first time.
var itemholdervar : itemholderclass
var imagepath : String = "res://Ninja Adventure - Asset Pack/Ui/Icon/Spell/OrbFire.png"
func _ready() -> void:
	
	print("jeremy")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func beginitem():
	
	pass
	
func beginitem2(itemholdervar2 : itemholderclass):
	itemholdervar=itemholdervar2
	itemholdervar.iconpath=imagepath
	
	

	
