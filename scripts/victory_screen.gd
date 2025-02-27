extends Control

@onready var clickSound = $clickSound

func _ready() -> void: # Liitetään kursorin liike näppäimeen
	$GridContainer/quit.connect("mouse_entered", _on_button_hover)

func _on_quit_pressed() -> void:
	get_tree().quit()

# Äänifunktiot
func _on_button_hover() -> void:
		clickSound.play()
	
