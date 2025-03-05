extends Node

@onready var usernametextedit: TextEdit = $AccountInForPanel/Panel/AccountUser/usernametextedit

@onready var passwordtextedit: TextEdit = $AccountInForPanel/Panel2/AccountPassword/passwordtextedit
@onready var http_request: HTTPRequest = $HTTPRequest


@onready var player: PlayerMain = $"."



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
func validateLogin() -> void:
	if !usernametextedit.text && !passwordtextedit.text:
		pass
func login()  -> void:
	
	var url = "http://127.0.0.1:3000/api/auth/login"
	var headers = ["Content-Type: application/json"]
	var body = JSON.stringify({
		"username": usernametextedit.text,
		"password": passwordtextedit.text
	})
	http_request.request(url,headers,HTTPClient.METHOD_POST,body)
	http_request.request_completed.connect(_on_request_completed)
	
	pass
func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)
	await  player.init_character(json.username,json.userBasedHP,json.userBaseMP,json.Wallet_Address
	,json.UserLevel,json.UserTotalExp,json.userDamage,json.userArmor,json.userBalance)
	get_tree().change_scene_to_file("res://game.tscn")
func create_account():
	var url =  "http://127.0.0.1:3000/api/register/profile"
	var headers = ["Content-Type: application/json"]
	var body = JSON.stringify({
		"username": "khanh",
		"password": "khanh123",
		"userBasedHP" : 100,
		"userBaseMP" :100,
		"Wallet_Address": "0x8404dbA8df49E3183Bae3678df1c53690f1C8Ab8",
		"UserLevel": 1,
		"UserTotalExp": 1,
		"userDamage": 10 ,
		"userArmor": 0,
		"userBalance": 0,
	}
	)
	print("POST request:", url, "Body:", body)
	http_request.request(url, headers, HTTPClient.METHOD_POST, body)
	var error = http_request.request(url, headers, HTTPClient.METHOD_POST, body)
	if error != OK:
			print("Request failed: ", error)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	login() # Replace with function body.


func _on_button_2_pressed() -> void:
	create_account() # Replace with function body.
