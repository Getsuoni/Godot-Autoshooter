extends Node2D
@export var target_level: PackedScene
@onready var game_manger = $GameManger

func _ready():
	spawn_bad()
	spawn_bad()
	spawn_bad()
	spawn_bad()
	spawn_bad()

# Spawns a badguy mob along the path created on
# The Path2d Child at random
func spawn_bad():
	
	var new_bad = preload("res://scenes/badguy_1.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_bad.global_position = %PathFollow2D.global_position
	add_child(new_bad)

# After the timer hits a certain count it calls the spawn_bad() function
func _on_timer_timeout():
	spawn_bad()

# Displays the Game Over Screen when health defined in the player gd
# Script is depleted.
func _on_player_one_health_gone():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	#get_tree().paused = true
	
# Reloads the game and sets score to 0
func _on_replay_pressed():
	get_tree().reload_current_scene()
	GameManger.score = 0
	#get_tree().change_scene_to_file("res://main_menu.tscn")
	
#Quits the game
func _on_quit_pressed():
	get_tree().quit()
