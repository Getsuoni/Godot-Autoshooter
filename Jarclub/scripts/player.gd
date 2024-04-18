extends CharacterBody2D
#Signal to be emited when players health is gone
signal health_gone
#Players defined health
var health = 100.0
@onready var jar = $Jar

	#Defines how the player will move defined in the project settings tab 
func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	# Defines the Walk animation if character is moving, or else it does nothing
	if (velocity.length() > 0.0):
		#loads the jar badguy animation for walking
		jar.animation = "walking"
	else:
		#a case to make an idle animation the still and do nothing
		jar.animation = "idle" 
		
	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if (overlapping_mobs.size() > 0):
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if (health <= 0.0):
			health_gone.emit()
		
