class_name Menu
extends Control



@onready var PlayButton = $MarginContainer/HBoxContainer/VBoxContainer/PlayButton as Button
@onready var ExitButton = $MarginContainer/HBoxContainer/VBoxContainer/ExitButton as Button
@onready var starting_level = preload("res://scenes/game.tscn") #Ladataan pelin aloitustaso


func _ready() -> void:
	#Liitetään Play-nappulan painallus funktioon 'on_play_pressed'
	PlayButton.button_down.connect(on_play_pressed)
	#Liitetään Exit-nappulan painallus funktioon 'on_exit_pressed'
	ExitButton.button_down.connect(on_exit_pressed)
	
func on_play_pressed() -> void:
	get_tree().change_scene_to_packed(starting_level)
	
func on_exit_pressed() -> void:
	get_tree().quit()
	
	
