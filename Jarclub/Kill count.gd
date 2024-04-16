extends Label

#Every time an enmey is killed from the badguy script it adds +1 to this counter
func _process(_delta)->void:
	self.text = "KILLS: " +str(GameManger.score)
