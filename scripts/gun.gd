extends Area2D

func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		
		# Käännetään ase kohti valittua vihollista
		look_at(target_enemy.global_position)
