extends CharacterBody2D

const LOOK_SPEED = 1000
var look_dir : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	look_around(delta)


func look_around(delta: float) -> void: # Used to make player look around.
	var direction = Input.get_vector("left", "right", "up", "down")

	if direction:
		velocity.x = direction.x * LOOK_SPEED
		velocity.y = direction.y * LOOK_SPEED
		print("velocity: ", velocity)
		print("position: ", position)
	else:
		velocity.x = move_toward(velocity.x, 0, LOOK_SPEED)
		velocity.y = move_toward(velocity.y, 0, LOOK_SPEED)

	move_and_slide()
