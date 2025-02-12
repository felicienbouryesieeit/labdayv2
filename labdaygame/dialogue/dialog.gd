extends Control
class_name dialoguebox

@onready var _speaker : Label = $Box/VBoxContainer/Speaker
@onready var _dialogue : RichTextLabel = $Box/VBoxContainer2/Dialogue
@onready var _next : Button = $Box/Next

func _ready() -> void:
	Gamemanager.dialogueboxvar=self
	close()
	#print("les martiens")
	#super._ready()
	
func showtext() -> void:
	_dialogue.text ="toutou"
func display_line(line : String, speaker : String =""):
	_speaker.visible = (speaker !="")
	_speaker.text = speaker
	_dialogue.text = line
	open()
	_next.grab_focus()
	
func open():
	visible = true
	
func close():
	visible = false		


func _on_next_pressed() -> void:
	close()
