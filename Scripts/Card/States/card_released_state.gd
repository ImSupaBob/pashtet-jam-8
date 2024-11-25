extends CardState

var played : bool

func enter() -> void:
	card_ui.state.text = "RELEASED"
	
	played = false
	
	if not card_ui.targets.is_empty():
		played = true
		card_ui.play()
	Event.tooltip_hide_requested.emit()

func on_input(_event : InputEvent) -> void:
	if played:
		return
	
	transition_requested.emit(self, CardState.State.BASE)
