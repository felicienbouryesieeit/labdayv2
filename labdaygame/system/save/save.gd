extends Node2D
# Global.gd (autoload)
var a_parle_statue1 := false

func save_game():
	var save_data = {
		"a_parle_statue1": a_parle_statue1
	}

	var file = FileAccess.open("user://save_game.save", FileAccess.WRITE)
	file.store_string(JSON.stringify(save_data))
	file.close()

func load_game():
	if FileAccess.file_exists("user://save_game.save"):
		var file = FileAccess.open("user://save_game.save", FileAccess.READ)
		var content = file.get_as_text()
		file.close()

		var result = JSON.parse_string(content)
		if typeof(result) == TYPE_DICTIONARY:
			a_parle_statue1 = result.get("a_parle_statue1", false)
		else:
			print("Erreur : le fichier de sauvegarde est corrompu ou mal formaté.")
	else:
		print("Aucune sauvegarde trouvée.")
		
func _ready():
	load_game()
