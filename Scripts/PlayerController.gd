extends RigidBody2D

export (int) var speed = 5
export (float) var rotation_speed = 1.5

var Bullet = preload("res://Scenes/Bullet.tscn")
var velocity = Vector2()
var cSpeed = 0
export (float) var rDegrees = 0

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		get_node(".").rotation_degrees = rDegrees + rotation_speed
		rDegrees = rotation_degrees
	if Input.is_action_pressed('ui_left'):
		get_node(".").rotation_degrees = rDegrees - rotation_speed
		rDegrees = rotation_degrees
	if Input.is_action_pressed('ui_up'):
		rotation_degrees = rDegrees
		get_node("Particles2D").emitting = true
		apply_central_impulse(Vector2(0, -speed).rotated(rotation))
	if Input.is_action_pressed("ui_select"):
		shoot()

func _physics_process(delta):
	get_input()
	rotation_degrees = rDegrees

func shoot():
	if $Timer.is_stopped():
		var b = Bullet.instance()
		get_parent().add_child(b)
		b.start($Position2D.global_position, rotation)
		$Timer.start()
	
