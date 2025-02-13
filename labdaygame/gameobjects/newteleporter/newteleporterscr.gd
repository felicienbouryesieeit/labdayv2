extends Node2D
class_name newteleporterclass
@export var otherteleporter : newteleporterclass
@export var transitionvar : Teleporter
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if otherteleporter!=null : 
		otherteleporter.otherteleporter=self
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
	var decalageY : float = Gamemanager.playermovementvar.global_position.y-global_position.y
	var decalageX : float = Gamemanager.playermovementvar.global_position.x-global_position.x
	
	decalageY = teleportdestination(decalageY)
	decalageX = teleportdestination(decalageX)
	
	print("gaga gougou ouaf ouaf Y : "+str(Gamemanager.playermovementvar.global_position.y-global_position.y))
	print("gaga gougou ouaf ouaf X : "+str(Gamemanager.playermovementvar.global_position.x-global_position.x))
	if otherteleporter!=null :
		Gamemanager.teleportervar.transition2()
		Gamemanager.playermovementvar.global_position.y=otherteleporter.global_position.y-decalageY
		Gamemanager.playermovementvar.global_position.x=otherteleporter.global_position.x-decalageX
	pass # Replace with function body.
