extends KinematicBody2D

onready var anim = $Sprite
var gravity = 100
var vel = Vector2.ZERO
signal door_open
signal door_closed

func _on_Key_key_collected():
	anim.play("Door_Open")

func _process(delta):
	vel.y += gravity * delta
	vel = move_and_slide(vel, Vector2.UP)

func _on_Area2D_body_entered(_body):
	if anim.animation == "Door_Open":
		emit_signal("door_open")
		$Down_Arrow.visible = true


func _on_Area2D_body_exited(_body):
	$Down_Arrow.visible = false
	emit_signal("door_closed")
