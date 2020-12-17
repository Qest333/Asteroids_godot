extends RigidBody2D

var scene = load("res://Scenes/RockSmall.tscn")
var rng = RandomNumberGenerator.new()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func start(pos):
	position = pos
	rng.randomize()
	apply_central_impulse(Vector2(rng.randi_range(-150, 150), rng.randi_range(-150, 150)))
	rng.randomize()
	angular_velocity = rng.randi_range(-5, 5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_RigidBody2D_body_entered(body):
	if body.name == "Player":
		get_tree().queue_delete(body)
	if body.is_in_group("bullet"):
		get_tree().queue_delete(body)
		get_parent().get_node("Label").text = String(get_parent().get_node("Label").text.to_int()+1)
		get_tree().queue_delete(self)
	pass # Replace with function body.
