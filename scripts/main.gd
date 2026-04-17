extends Node

# 2 corners of screen to make our random positions
@export var point1 := Vector2(130, 50)
@export var point2 := Vector2(1100, 600)

# when the scene loads, load up our ingredients as Resources
@onready var egg_resource : Resource = preload("res://scenes/egg.tscn")
@onready var baking_powder_resource : Resource = preload("res://scenes/baking_powder.tscn")
@onready var butter_resource : Resource = preload("res://scenes/butter.tscn")
@onready var flour_resource : Resource = preload("res://scenes/flour.tscn")
@onready var milk_resource : Resource = preload("res://scenes/milk.tscn")
@onready var salt_resource : Resource = preload("res://scenes/salt.tscn")
@onready var sugar_resource : Resource = preload("res://scenes/sugar.tscn")
@onready var vanilla_resource : Resource = preload("res://scenes/vanilla.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_ingredient()
	spawn_snail()


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
	var baking_powder_instance : RigidBody2D = baking_powder_resource.instantiate()
	var butter_instance : RigidBody2D = butter_resource.instantiate()
	var flour_instance : RigidBody2D = flour_resource.instantiate()
	var milk_instance : RigidBody2D = milk_resource.instantiate()
	var salt_instance : RigidBody2D = salt_resource.instantiate()
	var sugar_instance : RigidBody2D = sugar_resource.instantiate()
	var vanilla_instance : RigidBody2D = vanilla_resource.instantiate()
	
	# add it to our scene
	add_child(egg_instance)
	add_child(baking_powder_instance)
	add_child(butter_instance)
	add_child(flour_instance)
	add_child(milk_instance)
	add_child(salt_instance)
	add_child(sugar_instance)
	add_child(vanilla_instance)
	
	#egg_instance.get_node("Sprite2D").scale = Vector2(4, 4)
	
	# put the ingredient at a random point
	var egg_spawn_location : Vector2 = get_random_point_inside(point1, point2)
	egg_instance.position = egg_spawn_location
	
	var baking_powder_spawn_location : Vector2 = get_random_point_inside(point1, point2)
	baking_powder_instance.position = baking_powder_spawn_location
	
	var butter_spawn_location : Vector2 = get_random_point_inside(point1, point2)
	butter_instance.position = butter_spawn_location
	
	var flour_spawn_location : Vector2 = get_random_point_inside(point1, point2)
	flour_instance.position = flour_spawn_location
	
	var milk_spawn_location : Vector2 = get_random_point_inside(point1, point2)
	milk_instance.position = milk_spawn_location
	
	var salt_spawn_location : Vector2 = get_random_point_inside(point1, point2)
	salt_instance.position = salt_spawn_location
	
	var sugar_spawn_location : Vector2 = get_random_point_inside(point1, point2)
	sugar_instance.position = sugar_spawn_location
	
	var vanilla_spawn_location : Vector2 = get_random_point_inside(point1, point2)
	vanilla_instance.position = vanilla_spawn_location


func spawn_snail() -> void:
	# Creating a snail from code breaks the hitbox fsr
	# var snail := preload("res://scenes/snail.tscn").instantiate()
	
	var snail_spawn_location : Object = $Path2D/PathFollow2D
	snail_spawn_location.progress_ratio = randf()
	
	print(snail_spawn_location.progress_ratio)
	
	$Snail.position = snail_spawn_location.position
	
	# snail.position = snail_spawn_location.position
	
	# add_child(snail)

func _on_snail_food_hit() -> void:
	$HUD/GameOver.text = "Your food got infected Game Over"
	$HUD/GameOver.show()
	$HUD/Steps.hide()
	$Snail.queue_free()
	print("mouse hit")


func _on_snail_player_hit() -> void:
	$HUD/GameOver.text = "Your hands got infected Game Over"
	$HUD/GameOver.show()
	$HUD/Steps.hide()
	$Snail.queue_free()
	print("mouse hit")
