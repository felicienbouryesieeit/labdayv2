extends Node
class_name equipmentmanagervar

var charactermovementvar : charactermovementclass
"""
var mon_script = preload("res://gameobjects/items/itemparscr.gd")
#var equipmentarray = Array[equipmentclass]

"""

@export var equipmentlist2 : Array[String]
#var currenti:int=0



func _ready():
	pass
	#0 arme
	#1 casque
	#2 bottes
	#3 armure
	#4 bague 
	#5 amulette

	
	
	
	
	
	# Créer un nouveau noeud (par exemple, un Node)
	
func beginequipment():
		call_deferred("beginequipment2")
		#(i)
func beginequipment2():
	for i in range(equipmentlist2.size()):
		Gamemanager.equipmentlist.append(equipmentlist2[i])
		spawnequipment(i)
func spawnequipment(i : int):
	print("sigma sigma boy bis"+str(i))
	if Gamemanager.equipmentlist[i]!="":
	#	pass
		var item_directory = "res://gameobjects/items/itemobject.tscn"

		var item = load(item_directory)
		var item2 = item.instantiate()
		item2.item_directory=Gamemanager.equipmentlist[i]
		
		Gamemanager.objectspawnervar.spawn.call_deferred(item2)
		#mon_noeud.script.charactervar=self
	
func onattack():
	print("attaque!")
	pass
