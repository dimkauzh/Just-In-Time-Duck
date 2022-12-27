extends KinematicBody2D

var vel = Vector2.ZERO
var speed = 200
var jump_speed = 400
var gravity = 1000
onready var anim = $Anim
var jumping = false
onready var timer = $Timer
onready var animj = $AnimationPlayer
onready var audio_jump = $"Jump-Sound"
var jump_count = 0
export var extrajumps = 2

func get_input():
	vel.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed("ui_up")
	
	if jump and jump_count < extrajumps:
		vel.y = -jump_speed
		animj.play("jump")
		audio_jump.play()
		timer.start()		
		jump_count += 1
		
	elif is_on_floor() or is_on_wall():
		jump_count = 0
		
	if right:
		vel.x += speed
		anim.flip_h = false
		if is_on_floor():
			anim.play("walk")
		else:
			anim.play("idle")
	elif left:
		vel.x -= speed
		anim.flip_h = true
		if is_on_floor():
			anim.play("walk")
		else:
			anim.play("idle")
	else:
		if is_on_floor():
			anim.play("idle")
		vel.x = 0
		
func _physics_process(delta):
	vel.y += gravity * delta
	get_input()
	
	vel = move_and_slide(vel, Vector2.UP)

func _on_Timer_timeout():
	scale.x = 2.5

func _on_Sidefall_body_entered(_body):
	position.x = 602

func _on_Downfall_body_entered(_body):
	position.y = -30
	vel.y = 0
