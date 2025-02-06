extends Node2D

func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	%PausedMenu.disable_pause()  # Estetään pause-menun käyttö ja pysäytetään peli


func _on_timer_timeout() -> void:
	%Portal.visible = true
	%Portal.set_collision_mask_value(3, true)
