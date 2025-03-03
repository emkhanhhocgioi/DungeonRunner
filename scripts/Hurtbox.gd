extends Area2D
class_name HurtBox

func _init() -> void:
	collision_layer = 0 
	collision_mask = 2

func _ready() -> void:
	connect("area_entered", Callable(self, "_on_area_entered"))

func _on_area_entered(hitbox: Area2D) -> void:
	if hitbox == null:
		return
	if hitbox is Hitbox:
		if owner and owner.has_method("take_damage"):
			owner.take_damage(hitbox.damage)
