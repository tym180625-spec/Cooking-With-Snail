extends ingredients

@onready var flour_mixture : PackedScene = preload("res://scenes/flour_mixture.tscn")

signal combine_with

## replace the flour with the flour and baking_powder mixture
func replace_to_mixture() -> void:
	var flour_mixture_instance := flour_mixture.instantiate()
	get_parent().add_child(flour_mixture_instance)
	flour_mixture_instance.global_position = global_position
	queue_free()
	combine_with.emit()
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Flour":
		replace_to_mixture()
	
	print(body.name)
