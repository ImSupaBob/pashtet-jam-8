class_name StressEffect
extends Effect

var amount := 0

func execute(targets: Array[Node]) -> void:
	for target in targets:
		if not target or target is Enemy:
			continue
		if target is Player:
			target.take_stress(amount)
