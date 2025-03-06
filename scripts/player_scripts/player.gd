extends CharacterBody2D 
class_name PlayerMain
@onready var fsm = $FSM as FiniteStateMachine
@onready var PlayerSprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox: Hitbox = $Hitbox


@export var Uname : String
@export var healthbar : ProgressBar
@export var health : int
@export var level : int
@export var totalExp : float
@export var userDamage : float
@export var userArmor  : float
@export var userMP : float
@export var userBalance: float
@export var userWalletAdd: String
@export var flipped_horizontal : bool
@export var hit_particles : GPUParticles2D

#player va cham voi mob khac chiu sat thuong

@onready var http_request: HTTPRequest = $HTTPRequest

var invincible : bool = false
var is_dead : bool = false

func Turn():
	#This ternary lets us flip a sprite if its drawn the wrong way
	var direction = -1 if flipped_horizontal == true else 1
	
	if(velocity.x < 0):
		PlayerSprite.scale.x = -direction
		hitbox.scale.x = -direction
	elif(velocity.x > 0):
		PlayerSprite.scale.x = direction
		hitbox.scale.x = direction
		
func init_character(username: String,userBasedHP: int ,userBaseMP: int ,Wallet_Address: String, UserLevel: int 
, UserTotalExp: float ,userDamage : int, userArmor: int ,userBalance: float):
	Uname = username
	health = userBasedHP
	userMP = userBaseMP
	userWalletAdd = Wallet_Address
	level = UserLevel
	totalExp = UserTotalExp
	userDamage = userDamage
	userArmor = userArmor
	userBalance = userBalance
	hitbox.changeBaseDamage(userDamage)
	

func take_damage (damage : int) -> void :
	health = health-damage
	PlayerSprite.play("hurt")
	await PlayerSprite.animation_finished
	PlayerSprite.play("idle")
	pass
func _ready():
	pass
	
	


	

	

#func create_account():
	#var url =  "http://127.0.0.1:3000/api/register/profile"
	#var headers = ["Content-Type: application/json"]
	#var body = JSON.stringify({
		#"username": "khanh",
		#"password": "khanh123",
		#"userBasedHP" : 100,
		#"userBaseMP" :100,
		#"Wallet_Address": "0x8404dbA8df49E3183Bae3678df1c53690f1C8Ab8",
		#"UserLevel": 1,
		#"UserTotalExp": 1,
		#"userDamage": 10 ,
		#"userArmor": 0,
		#"userBalance": 0,
	#}
	#)
	#print("POST request:", url, "Body:", body)
	#http_request.request(url, headers, HTTPClient.METHOD_POST, body)
	#var error = http_request.request(url, headers, HTTPClient.METHOD_POST, body)
	#if error != OK:
			#print("Request failed: ", error)
			
func testCallApi():
	var url = "http://localhost:3000/api/test"
	http_request.request_completed.connect(_on_request_completed)
	http_request.request(url)

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	
	

func _process(delta):

	Turn()


func _on_hitbox_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
