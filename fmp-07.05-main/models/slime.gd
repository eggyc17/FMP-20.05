extends CharacterBody3D

var player = null
var state_machine

const SPEED = 4
const ATTACK_RANGE = 20

@export var player_path : NodePath

@onready var nav_agent = $NavigationAgent3D
@onready var anim_tree = $AnimationTree


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	velocity = Vector3.ZERO
	
	match state_machine.get_current_node():
		"walk":
			nav_agent.set_target_position(player.global_transform.origin)
			var next_nav_point = nav_agent.get_next_path_position()
			velocity = (next_nav_point - global_transform.origin).normalized() * SPEED
			look_at(Vector3(global_position.x + velocity.x, global_position.y,
		 			global_position.z + velocity.z), Vector3.UP)
		"attack" :
			look_at(Vector3(global_position.x + velocity.x, global_position.y,
		 			global_position.z + velocity.z), Vector3.UP)

	
	move_and_slide()



func _hit_finished():
	player.hit()

