extends Area2D


export(String, FILE, "*.tscn") var wold_scene;

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene(wold_scene)
	
	pass # Replace with function body.
