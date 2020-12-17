extends RigidBody2D

var speed = 750
var velocity = Vector2()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func start(pos, dir):
	position = pos
	rotation = dir
	apply_central_impulse(Vector2(0, -speed).rotated(rotation))
	yield(get_tree().create_timer(2.5), "timeout")
	get_parent().remove_child(self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
