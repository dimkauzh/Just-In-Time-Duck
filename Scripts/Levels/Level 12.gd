extends Node2D

var door_open : bool = false

func _on_Spikes_body_entered(_body):
	$"Spikes/Hit-Spikes + Timer".play()
	$"Spikes/Hit-Spikes + Timer/Timer".start()

func _on_HitSpikes__Timer_timer_over():
	get_tree().reload_current_scene()

func _on_SidefallLeft_body_entered(body):
	body.position.x = 600
	body.position.y = 80
	
func _on_SidefallRight_body_entered(body):
	body.position.x = 0
	body.position.y = 430

func _process(_delta):
	if door_open and Input.is_action_pressed("ui_down"):
		get_tree().change_scene("res://Scenes/Level 13.tscn")
func _on_Door_Key_door_open():
	door_open = true

func _on_Door_Key_door_closed():
	door_open = false

func _on_Lever_lever_closed():
	print("Lever Closed")
	$RigidBody2D/Sprite2.visible = true
func _on_Lever_lever_open():
	print("Lever Open")
	$RigidBody2D/AnimationPlayer.play("wall_close")
	$RigidBody2D/Sprite2.visible = false
