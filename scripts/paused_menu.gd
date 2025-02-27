extends Control

@onready var clickSound = $clickSound
@onready var pauseSound = $pauseSound
@onready var resumeSound = $resumeSound



func _ready() -> void:
	$GridContainer/resume.connect("mouse_entered", _on_button_hover)
	$GridContainer/settings.connect("mouse_entered", _on_button_hover)
	$GridContainer/quit.connect("mouse_entered", _on_button_hover)

var can_pause = true

var _is_paused: bool = false:
	set = set_paused

var _is_game_over: bool = false 

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and not _is_game_over:
		_is_paused = !_is_paused

func set_paused(value: bool) -> void:
	if can_pause:
		if _is_game_over:
			return 
		# Jos peli menee pauselle, soitetaan pauseSound
		if value and pauseSound:
			pauseSound.play()

		_is_paused = value
		get_tree().paused = _is_paused
		visible = _is_paused
		
			# Jos peli jatkuu (pausen päättyessä), soitetaan resumeSound
		if not value and resumeSound:
			resumeSound.play()

func _on_resume_pressed() -> void:
	set_paused(false)

func _on_settings_pressed() -> void:
	pass

func _on_quit_pressed() -> void:
	get_tree().quit()

# Tämä estää pausen ja pysäyttää kaiken game overin tullessa
func disable_pause() -> void:
	_is_game_over = true
	_is_paused = false
	get_tree().paused = true  # Varmistetaan, että peli oikeasti pysähtyy
	visible = false
	
# Äänifunktiot
func _on_button_hover() -> void:
		clickSound.play()
	
