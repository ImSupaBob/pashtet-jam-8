class_name StressUI
extends HBoxContainer

@export var progress_bar_color : StyleBoxFlat

@onready var stress_progress_bar: ProgressBar = %StressProgressBar

func update_stats(character_stats: CharacterStats) -> void:
	
	stress_progress_bar.value
	progress_bar_color.bg_color = Color.RED.lerp(Color.ROYAL_BLUE, character_stats.stress / stress_progress_bar.max_value)
