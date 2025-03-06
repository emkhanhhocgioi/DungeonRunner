extends Control

@onready var h_pbar: ProgressBar = $PlayerInfoBox/HPbar
@onready var m_pbar: ProgressBar = $PlayerInfoBox/MPbar
@onready var player_name: Label = $PlayerInfoBox/PlayerAvatar/playerName

func setHpBar (health : int)-> void :
	h_pbar.value = health
func setMpBar (mp :int ) -> void :
	m_pbar.value = mp
func setUserName (name : String) -> void:
	player_name.text = name
