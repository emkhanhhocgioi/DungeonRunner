extends State

class_name playerIdle

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

func Enter():
	animated_sprite_2d.play("idle")
	pass
func Exit():
	pass

func Update(delta: float):
	if(Input.get_vector("MoveLeft", "MoveRight", "MoveUp", "MoveDown").normalized()):
		state_transition.emit(self,"running")
	if Input.is_action_just_pressed("Swing") :
		state_transition.emit(self, "attack")
