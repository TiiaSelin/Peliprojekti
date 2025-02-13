extends CharacterBody2D

@onready var taustamusiikki = $taustaMusiikki
@onready var kuolemisAani = $pelaajaKuolema
@onready var pelaajaOsuma = $pelaajaOsuma
@onready var lowHealth = $lowHealth


signal health_depleted 

#Pelaajan health
var health = 100.0
	


# Pelaajahahmon liike
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# Hahmon nopeus
	velocity = direction * 650
	move_and_slide()
	playLowHealthWarning() # Low health-varoitusääni kun health alle 30
	


#Pelaajan ottama damagen määrittelyä
	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		# Audio
		if not pelaajaOsuma.playing:
			pelaajaOsuma.play()
		
		
		%ProgressBar.value = health
		if health <= 0:
			health_depleted.emit()
			# Audio
			kuolemisAani.play()
			
	
	
	
	
# Audiofunktiot
func playLowHealthWarning():
	if health <= 30 and not lowHealth.playing:
		lowHealth.play()
# Musiikintoisto kentän alkaessa
func soitaMusiikki():
	taustamusiikki.play()
func _ready():
	taustamusiikki.connect("finished", Callable(self, "_on_musiikki_finished"))
	if not taustamusiikki.playing:
		soitaMusiikki()


func _on_musiikki_finished():
	soitaMusiikki()
