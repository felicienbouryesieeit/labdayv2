extends Control

@onready var _speaker : Label = $Box/VBoxContainer/Speaker
@onready var _dialogue : RichTextLabel = $Box/VBoxContainer2/Dialogue
@onready var _next : Button = $Box/Next

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
