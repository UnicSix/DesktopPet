class_name RoamState
extends State

@export var animal: CharacterBody2D
@export var anim_player: AnimationPlayer

var speed = 300
var idle_time = 0 
var sprite
var direc_x=1
var pre_direc_x=1
var flip_ctrl = 1

func Enter():
	if animal:
		rand_vars()
		print("roam")
		anim_player.play("walk")
	else:
		printerr("no animal ref")

func Exit():
	pass

func Updates(_delta):
	if idle_time > 0:
		idle_time -= _delta
	else:
		Transitioned.emit(self, "idleState")

func Physics_Updates(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		animal.scale.x = -1
	animal.move_and_slide()

func rand_vars():
	#pick random speed and action time when ready
	pre_direc_x = direc_x
	direc_x = randi()%2
	if direc_x == 0: direc_x = -1
	speed = randf_range(20, 40) * direc_x
	idle_time = (randi()%5)+5;
	#flip_ctrl = pre_direc_x*direc_x 
	animal.scale.x = pre_direc_x * direc_x
	animal.velocity.x = speed

	print(pre_direc_x)
	print(direc_x)

