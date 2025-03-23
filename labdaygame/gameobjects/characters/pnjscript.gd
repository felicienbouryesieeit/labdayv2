extends "res://gameobjects/interactable/interactpar.gd"
var isopened : bool = false;
@export var havedialogbox : bool;

func oninteract() ->void :
	super.oninteract()
	if havedialogbox : 
		print("night in the wood")
		if isopened == false : 
			isopened=true
			Gamemanager.dialogueboxvar.showtext()
			Gamemanager.dialogueboxvar.open()
		else:
			isopened=false
			Gamemanager.dialogueboxvar.close()
