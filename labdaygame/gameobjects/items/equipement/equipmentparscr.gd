extends "res://gameobjects/items/itemparscr.gd"
class_name equipmentclass
var charactervar : charactermovementclass
var lifebonus : int = 0;
var speedbonus : float = 0;
var shotspeedbonus : float = 0;
var rangebonus : float = 0;
var strenghbonus : int = 0;
var defensebonus : int =0;
var cadencebonus : float =0;


func setstats(lifebonus2 : int,speedbonus2 : float,shotspeedbonus2 : float,rangebonus2 : float,strenghbonus2 : int,defensebonus2 : int,cadencebonus2 : float):
	lifebonus=lifebonus2
	speedbonus=speedbonus2
	shotspeedbonus=shotspeedbonus2
	rangebonus=rangebonus2
	strenghbonus=strenghbonus2
	defensebonus=defensebonus2
	cadencebonus = cadencebonus2


func onbegin():
	print("yoko")
	pass
	
func _ready() -> void:
	super._ready()
	
	call_deferred("setplayerstats")
	
func setequipmenttype(equipmentint : int)	-> void:
	var equipmentlistsize : int = 6
	
	if Gamemanager.equipmentlistingame.size()!=equipmentlistsize :
		Gamemanager.equipmentlistingame.resize(equipmentlistsize)
	
	Gamemanager.equipmentlistingame.insert(equipmentint,self)
	print("arceus"+str(Gamemanager.equipmentlistingame[0]))
	
func setplayerstats() -> void:
	Gamemanager.playermovementvar.attackbehaviorvar.equipmentaddmaxlife(lifebonus)
	
	Gamemanager.playermovementvar.movement_speed+=(30*speedbonus)
	
	Gamemanager.playermovementvar.attackbehaviorvar.range+=(rangebonus*0.3)
	
	var baseshotspeed : float =(shotspeedbonus*30)
	Gamemanager.playermovementvar.attackbehaviorvar.shotaccelerationmax+=(baseshotspeed)
	Gamemanager.playermovementvar.attackbehaviorvar.shotspeedmax+=(baseshotspeed)
	Gamemanager.playermovementvar.attackbehaviorvar.range=Gamemanager.playermovementvar.attackbehaviorvar.range*((1.0/((shotspeedbonus*0.15)+1)))
	
	Gamemanager.playermovementvar.attackbehaviorvar.strengh+=strenghbonus
	Gamemanager.playermovementvar.typeofcharactervar.defense+=defensebonus
	Gamemanager.playermovementvar.attackbehaviorvar.cadence-=(0.1*cadencebonus)
	
	
#func onattack()->void:
#	pass
