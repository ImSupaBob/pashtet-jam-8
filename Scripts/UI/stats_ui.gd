class_name StatsUI
extends VBoxContainer

@onready var health: HBoxContainer = $Health
@onready var health_label: Label = %HealthLabel


func update_stats(stats: Stats) -> void:
	health_label.text = str(stats.max_health) + "  /  " + str(stats.health)
	
	#health.visible = stats.health > 0
