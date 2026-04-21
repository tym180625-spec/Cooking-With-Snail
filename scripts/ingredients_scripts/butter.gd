extends ingredients

@onready var sugary_butter := preload("res://scenes/sugary_butter.tscn")

signal combine_with

func replace_to_mixture() -> void:
	var sugary_butter_instance := sugary_butter.instantiate()
	get_parent().add_child(sugary_butter_instance)
	sugary_butter_instance.global_position = global_position
	queue_free()
	combine_with.emit()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Sugar":
		replace_to_mixture()
