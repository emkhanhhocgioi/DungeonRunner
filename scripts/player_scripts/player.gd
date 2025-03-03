extends CharacterBase
class_name PlayerMain

@onready var fsm = $FSM as FiniteStateMachine
@onready var PlayerSprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox: Hitbox = $Hitbox

func Turn():
	#This ternary lets us flip a sprite if its drawn the wrong way
	var direction = -1 if flipped_horizontal == true else 1
	
	if(velocity.x < 0):
		PlayerSprite.scale.x = -direction
		hitbox.scale.x = -direction
	elif(velocity.x > 0):
		PlayerSprite.scale.x = direction
		hitbox.scale.x = direction
func _ready():
	
	add_to_group("Player")
	

func _process(delta):
	Turn()
