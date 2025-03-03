extends Area2D



@onready var player_collider: CollisionShape2D = $CollisionShape2D
@onready var coin_collider: CollisionShape2D = $CollisionShape2D
@onready var coin = 0
# Called when the node enters the scene tree for the first time.

func _on_body_entered(body: Node2D) -> void:
	coin = coin +1
	print(coin)
