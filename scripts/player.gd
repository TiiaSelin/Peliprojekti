extends CharacterBody2D

@onready var taustamusiikki = $taustaMusiikki

signal health_depleted 

#Pelaajan health
var health = 100.0
	
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


# Pelaajahahmon liike
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# Hahmon nopeus
	velocity = direction * 650
	
	# Hahmon orientoituminen.
	if direction[0] < 0:
		animated_sprite.flip_h = true
	elif direction[0] > 0:
		animated_sprite.flip_h = false
		
	# Hahmon animaatio pyörii vain jos se liikkuu.
	if velocity[0] != 0 || velocity[1] != 0:
		animated_sprite.play("move")
	else:
		animated_sprite.stop()
	move_and_slide()

#Pelaajan ottama damagen määrittelyä
	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0:
			health_depleted.emit()
			
	
# Musiikintoisto kentän alkaessa
func soitaMusiikki():
	taustamusiikki.play()
func _ready():
	soitaMusiikki()
