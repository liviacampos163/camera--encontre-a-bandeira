extends CharacterBody2D

const speed = 90.0
func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed('ui_left'):
		velocity.x = -1 *speed
	if Input.is_action_pressed('ui_right'):
		velocity.x = 1*speed
	if Input.is_action_pressed('ui_up'):
		velocity.y = -1 * speed
	if Input.is_action_pressed('ui_down'):
		velocity.y = 1 *speed
	move_and_slide()
	
	if get_slide_collision_count() > 0:
		get_tree().reload_current_scene()

	if velocity == Vector2.ZERO:$"animação".play('idle')
	else:$"animação".play('walk')

	if velocity.x < 0.0: $"animação".flip_h = true
	else:$"animação".flip_h = false
