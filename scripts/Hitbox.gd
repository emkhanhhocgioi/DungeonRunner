extends Area2D
class_name Hitbox


@export var damage := 10

func _init() -> void:
	add_to_group("Hitbox")
	self.set_deferred("monitoring", false)
	self.set_deferred("monitorable", false)
	collision_layer = 2 
	collision_mask  = 0
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
