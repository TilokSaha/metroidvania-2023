extends Position2D

onready var player = preload("res://entities/player/Player.tscn")
onready var camera_settings = $"../camera_settings"
onready var forest_beast_boss = $"../ForestBeastBoss"

func _ready():
	owner.find_node("Player").health.connect("dead", self, "_respawn")


func _respawn():
	var __ = get_tree().change_scene("res://scenes/main/Map.tscn")
#	var new_player = player.instance()
#	get_tree().current_scene.call_deferred("add_child", new_player)
#	new_player.position = position
#	camera_settings.find_node("Camera2D").player_position = new_player
#	forest_beast_boss.player = new_player
	
