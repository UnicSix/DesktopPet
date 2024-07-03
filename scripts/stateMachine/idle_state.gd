class_name IdleState
extends State

@export var animal: CharacterBody2D
@export var anim_player: AnimationPlayer

var idle_time
var anim_type
var sprite

func Enter():
	if animal:
		print("idle")
		anim_player.play("idle")
		idle_time = (randi()%3)+1;
		animal.velocity.x = 0

func Exit():
	pass

func Updates(_delta):
	if idle_time <= 0:
		Transitioned.emit(self, "roamState")
	else:
		idle_time -= _delta

func Physics_Updates(_delta):
	pass

func rand_vars():
	idle_time = randf_range(3, 5);