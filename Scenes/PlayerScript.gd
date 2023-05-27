extends KinematicBody2D

var motion = Vector2.ZERO;
var speed = 300
var jumps_left = 2
var jump_force = 300


func _process(delta):
	motion.y += 10
	
	if is_on_floor():
		# Reinicia o contador de saltos se o jogador tocar no chão
		jumps_left = 2
		
		if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
			$AnimatedSprite.play("Run")
		
		if motion.x == 0:
			$AnimatedSprite.play("idle")
			
		if Input.is_action_pressed("ui_up"):
			# Aplica uma força vertical para fazer o personagem saltar
			motion.y = -jump_force
			jumps_left -= 1
			
	else:
		if Input.is_action_pressed("ui_up") and jumps_left > 0:
			if jumps_left == 2 or (jumps_left == 1 and motion.y > 0):
				# Aplica uma força vertical para fazer o personagem saltar
				motion.y = -jump_force
				jumps_left -= 1
		
		$AnimatedSprite.play("Jump")

	if Input.is_action_pressed("ui_right"):
		motion.x = speed;
		$AnimatedSprite.flip_h = false;
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed;
		$AnimatedSprite.flip_h = true;
	else:
		motion.x = 0;

	motion = move_and_slide(motion,Vector2.UP)
