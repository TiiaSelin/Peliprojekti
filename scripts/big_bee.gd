extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var health = 50

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	
	# Määritellään vihollisten nopeus sekä orientoituminen.
	if (direction[0] < 0):
		animated_sprite.flip_h = false
	else:
		animated_sprite.flip_h = true
	velocity = direction * 260.0
	move_and_slide()

func take_damage():
	health -= 1
	%ProgressBar.value = health
	
	if health == 0:
		queue_free()
