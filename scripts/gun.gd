extends Area2D



func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target = enemies_in_range[0]
		
		# Käännetään ase kohti valittua vihollista
		look_at(target.global_position)
		
		
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			shoot()


func shoot():
	const projectile = preload("res://scenes/projectile.tscn")
	
	var new_projectile = projectile.instantiate()
	new_projectile.global_position = %ShootingPoint.global_position
	new_projectile.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_projectile)
