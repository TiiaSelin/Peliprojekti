extends CharacterBody2D

signal health_depleted 

#Pelaajan health
var health = 100.0
	


# Pelaajahahmon liike
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# Hahmon nopeus
	velocity = direction * 650
	move_and_slide()

#Pelaajan ottama damagen määrittelyä
	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0:
			health_depleted.emit()
			
	
	
	
