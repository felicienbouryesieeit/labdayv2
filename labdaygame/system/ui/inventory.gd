extends Control
class_name inventory;
@export var itemlist : ItemList;
@export var descriptionvar : RichTextLabel
@export var namevar : RichTextLabel
@export var imagevar : Sprite2D
#@export var imagevar2 : Sprite2D
signal close_inventory

func _ready():
	$ChooseItem/CloseButton.pressed.connect(_on_CloseButton_pressed)
	$ChooseItem/CloseButton.pressed.connect(_on_CloseButton_pressed)
	#Gamemanager.inventoryvar=self
	itemlist.item_count=0
	
	for i in range(Gamemanager.inventoryvar.size()):
		itemlist.add_item("",Gamemanager.inventoryvar[i].iconimage)
		#print(element)
	#print("open inventory")
	descriptionvar.text=""
	namevar.text=""
	imagevar.texture=load("res://Ninja Adventure - Asset Pack/Ui/Icon/Spell/Alchemy.png")
	'''
	
	itemlist.set_item_icon(0,itemlist.get_item_icon(1))
	itemlist.item_count=0;
	#print("radio"+str(itemlist.item_count))
	'''
	
func _on_CloseButton_pressed():
	#itemlist.item_count-=1;
	print("close inventory")
	visible = false
	
	emit_signal("close_inventory")
	
	
func setinventory():
	pass
	#print("ON EST 26")
	#itemlist.item_count=2;


func _on_item_list_item_selected(index: int) -> void:
	print("pouloulou")
	for i in range(Gamemanager.inventoryvar.size()):
		if index==i : 
			imagevar.texture=Gamemanager.inventoryvar[i].iconimage
			descriptionvar.text=Gamemanager.inventoryvar[i].itemdescription
			namevar.text=Gamemanager.inventoryvar[i].itemname
	pass # Replace with function body.
