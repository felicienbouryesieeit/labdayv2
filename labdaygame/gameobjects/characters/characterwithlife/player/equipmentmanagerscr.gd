extends Node
class_name equipmentmanagervar

var charactermovementvar : charactermovementclass
@export var playerattackbehaviorvar : playerattackbehavior 
"""
var mon_script = preload("res://gameobjects/items/itemparscr.gd")
#var equipmentarray = Array[equipmentclass]

"""


@export var equipmentlist2 : Array[String]
@export var inventoryvar : Array[String]
#res://gameobjects/items/equipement/0weapons/weapontest.gd
#res://gameobjects/items/equipement/1helmet/ironhelmet.gd


	


func _ready():
	Gamemanager.equipmentmanager=self
	pass
	#0 arme
	#1 casque
	#2 bottes
	#3 armure
	#4 bague 
	#5 amulette

	
	
	
	
	
	# Créer un nouveau noeud (par exemple, un Node)
	
func beginequipment():
		#equip()
		
		print("inventaire : "+str(inventoryvar))
		call_deferred("beginequipment2")
		
		#(i)
func beginequipment2():
	playerattackbehaviorvar.resetplayerstats()
	#Gamemanager.savesystem.load_game()
	#Gamemanager.savesystem.inventoryvar=inventoryvar
	#Gamemanager.savesystem.save_game()
	spawnequipment()
func spawnequipment():
	for i in range(inventoryvar.size()):
		#if Gamemanager.equipmentlist[i]!="":
		#	pass
		var my_string = inventoryvar[i]
		print("grunt bis"+my_string[0])	#
		var isequipped = (my_string[0]=="1") #
		
	
		
		#my_string.erase(10,1)
		my_string = my_string.substr(1, my_string.length())
		print("grunt"+my_string+" "+str(isequipped))	#
			#equipmentlist2[0]=my_string
		
		var item_directory = "res://gameobjects/items/itemobject.tscn"
			
		var item = load(item_directory)
		var item2 = item.instantiate()
		item2.itemindex=i
		item2.item_directory=my_string#Gamemanager.equipmentlist[i]
		item2.isequipped=isequipped
		Gamemanager.objectspawnervar.spawn.call_deferred(item2)
		
		#mon_noeud.script.charactervar=self
	
func onattack():
	print("attaque!")
	pass
