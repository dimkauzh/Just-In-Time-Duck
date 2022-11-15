extends Node2D

signal key_collected

func _on_Area2D_body_entered(_body):
	emit_signal("key_collected")
	queue_free()
