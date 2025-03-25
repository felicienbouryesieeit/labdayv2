extends Node2D
class_name itemclass2

#var isactivacted : bool = false;
# Called when the node enters the scene tree for the first time.
var itemholdervar : itemholderclass
var imagepath : String = "res://Ninja Adventure - Asset Pack/Ui/Icon/Spell/OrbFire.png"
var itemdescription : String = "it's an item"
var itemname : String = "item"
var allothervar = "res://dialogue/allother.txt"
var nameindex : int = 0
var descriptionindex : int = 0

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
	call_deferred("begindescription")
	
func begindescription():
	
	itemholdervar.itemdescription=statdescription()+get_txt_line(descriptionindex)
	itemholdervar.itemname=get_txt_line(nameindex)#itemname
	
	
func get_txt_line(index : int) ->String : 
	var file = FileAccess.open(allothervar,FileAccess.READ)
	var index2 = 0
	var filetext = ""
	var filetext2 = ""
	var namepath : String = "res://Ninja Adventure - Asset Pack/Actor/Characters/Princess/Faceset.png"
	while not file.eof_reached():
		filetext =file.get_line()
		if index2==index:
			filetext2=filetext
		index2+=1
	return filetext2
	
func statdescription()-> String:
	var statdescriptionvar : String = ""
	return statdescriptionvar
	

	
