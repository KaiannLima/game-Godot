extends Area2D

func _ready():
	pass # Replace with function body.




func _on_Area2D_body_entered(body):
	if body.name =="Player":
		get_tree().reload_current_scene()
	pass # Replace with function body.
