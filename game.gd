extends Node2D

@export var json: Dictionary
@onready var camera_2d: Camera2D = $camera2d

#var player_scene = preload("res://scenes/player_scene/player.tscn")

@onready var player2: PlayerMain = $Player

func _ready() -> void:
	Engine.max_fps = 60  # Giới hạn FPS
	
	if player2 :
		print(player2)
		initplayerdata()


func getjsondata(new_json: Dictionary) -> void:
	json = new_json  
	print("✅ Dữ liệu JSON đã cập nhật:", json)
	

func initplayerdata() -> void:
	if json and player2:
		await player2.init_character(
			json.username, json.userBasedHP, json.userBaseMP, json.Wallet_Address,
			json.UserLevel, json.UserTotalExp, json.userDamage, json.userArmor, json.userBalance
		)
		
		print("👤 Player Username:", player2.Uname)  
	else:
		print("❌ LỖI: Chưa có dữ liệu JSON hoặc Player chưa sẵn sàng!")

func _process(delta: float) -> void:
	pass  
