extends "res://content/game_objects/characters/typeofcharacterpar.gd"
@export var life : int = 5

	
#	charactervar.queue_free()

func checklife() -> void:
	print("life"+str(life))
	
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
	dealdamage(damagevar.strengh)
	damagevar.queue_free()
	
