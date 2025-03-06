class_name Menu
extends Control



@onready var PlayButton = $MarginContainer/HBoxContainer/VBoxContainer/PlayButton as Button
@onready var SettingsButton: Button = $MarginContainer/HBoxContainer/VBoxContainer/SettingsButton
@onready var ExitButton = $MarginContainer/HBoxContainer/VBoxContainer/ExitButton as Button
@onready var starting_level = preload("res://scenes/level_1.tscn") #Ladataan pelin aloitustaso
@onready var settings_menu = preload("res://scenes/settings_menu.tscn")
@onready var clickSound = $clickSound

func _ready() -> void:
	#Liitetään Play-nappulan painallus funktioon 'on_play_pressed'
	PlayButton.button_down.connect(on_play_pressed)
	
	SettingsButton.button_down.connect(on_settings_pressed)
	
	#Liitetään Exit-nappulan painallus funktioon 'on_exit_pressed'
	ExitButton.button_down.connect(on_exit_pressed)
	
	# Liitetään 'mouse_entered' signal PlayButtoniin, joka soittaa äänen
	PlayButton.connect("mouse_entered", Callable(self, "on_mouse_entered"))
	
	SettingsButton.connect("mouse_entered", Callable(self, "on_mouse_entered"))
	
 # Liitetään 'mouse_entered' signal ExitButtoniin, joka soittaa äänen
	ExitButton.connect("mouse_entered", Callable(self, "on_mouse_entered"))
	
func on_play_pressed() -> void:
	get_tree().change_scene_to_packed(starting_level)
func on_settings_pressed() -> void:
	get_tree().change_scene_to_packed(settings_menu)
func on_exit_pressed() -> void:
	get_tree().quit()
	
# Funktio, joka soittaa äänen, kun hiiri menee napin päälle
func on_mouse_entered() -> void:
	clickSound.play()  # Soita ääni kun hiiri menee päälle
