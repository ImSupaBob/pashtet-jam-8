extends ColorRect

@onready var end_turn_border: TextureRect = $EndTurnBorder

func _on_end_turn_button_button_down() -> void:
	end_turn_border.self_modulate = Color("fbf236")

func _on_end_turn_button_button_up() -> void:
	end_turn_border.self_modulate = Color.WHITE


func _on_end_turn_button_mouse_entered() -> void:
	modulate = Color(1, 1, 1, 0.9)


func _on_end_turn_button_mouse_exited() -> void:
	modulate = Color(1, 1, 1, 1)
