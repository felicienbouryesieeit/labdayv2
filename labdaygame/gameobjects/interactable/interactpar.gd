extends Node
class_name interactclass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_pnj_body_entered(body: Node2D) -> void:
	print("la chine")
	if body.has_method("oninteractobject"):
		print("la chine 2 ")
		body.oninteractobject(self)
		#pass # Replace with function body.

func oninteract() ->void :
	print("campao del mundo karai")
	
	
	


func _on_area_pnj_body_exited(body: Node2D) -> void:
	if body.has_method("onexitinteractobject"):
		body.onexitinteractobject(self)
	pass # Replace with function body.
