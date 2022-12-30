extends StaticBody2D

var wall_open : bool = false
var anim_finished : bool = false

func _process(delta):
	if $Sprite2.visible:
		wall_open = false
	if not $Sprite2.visible:
		wall_open = true
	if wall_open and anim_finished:
		$CollisionShape2D.disabled = true
	if not wall_open:
		$CollisionShape2D.disabled = false
		
func _on_AnimationPlayer_animation_started(anim_name):
	anim_finished = false

func _on_AnimationPlayer_animation_finished(anim_name):
	wall_open = true
	anim_finished = true

