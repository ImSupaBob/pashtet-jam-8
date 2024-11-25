class_name Tooltip
extends PanelContainer

@export var fade_seconds := 0.2

@onready var tooltip_name: Label = %TooltipName
@onready var tooltip_text_label: RichTextLabel = %TooltipText

var tween: Tween
var is_visible_now := false


func _ready() -> void:
	Event.card_tooltip_requested.connect(show_tooltip)
	Event.tooltip_hide_requested.connect(hide_tooltip)
	modulate = Color.TRANSPARENT
	hide()


func show_tooltip(name_text: String, text: String) -> void:
	is_visible_now = true
	if tween:
		tween.kill()
	
	tooltip_name.text = name_text
	tooltip_text_label.text = text
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_callback(show)
	tween.tween_property(self, "modulate", Color.WHITE, fade_seconds)


func hide_tooltip() -> void:
	is_visible_now = false
	if tween:
		tween.kill()

	get_tree().create_timer(fade_seconds, false).timeout.connect(hide_animation)


func hide_animation() -> void:
	if not is_visible_now:
		tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(self, "modulate", Color.TRANSPARENT, fade_seconds)
		tween.tween_callback(hide)
