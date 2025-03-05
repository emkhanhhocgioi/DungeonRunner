extends CharacterBody2D
class_name CharacterBase

@export var username : String
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


@onready var http_request: HTTPRequest = $HTTPRequest

var invincible : bool = false
var is_dead : bool = false

func _ready():
	pass
	
func _process(_delta):

	pass
	

#Add anything here that needs to be initialized on the character
func init_character(username: String,userBasedHP: int ,userBaseMP: int ,Wallet_Address: String, UserLevel: int 
, UserTotalExp: float ,userDamage : int, userArmor: int ,userBalance: float):
	username = username
	health = userBasedHP
	userMP = userBaseMP
	userWalletAdd = Wallet_Address
	level = UserLevel
	totalExp = UserTotalExp
	userDamage = userDamage
	userArmor = userArmor
	userBalance = userBalance
	


#region Taking Damage

#Play universal damage sound effect for any character taking damage and flashing red
func damage_effects():
	pass

#After we are done flashing red, we can take damage again
func after_damage_iframes():
	pass
	
func _take_damage(amount):
	pass
		
func _die():
	pass

#endregion
