extends RigidBody2D

var scene = load("res://Scenes/RockSmall.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_RigidBody2D_body_entered(body):
	if body.name == "Player":
		get_tree().queue_delete(body)
	if body.is_in_group("bullet"):
		get_tree().queue_delete(body)
		var i = 0
		while i < 3:
			var s_rock = scene.instance()
			get_parent().add_child(s_rock)
			s_rock.start(position)
			i += 1
		get_parent().get_node("Label").text = String(get_parent().get_node("Label").text.to_int()+1)
		get_tree().queue_delete(self)
	pass # Replace with function body.
