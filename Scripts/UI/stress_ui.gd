class_name StressUI
extends PanelContainer

@export var progress_bar_color : StyleBoxFlat

@onready var stress_progress_bar: ProgressBar = $HBoxContainer/MarginContainer/StressProgressBar
@onready var stress_lable: Label = $HBoxContainer/MarginContainer/StressProgressBar/StressLable

func update_stats(character_stats: CharacterStats) -> void:
	if not is_node_ready():
		await ready
	stress_progress_bar.value = character_stats.stress
	stress_lable.text = "%s  /  %s" % [character_stats.stress, character_stats.max_stress]
