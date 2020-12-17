extends Node2D

onready var screen_size = get_viewport_rect().size
onready var scene = load("res://Scenes/Rock.tscn")
onready var rng = RandomNumberGenerator.new() 
export var points = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	while(true):
		yield(get_tree().create_timer(5), "timeout")
		var rock = scene.instance()
		add_child(rock)
		rng.randomize()
		match rng.randi_range(0, 3):
			0: 
				rng.randomize()
				get_child(get_child_count()-1).position.x = rng.randi_range(-100, screen_size.x+100)
				get_child(get_child_count()-1).position.y = -100
				rng.randomize()
				get_child(get_child_count()-1).apply_central_impulse(Vector2(rng.randi_range(-150, 150), rng.randi_range(-150, 150)))
				rng.randomize()
				get_child(get_child_count()-1).angular_velocity = rng.randi_range(-5, 5)
			1: 
				rng.randomize()
				get_child(get_child_count()-1).position.x = screen_size.x+100
				get_child(get_child_count()-1).position.y = rng.randi_range(-100, screen_size.y+100)
				rng.randomize()
				get_child(get_child_count()-1).apply_central_impulse(Vector2(rng.randi_range(-150, 150), rng.randi_range(-150, 150)))
				rng.randomize()
				get_child(get_child_count()-1).angular_velocity = rng.randi_range(-5, 5)
			2: 
				rng.randomize()
				get_child(get_child_count()-1).position.x = rng.randi_range(-100, screen_size.x+100)
				get_child(get_child_count()-1).position.y = screen_size.y+100
				rng.randomize()
				get_child(get_child_count()-1).apply_central_impulse(Vector2(rng.randi_range(-150, 150), rng.randi_range(-150, 150)))
				rng.randomize()
				get_child(get_child_count()-1).angular_velocity = rng.randi_range(-5, 5)
			3: 
				rng.randomize()
				get_child(get_child_count()-1).position.x = -100
				get_child(get_child_count()-1).position.y = rng.randi_range(-100, screen_size.y+100)
				rng.randomize()
				get_child(get_child_count()-1).apply_central_impulse(Vector2(rng.randi_range(-150, 150), rng.randi_range(-150, 150)))
				rng.randomize()
				get_child(get_child_count()-1).angular_velocity = rng.randi_range(-5, 5)
	pass # Replace with function body.
