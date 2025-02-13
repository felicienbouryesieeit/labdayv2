extends "res://gameobjects/interactable/interactpar.gd"
var isopened : bool = false;
func oninteract() ->void :
	super.oninteract()
	print("night in the wood")
	if isopened == false : 
		isopened=true
		Gamemanager.dialogueboxvar.showtext()
		Gamemanager.dialogueboxvar.open()
	else:
		isopened=false
		Gamemanager.dialogueboxvar.close()
