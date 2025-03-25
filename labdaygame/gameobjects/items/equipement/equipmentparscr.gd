extends "res://gameobjects/items/itemparscr.gd"
class_name equipmentclass
var charactervar : charactermovementclass
var isequipped : bool 

var lifebonus : int = 0;
var speedbonus : float = 0;
var shotspeedbonus : float = 0;
var rangebonus : float = 0;
var strenghbonus : int = 0;
var defensebonus : int =0;
var candencebonus : float =0;


func setstats(lifebonus2 : int,speedbonus2 : float,shotspeedbonus2 : float,rangebonus2 : float,strenghbonus2 : int,defensebonus2 : int):
	lifebonus=lifebonus2
	speedbonus=speedbonus2
	shotspeedbonus=shotspeedbonus2
	rangebonus=rangebonus2
	strenghbonus=strenghbonus2
	defensebonus=defensebonus2
	setequipmentdescription()
	

func setequipmentdescription() -> void :
	statdescription()
func onbegin():
	print("yoko")
	pass
	
func _ready() -> void:
	super._ready()
	
	
	
func setequipmenttype(equipmentint : int)	-> void:
	var equipmentlistsize : int = 6
	
	
	if Gamemanager.equipmentlistingame.size()!=equipmentlistsize :
		Gamemanager.equipmentlistingame.resize(equipmentlistsize)
		
	if (isequipped==true) : 
		Gamemanager.equipmentlistingame.insert(equipmentint,self)
		print("arceus"+str(Gamemanager.equipmentlistingame[0]))
		call_deferred("setplayerstats")
	
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
		
	
func beginitem():
	super.beginitem()
	if isequipped==true:
		activateequipment()
		
		

func activateequipment()->void:
	print("lac")
	
#func onattack()->void:
#	pass
func beginitem2(itemholdervar2 : itemholderclass):
	super.beginitem2(itemholdervar2)
	itemholdervar=itemholdervar2
	#itemholdervar.iconpath=imagepath
	#itemholdervar.itemname=itemname
	
func statdescription()-> String:
	super.statdescription()
	var statdescriptionvar2=""#"oui "+str(lifebonus)+" "+str(speedbonus)+" "+str(rangebonus)+" "+str(strenghbonus)+" "+str(defensebonus)+" "+str(candencebonus)+" "
	statdescriptionvar2+=setdescription(lifebonus,4)
	statdescriptionvar2+=setdescription(speedbonus,5)
	statdescriptionvar2+=setdescription(rangebonus,6)
	statdescriptionvar2+=setdescription(strenghbonus,7)
	statdescriptionvar2+=setdescription(defensebonus,8)
	statdescriptionvar2+=setdescription(speedbonus,candencebonus)
	if statdescriptionvar2!="":
		statdescriptionvar2="( "+statdescriptionvar2+" ) "
	return statdescriptionvar2

func setdescription(currentstat : int,statnameindex : int)-> String:
	var statdescriptionvar3=""
	var plustext=""
	if currentstat>0:
		plustext="+"
	if currentstat!=0 :
		statdescriptionvar3 = get_txt_line(statnameindex)+": "+plustext+str(currentstat)+" "
	return statdescriptionvar3
