extends Node


@onready var orc_sprite: AnimatedSprite2D = $OrcSprite
@onready var hitbox: Hitbox = $Hitbox

@onready var timer: Timer = $Timer



var HeathPoint = 100
var moblv = 1
var Damage = 20
 
func attackPlayer () -> void :
	hitbox.set_deferred("monitoring", true)
	hitbox.set_deferred("monitorable", true)
	orc_sprite.play("attack")
	await orc_sprite.animation_finished
	hitbox.set_deferred("monitoring", false)
	hitbox.set_deferred("monitorable", false)
	orc_sprite.play("idle")

func take_damage(damge : int) ->void:
	orc_sprite.play("Hit")
	HeathPoint = HeathPoint - damge
	await orc_sprite.animation_finished
	orc_sprite.play("idle")
	print(HeathPoint)
	
func die() -> void:
	if HeathPoint == 0:
		orc_sprite.play("Death")
		await  orc_sprite.animation_finished
		self.queue_free()
	pass

func _ready() -> void:
	hitbox.changeBaseDamage(Damage)
	timer.wait_time = 5.0
	timer.timeout.connect(attackPlayer)
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	die()
	pass
