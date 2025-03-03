extends Node

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var HeathPoint = 10

func take_damage(damge : int) ->void:
	animated_sprite_2d.play("Hit")
	HeathPoint = HeathPoint - damge
	await animated_sprite_2d.animation_finished
	animated_sprite_2d.play("idle")
	print(HeathPoint)
	
func die() -> void: 
	if HeathPoint == 0:
		animated_sprite_2d.play("Death")
		await  animated_sprite_2d.animation_finished
		self.queue_free()
	pass

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	die()
	pass
