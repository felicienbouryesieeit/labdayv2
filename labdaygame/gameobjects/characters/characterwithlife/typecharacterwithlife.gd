extends "res://gameobjects/characters/typeofcharacterpar.gd"
var life : int = 5
@export var maxlife : int = 5 
var canbeattacked : bool = true
var defense : int = 0;

	
#	charactervar.queue_free()

func begintypeofcharacter() -> void:
	super.begintypeofcharacter()
	life=maxlife
	
	
func checklife() -> void:
	
	print("life"+str(life))
	charactervar.attackbehaviorvar.ondamage()
	
	#queue_free()
	if life<=0 :
		#print(charactervar)
		charactervar.queue_free()


func setlife(change : int) -> void:
	life = change
	checklife()
	
func addlife(change: int) ->void:
	life = life + change
	setlife(life)
	

	
func dealdamage(change: int) ->void:
	addlife(-change)
	
	
	
func reaction_to_attack(damagevar : damageclass) -> void:
	super.reaction_to_attack(damagevar)
	#print("projectile: " + str(damagevar.strengh))
	if canbeattacked == true :
		dealdamage(damagevar.strengh*(1/(1+(defense*0.1))))
	damagevar.queue_free()
	
