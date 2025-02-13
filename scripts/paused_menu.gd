extends Control

@onready var pelaajaKuolema = $pelaajaKuolema
@onready var clickSound = $clickSound


var _is_paused: bool = false:
	set = set_paused

var _is_game_over: bool = false 

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and not _is_game_over:
		_is_paused = !_is_paused

func set_paused(value: bool) -> void:
	if _is_game_over:
		return 

	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused

func _on_resume_pressed() -> void:
	set_paused(false)

func _on_settings_pressed() -> void:
	pass

func _on_quit_pressed() -> void:
	get_tree().quit()

# Tämä estää pausen ja pysäyttää kaiken game overin tullessa
func disable_pause() -> void:
	pelaajaKuolema.play()
	_is_game_over = true
	_is_paused = false
	get_tree().paused = true  # Varmistetaan, että peli oikeasti pysähtyy
	visible = false
	
