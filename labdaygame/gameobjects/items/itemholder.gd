extends Node
class_name itemholderclass

var item_directory = ""
var isequipped : bool
var iconimage : Texture2D
var iconpath : String = "res://Ninja Adventure - Asset Pack/Ui/Icon/Items&Weapon/Money"
var itemname : String = "item nom"
var itemdescription : String = "c est un item"

func _ready() -> void:
	
	print("charle"+str(isequipped))
	call_deferred("additemscript")
	
	


func additemscript() -> void:
	var mon_noeud = Node2D.new()
		
		# Attacher le script au noeud
	
	mon_noeud.script = load(item_directory)
	print("louis san"+str(mon_noeud.script))
	
	if mon_noeud is itemclass2:
		
		if mon_noeud is equipmentclass:
			
			mon_noeud.isequipped=isequipped
		mon_noeud.beginitem()
		mon_noeud.beginitem2(self)
		# Ajouter le noeud avec le script à la scène
	add_child(mon_noeud)
	
	var disabledvar =""
	if mon_noeud.isequipped==false:
		disabledvar ="Disabled"
	iconimage = load(iconpath+disabledvar+".png")
	addtoinventory()
	#var item2 = item.instantiate()
	#Gamemanager.objectspawnervar.spawn.call_deferred(item2)
	







func addtoinventory()	-> void:
	
	Gamemanager.inventoryvar.append(self);
	print("inventaire taille : "+str(Gamemanager.inventoryvar.size()));
	'''
	if Gamemanager.equipmentlistingame.size()!=equipmentlistsize :
		Gamemanager.equipmentlistingame.resize(equipmentlistsize)
		
	if (isequipped==true) : 
		Gamemanager.equipmentlistingame.insert(equipmentint,self)
		print("arceus"+str(Gamemanager.equipmentlistingame[0]))
'''
