extends Area2D

var travel_distance = 0

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	const projectile_speed = 600
	const range = 900
	position += direction * projectile_speed * delta
	
	travel_distance += projectile_speed * delta
	if travel_distance > range:
		queue_free()
		travel_distance = 0


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage()
	queue_free()
	
