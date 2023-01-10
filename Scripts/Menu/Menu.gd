extends Control


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level 1.tscn")


func _unhandled_key_input(event):
	if event.is_pressed():
		_on_Button_pressed()
