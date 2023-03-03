extends Node2D


onready var background_music = $AudioStreamPlayer


func _on_Area2D_body_entered(_body):
	if not background_music.is_playing():
		background_music.play()
