extends PathFollow2D

signal on_body_entered
signal on_body_exited

export var followSpeed = 20

func _on_Spotlight_body_entered(body):
	if body.name == "Pingouin":
		print("internal spotlight body entered")
		emit_signal("on_body_entered")

func _on_Spotlight_body_exited(body):
	if body.name == "Pingouin":
		print("internal spotlight body exited")
		emit_signal("on_body_exited")

func _process(delta):
	set_offset(get_offset() + followSpeed * delta)
	
