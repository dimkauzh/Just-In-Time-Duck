extends Node2D

var door_open : bool = false

func _on_Spikes_body_entered(_body):
	$"Spikes/Hit-Spikes".play()
	$"Spikes/Hit-Spikes/Timer".start()

func _on_HitSpikes_timer_over():
	get_tree().reload_current_scene()

func _process(_delta):
	if door_open and Input.is_action_pressed("ui_down"):
		get_tree().change_scene("res://Scenes/Levels/Level 2.tscn")

func _on_Door_Key_door_open():
	door_open = true

func _on_Door_Key_door_closed():
	door_open = false
