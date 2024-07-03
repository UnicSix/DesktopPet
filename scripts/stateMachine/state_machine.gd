extends Node2D

var current_state : State
var states : Dictionary = {}

@export var initial_state: State

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
	
	if initial_state:
		initial_state.Enter()
		current_state = initial_state

func _process(_delta):
	if current_state:
		current_state.Updates(_delta)

func _physics_process(_delta):
	if current_state:
		current_state.Physics_Updates(_delta)

func on_child_transition(state, new_state_name):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())

	if !new_state:
		return
	if current_state:
		current_state.Exit()
	
	new_state.Enter()
	current_state = new_state
