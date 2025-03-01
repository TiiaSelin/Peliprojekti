extends Node2D

@onready var final_timer: Timer = $final_timer
@onready var final_level: CanvasLayer = $FinalLevel
@onready var finalLevelÄäni = $finalLevelÄäni
@onready var taustamusiikkiStop = $Player/taustaMusiikki
@onready var finalLevelTaustaMusiikki = $finalLevelTaustamusiikki

func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	%PausedMenu.disable_pause()  # Estetään pause-menun käyttö ja pysäytetään peli

func _ready():
	%PausedMenu.can_pause = false
	get_tree().paused = true
	final_timer.process_mode = Node.PROCESS_MODE_ALWAYS
	final_timer.start()
	finalLevelÄäni.play()
	taustamusiikkiStop.stop()
	finalLevelTaustaMusiikki.play()
	

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
	if not finalLevelTaustamusiikki.playing: 
		finalLevelTaustamusiikki.play()
	
