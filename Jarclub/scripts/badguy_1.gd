extends CharacterBody2D
#@onready var game_manger = $GameManger
@onready var badguy = %badguy
@onready var boom = $"."


 #Bad guys health defined
var health = 5
# Moves towards the player
@onready var player = get_node("/root/Survivors Game/PlayerOne")
func _ready():
	badguy.animation ="walk"

#the speed in which the badguy moves towards the player
func _physics_process(_delta):
	var direction  = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()


#Defines much damage it takes when damage is inflicted from the player
func take_damage():
	health -= 1
	badguy.animation = "hurt"
	
	# if the monsters health reaches 0, it despawns playing a smoke animation
	if (health == 0):
		GameManger.score +=1 #adds +1 to the score board every time this object health reaches 0
		queue_free()
