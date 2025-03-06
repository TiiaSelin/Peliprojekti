extends Node2D

@onready var final_timer: Timer = $final_timer
@onready var final_level: CanvasLayer = $FinalLevel
@onready var finalLevelÄäni = $finalLevelÄäni
@onready var taustamusiikkiStop = $Player/taustaMusiikki
@onready var finalLevelTaustamusiikki = $finalLevelTaustamusiikki

func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	%PausedMenu.disable_pause()  # Estetään pause-menun käyttö ja pysäytetään peli
	
	await get_tree().create_timer(4.0).timeout #peli siirtyy game over -tilasta automaattisesti main menuun 4 sekunnin kuluttua
	get_tree().paused = false  # Poistetaan peli pauselta
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _ready():
	%PausedMenu.can_pause = false
	get_tree().paused = true
	final_timer.process_mode = Node.PROCESS_MODE_ALWAYS
	final_timer.start()
	finalLevelÄäni.play() # Soittaa ennen taustamusiikkia olevan äänen
	taustamusiikkiStop.stop() # Lopettaa normaalin taustamusiikkin
	finalLevelTaustamusiikki.play() # Aloittaa tasolle ainutlaatuisen taustamusiikkin 
	

func spawn_mob():
	var new_mob = preload("res://scenes/big_bee.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func _on_final_timer_timeout() -> void:
	get_tree().paused = false
	final_level.visible = false
	%PausedMenu.can_pause = true
	spawn_mob()

# Audiofunktiot
func soitaFinalLevelTaustamusiikki(): 
	if not finalLevelTaustamusiikki.playing: # Aloittaa biisin loppuessa uudestaan
		finalLevelTaustamusiikki.play() # Soittaa biisin
	
