extends Node
class_name savesystemclass

const SAVE_FILE_PATH = "user://savegame.json"

var my_int: int = 42
var my_int_list: Array = [1, 2, 3, 4, 5]
var my_string_list: Array = ["apple", "banana", "cherry"]
var activateonceindex : Array = []
var inventoryvar : Array = []

@export var inventoryvar2 : Array[String]

func save_game():
	var save_data = {
		"my_int": my_int,
		"my_int_list": my_int_list,
		"my_string_list": my_string_list,
		"activateonceindex":activateonceindex,
		"inventoryvar":inventoryvar
	}
	
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data, "\t"))  # Format JSON lisible
		file.close()
		print("Sauvegarde réussie !")
	else:
		print("Erreur lors de l'ouverture du fichier de sauvegarde.")

func load_game():
	if not FileAccess.file_exists(SAVE_FILE_PATH):
		print("Aucune sauvegarde trouvée.")
		return
	
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
	if file:
		var content = file.get_as_text()
		file.close()
		
		var json = JSON.new()
		var parse_result = json.parse(content)
		
		if parse_result == OK:
			var data = json.data
			my_int = data.get("my_int", 0)
			my_int_list = data.get("my_int_list", [])
			my_string_list = data.get("my_string_list", [])
			activateonceindex=data.get("activateonceindex", [])
			inventoryvar=data.get("inventoryvar", [])
			
			print("Chargement réussi !")
		else:
			print("Erreur lors du parsing JSON.")
	else:
		print("Erreur lors de l'ouverture du fichier de sauvegarde.")

func _ready():
	Gamemanager.savesystem=self
	#erase_save()
	load_game()
	call_deferred("_ready2")
	
	'''
	save_game()
	
	'''

func _ready2() -> void:
	#Gamemanager.equipmentmanager.inventoryvar=["oui"]
	
	print("oui"+str(inventoryvar))
	load_game()
	
	if inventoryvar.size()==0:
		inventoryvar=inventoryvar2
	
	save_game()
	
	#inventoryvar=inventoryvar2
	#Gamemanager.refreshinventory()

func erase_save():
	if FileAccess.file_exists(SAVE_FILE_PATH):
		var err = DirAccess.remove_absolute(SAVE_FILE_PATH)
		if err == OK:
			print("Sauvegarde supprimée avec succès.")
		else:
			print("Erreur lors de la suppression de la sauvegarde.")
	else:
		print("Aucune sauvegarde à supprimer.")
	
