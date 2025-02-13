extends Node


var item_directory = ""


func _ready() -> void:
	
	call_deferred("additemscript")


func additemscript() -> void:
	var mon_noeud = Node2D.new()
		
		# Attacher le script au noeud
		
	mon_noeud.script = load(item_directory)
	print("louis san"+str(mon_noeud.script))
		
		# Ajouter le noeud avec le script à la scène
	add_child(mon_noeud)
	#var item2 = item.instantiate()
	#Gamemanager.objectspawnervar.spawn.call_deferred(item2)
	
