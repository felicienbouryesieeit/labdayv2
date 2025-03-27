extends "res://gameobjects/interactable/interactpar.gd"
class_name interactablecharacter
var isopened : bool = false;
var npcindex : int = 0;
var alldialogsvar = "res://dialogue/alldialogs.txt"
var allnamesvar = "res://dialogue/allnames.txt"
var currentline=0;
var beginningline=0;
var endingline=0;
var itemname : String = "";
@export var activateonce=0;
var activateonceindex: int =-1;
@export var timervar : Timer;

@export var charactervar : charactermovementclass
@export var haveicon : bool



func oninteract() ->void :
		super.oninteract()
		iconsprite.visible=false
	
	
		print("coffre")
		if activateonce!=2:
			charactervar.attackbehaviorvar.oninteract(isopened)
		#itemname = "pardon"
		
		timervar.one_shot=true
		timervar.start(0.1)  # Démarre le Timer pour 2 secondes
		timervar.timeout.connect(oninteract2)
		
		
func oninteract2() ->void :
	itemname = charactervar.attackbehaviorvar.getitemtext(isopened)
	if isopened == false : 
			if activateonce!=2:
	
				if activateonce==1:
					Gamemanager.savesystem.load_game()
					Gamemanager.savesystem.activateonceindex.append(activateonceindex)
					print("activate once index :"+str(activateonceindex)+" lin gan gou"+str(Gamemanager.savesystem.activateonceindex.size()))
					activateoncefunc()
					Gamemanager.savesystem.save_game()
				currentline=0
				isopened=true
				
				
				setcurrentdialog()	
				setcurrentline()
				Gamemanager.dialogueboxvar.open()
			
	else:
			if currentline!=(endingline-beginningline-2) :
				currentline+=1
				setcurrentline()
			else:
				isopened=false
				Gamemanager.dialogueboxvar.close()
	
func setcurrentline() -> void:
	var file = FileAccess.open(alldialogsvar,FileAccess.READ)
	var filetext = null
	var filetext2 = null
	var i =0
	while not file.eof_reached():
		
		filetext =file.get_line()
		if i==currentline+beginningline+1:
			filetext2=filetext+" "+itemname
		print("night in the wood"+filetext)
		i+=1		
	file.close()
	
	var nameanddesc = setnameanddescription(filetext2)
	
	var currentlinestring = "doudou : "+str(filetext2) + " " + str(currentline)
	
	Gamemanager.dialogueboxvar.showtext(nameanddesc[0],setname(nameanddesc[1])[0],setname(nameanddesc[1])[1]) #
	#
	
	
	
func setcurrentdialog() -> void:
	var file = FileAccess.open(alldialogsvar,FileAccess.READ)
	var filetext = null
	var filetext2 = null
	var i =0
	var havefoundbaseindex : int = 0
	var baseindex : int = 0
	var lastindex : int = 0
	while not file.eof_reached():
		
		filetext = file.get_line()
		
		if havefoundbaseindex==0:
			var currentdialog2 = setcurrentdialog2(filetext,i,false) 
			if currentdialog2[0]==true:
				havefoundbaseindex=1
				baseindex=currentdialog2[1]
				beginningline=baseindex
				print("simplet"+str(baseindex)+" "+str(30))
		elif havefoundbaseindex==1:
			var currentdialog2 = setcurrentdialog2(filetext,i,true) 
			if currentdialog2[0]==true:
				havefoundbaseindex=2
				
				lastindex=currentdialog2[1]
				print("simplet bis"+str(lastindex))
				endingline=lastindex
		
				
		i+=1		
	file.close()
	#setcurrentdialog2(filetext)
	
	
	
func setname(index : int):
	var name : String = ""
	var file = FileAccess.open(allnamesvar,FileAccess.READ)
	var index2 = 0
	var filetext = null
	var namepath : String = "res://Ninja Adventure - Asset Pack/Actor/Characters/Princess/Faceset.png"
	if index!=0 :
		index=charactervar.npcnameindex
	while not file.eof_reached():
		filetext =file.get_line()
		if index2==index:
			name=filetext
		index2+=1
		
	
	if index==0 :
		namepath = "res://Ninja Adventure - Asset Pack/Actor/Characters/Princess/Faceset.png"
	else:
		namepath = "res://Ninja Adventure - Asset Pack/Actor/Characters/"+charactervar.npctileset+"/Faceset.png"
		'''
		1:namepath = "res://Ninja Adventure - Asset Pack/Actor/Characters/"+charactervar.npctileset+"/Faceset.png"
		2:namepath = "res://Ninja Adventure - Asset Pack/Actor/Characters/Princess/Faceset.png"
		3:namepath = "res://Ninja Adventure - Asset Pack/Actor/Characters/Princess/Faceset.png"
		'''
	return 	[name,namepath]
	
func setcurrentdialog2(textline : String,textlinenumber : int,havebeenfound : bool):
	var hastagbool = false
	var hastagint = -1
	var hastagstr = ""
	var textlinenumber2 : int = 2
	var hastagint2 : int = 0
	var isvalidindex : bool = false
		
	for i in range(textline.length()):
		var currentletter : String = textline[i]
		if havebeenfound==false:
			
			
			
			if hastagbool==true:
				hastagstr=hastagstr+currentletter
				
				hastagint=hastagstr.to_int()
				
			
			if currentletter=="#":
				
				if hastagbool==false:
					hastagbool=true
				else:
					hastagbool=false
					textlinenumber2=textlinenumber
					if hastagint==npcindex:
					#	if havebeenfound==false:
							isvalidindex=true
							hastagint2=textlinenumber
					
						
		else :
			if currentletter=="#":
				if hastagbool==false:
					hastagbool=true
					
					isvalidindex=true
					hastagint2=textlinenumber
				#print("young_jacob"+str(hastagint)+" enfant : "+str(hastagbool))
	return [isvalidindex,hastagint2]
		
			
			
	
func setnameanddescription(textline : String):
	var descriptionstr : String =""
	var dollarbool : bool = false
	
	var nameint : int = 0
	var namestr: String = ""
	
	
	
	for i in range(textline.length()):
		var currentletter : String = textline[i]
		
		
		
		if dollarbool==true:
			print("night a " + namestr)
			namestr = namestr+currentletter
			
		if currentletter=="$":
			if dollarbool==false:
				dollarbool=true
			else:
				dollarbool=false
		
		
			
		if dollarbool==false && currentletter!="$":
			descriptionstr = descriptionstr + currentletter
		print("night b " + descriptionstr)	
		nameint=namestr.to_int()
	return[descriptionstr,nameint]
func _ready() -> void:
	super._ready()
	
	npcindex=charactervar.npcindex
	call_deferred("beginsave")

func beginsave()->void:
	if activateonce!=0:
		activateonceindex = Gamemanager.activateonceindex
		
		print("chinois deter"+str(Gamemanager.savesystem.activateonceindex.size()))
		
		for i in range(Gamemanager.savesystem.activateonceindex.size()):  # De 0 à 4
			if Gamemanager.savesystem.activateonceindex[i]==activateonceindex:
				activateoncefunc()
	
		'''
		for currentindex in Gamemanager.savesystem.activateonceindex:
			pass
			
			if currentindex==activateonceindex:
				activateoncefunc()
		'''
		
		Gamemanager.activateonceindex+=1
		'''
		var isinlist:bool = false
		for interact in Gamemanager.savesystem.allinteractabledoonce:
			if interact==self:
				isinlist=true
		if isinlist==false:
			Gamemanager.savesystem.allinteractabledoonce.append(self)
		'''
	call_deferred("checklist")
	
	
func activateoncefunc()->void:
	charactervar.attackbehaviorvar.onhaveinteracted()
	activateonce=2
	
func checklist()->void:
	pass
	#print("soupcon "+str(Gamemanager.savesystem.allinteractabledoonce.size()))
	




func onplayercollisionenter():
	super.onplayercollisionenter()
	if haveicon==true:
		iconsprite.visible=true
	pass
	
func onplayercollisionexit():
	super.onplayercollisionexit()
	iconsprite.visible=false
	pass
