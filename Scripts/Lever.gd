extends Node2D

onready var anim = $AnimatedSprite
signal lever_open
signal lever_closed

func _process(delta):
	print(anim.animation)

func _on_Area2D_body_entered(body):
	if anim.animation == "close" or anim.animation == "closed":
		emit_signal("lever_open")
		anim.play("open")
	if anim.animation == "open":
		anim.play("close")
		emit_signal("lever_closed")
