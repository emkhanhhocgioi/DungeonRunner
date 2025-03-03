extends Node
class_name FiniteStateMachine

var states : Dictionary = {}
var current_state : State
@export var inital_state :State

func _process(delta):
	if current_state:
		current_state.Update(delta)

func _ready():
	for child in get_children():
		if child is State:
			
			states[child.name.to_lower()] = child
			child.state_transition.connect(change_state)

	# Nếu inital_state chưa được gán, tìm "idle" trong states
	if !inital_state and states.has("idle"):
		inital_state = states["idle"]
		

	if inital_state:
		print("Initial state:", inital_state.name)
		inital_state.Enter()
		current_state = inital_state


func change_state(old_state:State , new_state_name: String):
	if old_state != current_state:
		print("invalid change_state from :"+old_state.name +"but currently in :"+ current_state.name)
		return
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		print("new state is empty")
		return
	if current_state:
		current_state.Exit();
	new_state.Enter()
	current_state = new_state
	pass
