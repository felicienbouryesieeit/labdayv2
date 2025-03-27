extends Control
class_name dialoguebox

@onready var _speaker : Label = $Box/VBoxContainer/Speaker
@onready var _dialogue : RichTextLabel = $Box/VBoxContainer2/Dialogue
@onready var _next : Button = $Box/Next
@onready var _image : TextureRect = $Faceset

func _ready() -> void:
	Gamemanager.dialogueboxvar=self
	close()
	
	#var current_stylebox = _image.get_theme_stylebox("panel")
	
	#var new_texture = load("res://Ninja Adventure - Asset Pack/Actor/Characters/Pig/Faceset.png")
#	var current_stylebox = _image.theme.get_stylebox("pipi","pipi")#get_stylebox("StyleBoxTexture", "Panel")
	#print("les martiens: " + str(current_stylebox))
	#super._ready()
	
func showtext(line : String,speaker : String,imagepath : String) -> void:
	_dialogue.text =line
	_speaker.text = speaker
	#imagepath="res://Ninja Adventure - Asset Pack/Actor/Boss/GiantBamboo/Faceset.png"
	print("juice : "+imagepath)
	_image.texture=load(imagepath)
func display_line(line : String, speaker : String =""):
	_speaker.visible = (speaker !="")
	_speaker.text = speaker
	_dialogue.text = line
	open()
	_next.grab_focus()
	
func open():
	if Gamemanager.playermovementvar!=null:
		Gamemanager.playermovementvar.cantwalk=true
	visible = true
	
func close():
	if Gamemanager.playermovementvar!=null:
		Gamemanager.playermovementvar.cantwalk=false
	visible = false		


func _on_next_pressed() -> void:
	close()
