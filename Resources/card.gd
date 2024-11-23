class_name Card
extends Resource

enum Type {ATTACK, SKILL, POWER, NEGATIVE}
enum Target {SELF, ENEMY, EVERYONE}

@export_group("Card Attributes")
@export var id: String
@export var type: Type
@export var target: Target
@export var cost: int

#@export_group("Card Visuals")
#@export var icon: Texture
#@export_multiline var tooltip_text: String
#@export var sound: AudioStream
