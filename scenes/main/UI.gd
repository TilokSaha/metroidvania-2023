extends CanvasLayer


onready var player_health = $PlayerHealth
var max_health: int = 0
var curent_health:int = 0
onready var player = $"../Player"
onready var texture_rect = $TextureRect

func _ready():
	max_health = player.health.health
	curent_health = max_health






func _on_Player_health_changed(damage):
	curent_health -= damage
	player_health.value = (float(curent_health)/max_health)*100


func _on_ForestBeastBoss_dead_buff():
	texture_rect.show()
