extends Control

@onready var receptacle_bar: Control = %ReceptacleBar
@onready var inventory_bag: Button = %InventoryBag
@export var inventory_scene: PackedScene = preload("res://system/ui/inventory.tscn")
var inventory_instance: Control = null

var resource_life:ResourceLife:
	set(v):
		resource_life = v
		receptacle_bar.max_life = resource_life.max_life
		resource_life.life_changed.connect(on_life_changed)

func on_life_changed():
	receptacle_bar.life = resource_life.life

func _ready():
	$InventoryBag.pressed.connect(_on_InventoryBag_pressed)

func _on_InventoryBag_pressed():
	if inventory_instance == null:
		inventory_instance = inventory_scene.instantiate()
		add_child(inventory_instance)
		
		inventory_instance.connect("close_inventory", _on_inventory_closed)
		inventory_instance.visible = true

func _on_inventory_closed():
	inventory_instance = null
