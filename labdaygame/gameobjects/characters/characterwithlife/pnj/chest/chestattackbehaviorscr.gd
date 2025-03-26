extends "res://gameobjects/characters/characterwithlife/behaviorattackpar.gd"
var itempath : String = ""
@export	var chestcharacter : chestcharacterclass 
func oninteract(isopened : bool )->void:
		super.oninteract(isopened)
		if isopened==false:
	
	
			print("COFFRE OUVERT"+str(charactermovementvar.sprite_2d[0].frame_coords.x))
				
				#charactermovementvar.sprite_2d[0].frame_coords.x=1
			#Gamemanager.savesystem.load_game()
			#Gamemanager.equipmentmanager.inventoryvar.append("0"+chestcharacter.itempath)
			#Gamemanager.savesystem.save_game()
			Gamemanager.savesystem.inventoryvar.append("0"+chestcharacter.itempath)
			Gamemanager.savesystem.save_game()
			#
			Gamemanager.refreshinventory()
		
	#return Gamemanager.inventoryvar[Gamemanager.inventoryvar.size()-1].itemname

func getitemtext(isopened : bool )->String:
	super.getitemtext(isopened)
	
	return Gamemanager.inventoryvar[Gamemanager.inventoryvar.size()-1].itemname
func _ready() -> void:
	super._ready()
	isanimated=false
	
	
func onhaveinteracted()->void:
	super.onhaveinteracted()
	charactermovementvar.animatedspritevar.set_sprite_index(1,0)
	
