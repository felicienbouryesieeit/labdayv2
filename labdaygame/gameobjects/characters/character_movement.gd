extends CharacterBody2D


class_name charactermovementclass

@export var movement_speed : float = 300
@export var animated_sprite_2d : AnimatedSprite2D # = $AnimatedSprite2D
@export var sprite_2d : Array[Sprite2D] # = $AnimatedSprite2D
@export var timervar : Timer
@export var timermovement : Timer
@export var timerattack : Timer

#@export var sprite_2dninho : Array[Sprite2D]


var character_direction : Vector2
var acceleration : float = 70

var ismovinganim : bool = true
var ismovinganimdirection : bool = true
var iswalkinganim : bool = true
#var pipi : int = 5
#var animation_direction : String = "down"
#var animation_state : String = ""

@export var behaviorvar : behaviorclass
@export var attackbehaviorvar : behaviorattackclass
@export var typeofcharactervar : typeofcharacterclass
@export var onprojectilecollisionvar : onprojectilecollisionclass
@export var animatedspritevar : animatedspriteclass

var fleche = preload("res://gameobjects/characters/characterpar.tscn")

@onready var main2 = get_tree().get_root().get_node("game_scene")
#@onready var animatedspritevar : animatedspriteclass




var animation_direction2 : int = 0
var animation_frame : int = 0
var animation_state_bool : bool = false

var character_rotation : float

func _ready() -> void:
	
	#queue_free()
	#beginlocation()
	#print("gougougaga ninho"+str(sprite_2dninho.size()))
	
	animatedspritevar.sprite_2d=sprite_2d
	animatedspritevar.charactermovementvar=self
	typeofcharactervar.charactervar = self
	
	behaviorvar.charactermovementvar = self
	behaviorvar.beginbehavior()
	
	print("rap"+str(attackbehaviorvar))
	attackbehaviorvar.charactermovementvar=self
	attackbehaviorvar.timerattack=timerattack
	attackbehaviorvar.beginattackbehavior()
	
"""
	timervar.start(0.15)  # Démarre le Timer pour 2 secondes
	timervar.timeout.connect(animationframefunc)  # Connecte le signal timeout
	


func animationframefunc() -> void:
	#print("Fonction appelée après 2 secondes")
	if animation_frame==3:
		animation_frame=0
	else :
		animation_frame+=1
"""


func update_sprite_direction(inputx: float , inputy:float )  -> void:
	
	#print("x :  "+str(inputx)+" "+"y : "+str(inputy))
	
	if abs(inputx)>abs(inputy) : 
	
		if inputx>0:
			animation_direction2=3
			character_rotation=0
		if inputx<0:
			animation_direction2=2
			character_rotation=180
	
	else :
		
		
		if inputy>0:
			animation_direction2=0
			character_rotation=90
		if inputy<0:
			animation_direction2=1
			character_rotation=270
		
		
		
"""
func update_sprite() -> void:
	
	print("youpiland"+str(sprite_2d.size()))
	
	#update_sprite2(sprite_2d,animation_direction2,true)
	for i in range(sprite_2d.size()):
		sprite_2d[i].frame_coords.x=animation_direction2
	animation_state_bool = velocity.length()>0
	
	if animation_state_bool == false :
		for i in range(sprite_2d.size()):
			sprite_2d[i].frame_coords.y=0
		
	else : 
		for i in range(sprite_2d.size()):
			sprite_2d[i].frame_coords.y=animation_frame
		
"""
	
func _physics_process(delta: float) -> void:
	#character_direction.x = Input.get_axis("left","right")
	#character_direction.y = Input.get_axis("down","up")
	
	#var direction := Input.get_vector("left","right","up","down")
	
	#print(global_position)
	
	behaviorvar.actorposition=global_position
	behaviorvar.setbehavior()
	attackbehaviorvar.setattackbehavior()
	var direction:=Vector2(behaviorvar.behaviordirection)
	
	
	update_sprite_direction(direction.x,direction.y)
	#update_sprite()
	if iswalkinganim :
		ismovinganim = velocity.length()>0
		ismovinganimdirection=true
	
		
	
	animatedspritevar.update_sprite(ismovinganim)
	#velocity.length()>0)
	
	if ismovinganimdirection :
		animatedspritevar.update_sprite_direction(animation_direction2)
	direction = direction.normalized()
	#print(direction)
	#animated_sprite_2d.play(animation_state+animation_direction)
	
	#if character_direction.x > 0 : %sprite.flip_h = false
	#elif character_direction.x < 0 : %sprite.flip_h = true
	
	velocity.x=move_toward(velocity.x,direction.x*movement_speed,acceleration)
	velocity.y=move_toward(velocity.y,direction.y*movement_speed,acceleration)
	#velocity = velocity.Normalized() * 5;
	
	
	#move_and_collide(velocity*delta)
	
	move_and_slide()
	
	
	
	
	
func haveprojectilecollision(damagevar : damageclass, charactermovementvar : charactermovementclass) -> void:
	#print(damagevar)
	if charactermovementvar!=self:
		typeofcharactervar.reaction_to_attack(damagevar)
	
	
	
	
	
	
	
func ondamage(damage : int) -> void:
	if typeofcharactervar.has_method("checklife"):
		typeofcharactervar.dealdamage(2)
	#print(typeofcharactervar)
	





func spawnattack() ->void:
	var fleche2 = fleche.instantiate()
	fleche2.spawnposition=position
	fleche2.charactermovementvar=self
	fleche2.rotationvar = character_rotation
		#fleche2.spawnPos=actorposition
	
	main2.add_child.call_deferred(fleche2)
		
func onanimationend(currentframe : int) ->void:
	attackbehaviorvar.onanimationend(currentframe)
