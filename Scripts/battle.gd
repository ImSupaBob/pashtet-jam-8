extends Node2D

@export var char_stats: CharacterStats

@onready var enemy_handler: EnemyHandler = $EnemyHandler
@onready var player_handler: PlayerHandler = $PlayerHandler
@onready var battle_ui: BattleUI = $BattleUI
@onready var player: Player = $Player

func _ready() -> void:
	var new_stats: CharacterStats = char_stats.create_instance()
	battle_ui.char_stats = new_stats
	player.stats = new_stats
	
	Event.enemy_turn_ended.connect(_on_enemy_turn_ended)
	
	Event.player_turn_ended.connect(player_handler.end_turn)
	Event.player_hand_discarded.connect(player_handler.start_turn)
	
	start_battle(new_stats)

func start_battle(stats : CharacterStats) -> void:
	enemy_handler.reset_enemy_actions()
	player_handler.start_battle(stats)

func _on_enemy_turn_ended() -> void:
	player_handler.start_turn()
	enemy_handler.reset_enemy_actions()
