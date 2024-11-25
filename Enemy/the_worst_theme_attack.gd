extends EnemyAction

@export var stress := 7

func perform_action() -> void:
	if not enemy or not target:
		return
	
	var tween := create_tween().set_trans(Tween.TRANS_QUINT)
	var start := enemy.global_position
	var end := target.global_position + Vector2.RIGHT * 32
	var stress_effect := StressEffect.new()
	var target_array: Array[Node] = [target]
	stress_effect.amount = stress
	
	tween.tween_property(enemy, "global_position", end, 0.4)
	tween.tween_callback(stress_effect.execute.bind(target_array))
	tween.tween_interval(0.25)
	tween.tween_property(enemy, "global_position", start, 0.4)
	
	tween.finished.connect(
		func():
			Event.enemy_action_completed.emit(enemy)
	)
