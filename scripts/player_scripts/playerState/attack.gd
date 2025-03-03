extends State

@onready var player: PlayerMain = $"../.."  
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var hitbox: Hitbox = $"../../Hitbox"

func Enter():
	# Bật Hitbox khi bắt đầu tấn công
	hitbox.set_deferred("monitoring", true)
	hitbox.set_deferred("monitorable", true)
	
	animated_sprite_2d.play("attack")
	await animated_sprite_2d.animation_finished
	
	# Chuyển trạng thái về Idle
	state_transition.emit(self, "Idle")

func Exit():
	# Tắt Hitbox khi rời khỏi trạng thái tấn công
	hitbox.set_deferred("monitoring", false)
	hitbox.set_deferred("monitorable", false)

func Update(delta: float):
	pass
