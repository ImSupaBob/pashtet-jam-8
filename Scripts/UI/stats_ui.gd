class_name StatsUI
extends VBoxContainer

@onready var health: HBoxContainer = $Health
@onready var health_label: Label = %HealthLabel


func update_stats(stats: Stats) -> void:
	health_label.text = str(stats.health) + "  /  " + str(stats.max_health)
	
	#health.visible = stats.health > 0
