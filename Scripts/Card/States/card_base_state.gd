extends CardState

func enter() -> void:
	if not card_ui.is_node_ready():
		await card_ui.ready
	
	card_ui.border.self_modulate = Color.WHITE
	card_ui.reparent_requested.emit(card_ui)
	card_ui.state.text = "BASE"
	card_ui.pivot_offset = Vector2.ZERO
	Event.tooltip_hide_requested.emit()

func on_gui_input(event : InputEvent) -> void:
	if not card_ui.playable or card_ui.disabled:
		return
	
	if event.is_action_pressed("left_mouse"):
		card_ui.pivot_offset = card_ui.get_global_mouse_position() - card_ui.global_position
		transition_requested.emit(self, CardState.State.CLICKED)

func on_mouse_entered() -> void:
	if not card_ui.playable or card_ui.disabled:
		return
	
	card_ui.border.self_modulate = Color("fbf236")
	Event.card_tooltip_requested.emit(card_ui.card.name, card_ui.card.tooltip_text)

func on_mouse_exited() -> void:
	if not card_ui.playable or card_ui.disabled:
		return
	
	card_ui.border.self_modulate = Color.WHITE
	Event.tooltip_hide_requested.emit()
