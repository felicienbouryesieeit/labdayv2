extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.














	
	
	
	
	
	
	
	
	
	
	


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("havedamage"):
		print("degat degat")
		body.queue_free()
