extends CharacterBody2D

const GRAVITY : int = 1400
const MAX_VEL : int = 700
const FLAP_SPEED : int = -600
var flying : bool = false
var falling : bool = false
const START_POS = Vector2(200, 400)

# Called when the node enters the scene tree for the first time.
func _ready():
	reset()

func reset():
	falling = false
	flying = false
	position = START_POS
	$AnimatedSprite2D.play("static")
	set_rotation(0)
	
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if flying or falling:
		velocity.y += GRAVITY * delta
		#terminal velocity
		if velocity.y > MAX_VEL:
			velocity.y = MAX_VEL
		if flying:
			set_rotation(deg_to_rad(velocity.y * 0.025))
			$AnimatedSprite2D.play("flying")
		elif falling:
			set_rotation(PI/3)
			$AnimatedSprite2D.play("dead")
		move_and_collide(velocity * delta)
	else:
		$AnimatedSprite2D.stop()
		
func flap():
	velocity.y = FLAP_SPEED
