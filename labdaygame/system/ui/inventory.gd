extends Control
class_name inventory;
@export var itemlist : ItemList;
@export var descriptionvar : RichTextLabel
@export var namevar : RichTextLabel
@export var imagevar : Sprite2D
@export var timervar: Timer
@export var equipbutton : Button
#@export var imagevar2 : Sprite2D
signal close_inventory
var selected_item=-1

func _ready():
	$ChooseItem/CloseButton.pressed.connect(_on_CloseButton_pressed)
	$ChooseItem/CloseButton.pressed.connect(_on_CloseButton_pressed)
	#Gamemanager.inventoryvar=self
	call_deferred("_ready2")
	'''
	
	itemlist.set_item_icon(0,itemlist.get_item_icon(1))
	itemlist.item_count=0;
	#print("radio"+str(itemlist.item_count))
	'''
func _ready2():
	itemlist.item_count=0
	
	for i in range(Gamemanager.inventoryvar.size()):
		itemlist.add_item("",Gamemanager.inventoryvar[i].iconimage)
		#print(element)
	#print("open inventory")
	descriptionvar.text=""
	namevar.text=""
	imagevar.texture=load("res://Ninja Adventure - Asset Pack/Ui/Icon/Spell/Alchemy.png")
	
	
func _on_CloseButton_pressed():
	#itemlist.item_count-=1;
	visible = false
	close_inventoryvoid()
	
	
func setinventory():
	pass
	#print("ON EST 26")
	#itemlist.item_count=2;


func _on_item_list_item_selected(index: int) -> void:
	print("pouloulou"+str(index))
	selected_item=index
	for i in range(Gamemanager.inventoryvar.size()):
		if index==i : 
			imagevar.texture=Gamemanager.inventoryvar[i].iconimage
			descriptionvar.text=Gamemanager.inventoryvar[i].itemdescription
			namevar.text=Gamemanager.inventoryvar[i].itemname
			if Gamemanager.inventoryvar[i].isequipped:
				equipbutton.text="unequip"
			else :
				equipbutton.text="equip"
	if Gamemanager.inventoryvar[selected_item].itemscriptvar is equipmentclass : 
		var currentequipment : equipmentclass = Gamemanager.inventoryvar[selected_item].itemscriptvar
		if Gamemanager.equipmentlistingame[currentequipment.equipmenttype]!=null:
			pass
			#print("bomboclaat bis"+str(Gamemanager.equipmentlistingame[currentequipment.equipmenttype].itemholdervar.itemindex))
		
	pass # Replace with function body.


func _on_item_equipped_pressed() -> void:
	if selected_item!=-1 :
		if Gamemanager.inventoryvar[selected_item].itemscriptvar is equipmentclass : 
			var currentequipment : equipmentclass = Gamemanager.inventoryvar[selected_item].itemscriptvar
			if Gamemanager.equipmentlistingame[currentequipment.equipmenttype]!=null:
				
				if Gamemanager.equipmentlistingame[currentequipment.equipmenttype].itemholdervar.itemindex!=selected_item:
					print("bomboclaat bis"+str(Gamemanager.equipmentlistingame[currentequipment.equipmenttype].itemholdervar.itemindex))
					Gamemanager.savesystem.inventoryvar[Gamemanager.equipmentlistingame[currentequipment.equipmenttype].itemholdervar.itemindex][0]="0"
			print("bomboclaat"+str(currentequipment.equipmenttype))
			#str(Gamemanager.inventoryvar[selected_item])
			if Gamemanager.savesystem.inventoryvar[selected_item][0]=="0":
				Gamemanager.savesystem.inventoryvar[selected_item][0]="1"
			else :
				Gamemanager.savesystem.inventoryvar[selected_item][0]="0"
			close_inventoryvoid()
			Gamemanager.savesystem.save_game()
			Gamemanager.refreshinventory()
		
		
		
		timervar.one_shot=true
		timervar.start(0.1)  # Démarre le Timer pour 2 secondes
		timervar.timeout.connect(openbag)
		
func openbag():
	visible = false
	Gamemanager.openbag()
		
'''
	if selected_item!=-1 :
		close_inventoryvoid()
		Gamemanager.refreshinventory()
		Gamemanager.openbag()
		call_deferred("_ready2")
	'''
		
	

func close_inventoryvoid()->void:
	print("close inventory")
	
	
	emit_signal("close_inventory")
	
