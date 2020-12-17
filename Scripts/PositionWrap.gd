extends Node2D

onready var screen_size = get_viewport_rect().size
onready var object = get_parent().get_node(".")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = get_parent().get_node(".").linear_velocity
	if object.position.x > screen_size.x+50:
		object.position.x = 50
		get_parent().get_node(".").linear_velocity = velocity
	if object.position.x < -50:
		object.position.x = screen_size.x+50
		get_parent().get_node(".").linear_velocity = velocity
	if object. position.y > screen_size.y+50:
		object.position.y = 50
		get_parent().get_node(".").linear_velocity = velocity
	if object.position.y < -50:
		object.position.y = screen_size.y+50
		get_parent().get_node(".").linear_velocity = velocity
	
	pass
