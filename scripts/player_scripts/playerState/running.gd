extends State
class_name player_walking

const SPEED = 100.0

# Thêm signal nếu chưa có

@onready var player: PlayerMain = $"../.."  # Kiểm tra lại đường dẫn
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

func Enter():
	animated_sprite_2d.play("running")

func MoveAround(input_dir: Vector2):
	player.velocity = input_dir * SPEED
	player.move_and_slide()
	
	
	if input_dir.length() == 0.0:
		Transition("Idle")

func MoveAroundAndAttack(input_dir: Vector2):
	player.velocity = input_dir * SPEED
	player.move_and_slide()
	
	
	if input_dir.length() == 0.0:
		Transition("idle")

func Transition(new_state: String):
	state_transition.emit(self, new_state)

func Exit():
	pass

func Update(delta: float):
	var input_dir = Input.get_vector("MoveLeft", "MoveRight", "MoveUp", "MoveDown").normalized()
	if Input.is_action_just_pressed("Swing") :
		state_transition.emit(self, "attack")
	MoveAround(input_dir)	
	#
