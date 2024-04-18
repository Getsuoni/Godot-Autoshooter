extends Node


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/survivors_game.tscn")
	GameManger.score = 0



func _on_quit_pressed():
	get_tree().quit()
