extends CharacterBody2D

const SPEED = 100.0

func _physics_process(delta):
	
	if Input.is_action_just_pressed("left_click"):
		var ground : TileMapLayer = get_node("/root/TestLevel/TileMapLayer")
		if ground:
			var clicked_cell = ground.local_to_map(position)
			var data : TileData = ground.get_cell_tile_data(clicked_cell)
			if data:
				if data.get_custom_data("is_flamable"):
					print("do be flamable")
				else:
					print("not flamable")
			else:
				print("no data")
		else:
			print("no ground")
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	velocity = direction * SPEED
	
	move_and_slide()
