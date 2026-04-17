extends RigidBody2D

## signal for mouse getting hit by snail
signal player_hit
## signal for food getting hit by snail
signal food_hit

## Screen position of mouse
var mouse_position : Vector2

## Speed of snail
@export var speed := 100

## direction to mouse
var direction : Vector2
var velocity : Vector2

## distance from mouse
var to_mouse : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_position = get_global_mouse_position()
	
	direction = global_position.direction_to(mouse_position)
	
	to_mouse = mouse_position - global_position
	
	if direction.x < 0: 
		$Sprite2D.set_flip_h(true)
	else: 
		$Sprite2D.set_flip_h(false)
	
	if to_mouse.length() > 5:
		velocity = direction
		velocity = velocity.normalized() * speed
		# Wait to multiply by delta until here because this is where it starts moving
		position += velocity * delta
	else:
		velocity = Vector2.ZERO

func _on_mouse_entered() -> void:
	player_hit.emit()


func _on_body_entered(body: Node) -> void:
	food_hit.emit()
