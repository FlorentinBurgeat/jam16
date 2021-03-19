extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Zoo.tscn")
	


func _on_Start_mouse_entered():
	$Start/FishLight.enabled = true


func _on_Start_mouse_exited():
	$Start/FishLight.enabled = false
