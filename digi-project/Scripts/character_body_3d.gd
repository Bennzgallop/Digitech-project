extends CharacterBody3D

@onready var head = $Head
@onready var spotlight = $Head/SpotLight3D
@export var Pausemenu : Control
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const rotation_speed = 0.01

var is_locked = true
var spotlightenabled = true

func _physics_process(delta: float) -> void:
	if is_locked == true:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif is_locked == false:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("Esc"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_tree().paused = true
		Pausemenu.visible = true
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("F"):
		print("F has been pressed")
		spotlightenabled = !spotlightenabled
		if spotlightenabled == false:
			print("Spotlight range is 0 changing it")
			spotlight.spot_range = 4.212
		else:
			print("Spotlight range was 4.212 Changing it")
			spotlight.spot_range = 0
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("Left", "Right", "Forward", "Backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if is_locked == true:
		if event is InputEventMouseMotion:
			var mouse_motion_event: InputEventMouseMotion = event as InputEventMouseMotion
			rotation.y -= mouse_motion_event.relative.x * rotation_speed
			head.rotation.x -= mouse_motion_event.relative.y * rotation_speed
			head.rotation.x = clampf(head.rotation.x, PI/-2, PI/2)
