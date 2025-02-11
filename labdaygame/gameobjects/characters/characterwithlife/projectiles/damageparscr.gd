extends CharacterBody2D
class_name damageclass 

var spawnposition: Vector2
var strengh : int = 2
var charactermovementvar : charactermovementclass
var rotationvar : float 
var rotationvarbegin : float 



var speedmax : float = 150
var acceleration : float = speedmax
var direction:Vector2
#var characterbehaviorvar: behaviorclass
var behaviorattackvar: behaviorattackclass
var attackrange : float

#@export var collisionvar : CollisionShape2D
@export var timerrangevar : Timer
@export var projectilebehaviorvar : projectilebehaviorclass
@export var collisionvar : CollisionShape2D
@export var timerafterspawnvar : Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collisionvar.disabled=true
	global_position = spawnposition
	rotation_degrees = rotationvar
	rotationvarbegin = rotationvar
	#collisionvar.disabled=true
	
	timerafterspawnvar.one_shot=true
	timerafterspawnvar.start(0.1)  # Démarre le Timer pour 2 secondes
	timerafterspawnvar.timeout.connect(activatecollision)
	
	projectilebehaviorvar.damagevar=self
	projectilebehaviorvar.beginbehavior()
	
	timerrangevar.start(attackrange)  # Démarre le Timer pour 2 secondes
	timerrangevar.timeout.connect(destroyrange)

func activatecollision() -> void : 
	collisionvar.disabled=false
	timerafterspawnvar.timeout.disconnect(activatecollision)
	pass

func destroyrange() -> void :
	queue_free()
func enablecollision() -> void:
	pass#collisionvar.disabled=false
func havedamage() -> void:
	pass

func _physics_process(delta: float) -> void:
		projectilebehaviorvar.processbehavior()
	
	#rotation+=0.1
	
	
	
	
	
	#velocity.x=move_toward(direction.x,direction.x*speedmax,acceleration)
	#velocity.y=move_toward(direction.y,direction.y*speedmax,acceleration)
	#move_and_slide()
	

func rotateprojectile() -> void:
	var radians = rotationvarbegin * (PI / 180)
	direction = Vector2(cos(radians), sin(radians))
	direction = direction.normalized()
	
func moveforward() -> void:
	velocity.x=move_toward(direction.x,direction.x*speedmax,acceleration)
	velocity.y=move_toward(direction.y,direction.y*speedmax,acceleration)
	move_and_slide()	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
		#print("ayooooooooooooooooooo")
		if body.has_method("haveprojectilecollision"):
			#pass
			body.haveprojectilecollision(self,charactermovementvar)
		else :
			queue_free()
	#print("vendredi")
