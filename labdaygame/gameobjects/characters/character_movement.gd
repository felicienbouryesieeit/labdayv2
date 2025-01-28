extends CharacterBody2D

@export var movement_speed : float = 300
@export var animated_sprite_2d : AnimatedSprite2D # = $AnimatedSprite2D
@export var sprite_2d : Sprite2D # = $AnimatedSprite2D
@export var timervar : Timer
var character_direction : Vector2
var acceleration : float = 70
#var animation_direction : String = "down"
#var animation_state : String = ""

var animation_direction2 : int = 0
var animation_frame : int = 0
var animation_state_bool : bool = false

func _ready() -> void:
	timervar.start(0.15)  # Démarre le Timer pour 2 secondes
	timervar.timeout.connect(animationframefunc)  # Connecte le signal timeout


func animationframefunc() -> void:
	#print("Fonction appelée après 2 secondes")
	if animation_frame==3:
		animation_frame=0
	else :
		animation_frame+=1


func update_sprite_direction(input: Vector2 )  -> void:
	match input : 
		
		
		Vector2.DOWN:
			#animation_direction = "down"
			animation_direction2=0
		
		
		Vector2.UP:
			#animation_direction = "up"
			animation_direction2=1
			
			
		
		Vector2.LEFT:
			#animation_direction = "left"
			animation_direction2=2
			
		
		Vector2.RIGHT:
			#animation_direction = "right"
			animation_direction2=3

func update_sprite() -> void:
	
	
	sprite_2d.frame_coords.x=animation_direction2
	
	animation_state_bool = velocity.length()>0
	
	if animation_state_bool == false :
		sprite_2d.frame_coords.y=0
	else : 
		sprite_2d.frame_coords.y=animation_frame
		
	
func _physics_process(delta: float) -> void:
	#character_direction.x = Input.get_axis("left","right")
	#character_direction.y = Input.get_axis("down","up")
	var direction := Input.get_vector("left","right","up","down")
	update_sprite_direction(direction)
	update_sprite()
	#print(Gamemanager.gmtest)
	#animated_sprite_2d.play(animation_state+animation_direction)
	
	#if character_direction.x > 0 : %sprite.flip_h = false
	#elif character_direction.x < 0 : %sprite.flip_h = true
	
	velocity.x=move_toward(velocity.x,direction.x*movement_speed,acceleration)
	velocity.y=move_toward(velocity.y,direction.y*movement_speed,acceleration)
	
	
	move_and_collide(velocity*delta)
	
