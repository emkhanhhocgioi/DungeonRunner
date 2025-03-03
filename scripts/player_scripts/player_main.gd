extends CharacterBody2D
class_name CharacterBase


@export var healthbar : ProgressBar
@export var health : int
@export var level : int 
@export var totalExp : float
@export var flipped_horizontal : bool
@export var hit_particles : GPUParticles2D

var invincible : bool = false
var is_dead : bool = false

func _ready():
	init_character()
	
func _process(_delta):
	pass
	
#Add anything here that needs to be initialized on the character
func init_character():
	pass

#Flip charater sprites based on their current velocity


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
