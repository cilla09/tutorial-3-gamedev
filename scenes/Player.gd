extends CharacterBody2D

@export var gravity = 700.0
@export var walk_speed = 200
@export var jump_speed = -500
@export var crouch_speed = 100

# --- DASH SETTINGS ---
@export var dash_speed = 500
@export var dash_duration = 0.2
@export var double_tap_time = 0.3 # Toleransi waktu antar pencetan (detik)

var is_dashing = false
var last_tap_time_left = 0.0
var last_tap_time_right = 0.0

@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Update timer untuk deteksi double tap
	last_tap_time_left += delta
	last_tap_time_right += delta

	if Input.is_action_just_pressed("ui_left"):
		if last_tap_time_left < double_tap_time:
			start_dash(-1)
		last_tap_time_left = 0.0

	if Input.is_action_just_pressed("ui_right"):
		if last_tap_time_right < double_tap_time:
			start_dash(1)
		last_tap_time_right = 0.0

	if is_dashing:
		_animated_sprite.play("dash")
		move_and_slide()
		return
	
	velocity.y += delta * gravity
	
	if is_on_floor() and Input.is_action_just_pressed('ui_up'):
		velocity.y = jump_speed
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -walk_speed
		_animated_sprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  walk_speed
		_animated_sprite.flip_h = false
	else:
		velocity.x = 0
		
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_left") and is_on_floor():
		velocity.x = -crouch_speed
		_animated_sprite.flip_h = true
	elif Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_right") and is_on_floor():
		velocity.x = crouch_speed
		_animated_sprite.flip_h = false
		
	if not is_on_floor():
		_animated_sprite.play("jump") 
	elif Input.is_action_pressed("ui_down") and is_on_floor():
		_animated_sprite.play("crouch")
	elif velocity.x != 0:
		_animated_sprite.play("walk") 
	else:
		_animated_sprite.play("idle")

	# "move_and_slide" already takes delta time into account.
	move_and_slide()
	
func start_dash(dir):
	is_dashing = true
	velocity.x = dir * dash_speed
	velocity.y = 0
	
	await get_tree().create_timer(dash_duration).timeout
	is_dashing = false
