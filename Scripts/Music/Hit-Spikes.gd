extends AudioStreamPlayer

signal timer_over

func _on_Timer_timeout():
	emit_signal("timer_over")
