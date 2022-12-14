extends Node2D

onready var anim = $AnimatedSprite
onready var lever_open = $open
onready var lever_close = $close
onready var timer = $Timer
var lever = false

signal lever_open
signal lever_closed

func _process(delta):
	if lever:
		lever_open.visible = true
		lever_close.visible = false
	if not lever:
		lever_open.visible = false
		lever_close.visible = true
func _on_Lever_body_entered(body):
	if not lever:
		lever = true
		timer.start()
		emit_signal("lever_open")
	if lever and timer.is_stopped():
		lever = false
		emit_signal("lever_closed")

func _on_Lever_body_exited(body):
	timer.stop()

func _on_Timer_timeout():
	if lever and timer.is_stopped():
		lever = false
		emit_signal("lever_closed")

