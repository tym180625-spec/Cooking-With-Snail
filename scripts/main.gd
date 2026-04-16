extends Node

@export var snail_scene : PackedScene

# 2 corners of screen to make our random positions
@export var point1 := Vector2(50, 50)
@export var point2 := Vector2(1100, 600)

# when the scene loads, load up our ingredients as Resources
@onready var egg_resource : Resource = preload("res://scenes/egg.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_ingredient()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func get_random_point_inside(p1 : Vector2, p2: Vector2) -> Vector2:
	# get random x and y points
	var randx := randf_range(p1.x, p2.x)
	var randy := randf_range(p1.y, p2.y)
	
	var random_point_inside := Vector2(randx, randy)
	
	print("Random point: " + str(random_point_inside))
	
	return(random_point_inside)

func spawn_ingredient() -> void:
	# instantiate our ingredients
	var egg_instance : RigidBody2D = egg_resource.instantiate()
	# add it to our scene
	add_child(egg_instance)
	egg_instance.get_node("Sprite2D").scale = Vector2(3, 3)
	
	# put the ingredient at a random point
	var egg_spawn_location : Vector2 = get_random_point_inside(point1, point2)
	egg_instance.position = egg_spawn_location



func _on_snail_food_hit() -> void:
	$HUD/GameOver.text = "Your food got infected Game Over"
	$HUD.show()
	$Snail.queue_free()
	print("mouse hit")


func _on_snail_player_hit() -> void:
	$HUD/GameOver.text = "Your hands got infected Game Over"
	$HUD.show()
	$Snail.queue_free()
	print("mouse hit")
