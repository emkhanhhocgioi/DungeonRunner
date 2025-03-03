extends State
class_name player_idle

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func Enter():
	animated_sprite_2d.play("idle")
	
	
func Exit():
	pass

func Update(delta: float):
	pass
