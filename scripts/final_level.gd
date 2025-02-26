extends Node2D

@onready var final_timer: Timer = $final_timer

func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	%PausedMenu.disable_pause()  # Estetään pause-menun käyttö ja pysäytetään peli


'''
func _on_timer_timeout() -> void:
	%Portal.visible = true
	%Portal.set_collision_mask_value(3, true)
'''

func _ready():
	get_tree().paused = true
	final_timer.start()

func spawn_mob():
	var new_mob = preload("res://scenes/bee.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	

func _on_mob_timer_2_timeout() -> void: #level_2 ajastin vihollisten ilmestymiselle
	spawn_mob()


func _on_final_timer_timeout() -> void:
	get_tree().paused = false
	%FinalLevel.visible = false
