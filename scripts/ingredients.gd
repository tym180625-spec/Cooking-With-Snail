class_name ingredients
extends RigidBody2D

## if mouse is in range to pick up item
var mouse_in_range : bool = false

## position of mouse
var mouse_position : Vector2

## speed of ingredient when following mouse
var speed := 0

## direction to mouse
var direction : Vector2
var velocity : Vector2

## distance to mouse
var to_mouse : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_position = get_global_mouse_position()
	
	direction = global_position.direction_to(mouse_position)
	
	to_mouse = global_position - mouse_position
	
	if to_mouse.length() > 5:
		velocity = direction
		velocity = velocity.normalized() * speed
		position += velocity * delta
	else:
		velocity = Vector2.ZERO

# input function checks for left click input to drag ingredient around
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == 1:
		if event.pressed and mouse_in_range:
			speed = 500
		else:
			speed = 0


## mouse enters collision shape, in range to drag
func _on_mouse_entered() -> void:
	mouse_in_range = true

## mouse exits collision shape, not in range to drag
func _on_mouse_exited() -> void:
	mouse_in_range = false
