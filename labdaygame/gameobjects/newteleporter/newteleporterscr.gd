extends Node2D
class_name newteleporterclass
@export var otherteleporter : newteleporterclass
@export var transitionvar : Teleporter
@export var samecreen : bool = false
@export var direction : int = 0
var canteleport = true
@export	var unlockableteleporter : int = 0
var unlockableteleporterindex : int = -1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if unlockableteleporter == 1:
		unlockableteleporterindex=Gamemanager.unlockableteleporterindex
		Gamemanager.unlockableteleporterindex+=1
	if otherteleporter!=null : 
		otherteleporter.otherteleporter=self
		otherteleporter.samecreen=samecreen
		if unlockableteleporter==1:
			#unlockableteleporterindex=Gamemanager.
			otherteleporter.unlockableteleporter=2
		match direction :
						0:
							pass
						1:
							otherteleporter.direction=2
						2:
							otherteleporter.direction=1
						3:
							otherteleporter.direction=4
						4:
							otherteleporter.direction=3
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func teleportdestination(base : float) -> float :
	var basesign = sign(base)
	var baseabs = abs(base)
	baseabs=baseabs*1.3
	base=baseabs*basesign
	return base

func _on_area_2d_body_entered(body: Node2D) -> void:
	if canteleport==true:
		#otherteleporter.canteleport=false	
		if body.has_method("isplayerfunc"):
			
			if body.isplayerfunc()==true :
				if unlockableteleporter==1:
					var isinindex : bool = false
					for i in range(Gamemanager.savesystem.unlockableteleporterlist.size()):
						if Gamemanager.savesystem.unlockableteleporterlist[i]==unlockableteleporterindex:
							isinindex=true
						if isinindex==false:
							Gamemanager.savesystem.unlockableteleporterlist.append(unlockableteleporterindex)
				var decalageY : float = Gamemanager.playermovementvar.global_position.y-global_position.y
				var decalageX : float = Gamemanager.playermovementvar.global_position.x-global_position.x
				
				decalageY = teleportdestination(decalageY)
				decalageX = teleportdestination(decalageX)
				
				print("gaga gougou ouaf ouaf Y : "+str(Gamemanager.playermovementvar.global_position.y-global_position.y))
				print("gaga gougou ouaf ouaf X : "+str(Gamemanager.playermovementvar.global_position.x-global_position.x))
				if otherteleporter!=null :
					if (samecreen==false) :
						Gamemanager.isteleporting=true
					Gamemanager.teleportervar.transition2()
					var distancetospawn=15
					var distancey=0
					var distancex=0
					match direction :
						0:
							pass
						1:
							distancey=1
						2:
							distancey=-1
						3:
							distancex=1
						4:
							distancex=-1
					#print("bouteille : "+str(distancey))
					Gamemanager.playermovementvar.global_position.y=otherteleporter.global_position.y+(distancey*distancetospawn)#-(decalageY*distancetospawn)
					Gamemanager.playermovementvar.global_position.x=otherteleporter.global_position.x+(distancex*distancetospawn)#S-(decalageX*distancetospawn)
			
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	if canteleport==false:
		otherteleporter.canteleport=false	
		if body.has_method("isplayerfunc"):
			canteleport=true
