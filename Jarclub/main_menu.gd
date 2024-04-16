extends Node


func _on_button_pressed():
	get_tree().change_scene_to_file("res://survivors_game.tscn")
	GameManger.score = 0
