extends Control

onready var master__volume = $"Options/HBoxContainer/VBoxContainer2/Master Volume"
onready var music__volume = $"Options/HBoxContainer/VBoxContainer2/Music Volume"
onready var sound__effects = $"Options/HBoxContainer/VBoxContainer2/Sound Effects"




func _ready():
	$MainMenu/VBoxContainer/Start.grab_focus()
	OS.window_fullscreen = true
	OS.window_borderless = false
	
	OS.vsync_enabled = false
	OS.delta_smoothing = false
	
#	master__volume.value = db2linear(AudioServer.get_bus_volume_db(0))
#	music__volume.value = db2linear(AudioServer.get_bus_volume_db(1))
#	sound__effects.value = db2linear(AudioServer.get_bus_volume_db(2))
	#load_sound()
	
	center()
	
func center():
	OS.set_window_position(OS.get_screen_size() * 0.5 - OS.get_window_size() * 0.5)
	
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		toggle()
	if get_tree().current_scene.filename == "res://scenes/main/Map.tscn":
		$MainMenu/VBoxContainer/Continue.visible = true

func _on_Start_pressed():
	toggle()
	#SceneTransition.start_transition_to("res://Scenes/World.tscn")
	var __ = get_tree().change_scene("res://scenes/main/Map.tscn")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Options_pressed():
	$MainMenu.hide()
	$Options.show()
	$Controls.hide()


func _on_Button_pressed():
	$MainMenu.show()
	$Options.hide()
	$Controls.hide()
	#save_sound()


func _on_Master_Volume_value_changed(value):
	set_bus_volume(0, value)


func _on_Music_Volume_value_changed(value):
	set_bus_volume(1, value)


func _on_Sound_Effects_value_changed(value):
	set_bus_volume(2, value)
	
func set_bus_volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, linear2db(value))
	AudioServer.set_bus_mute(bus_index, value < 0.01)


func _on_CheckButton_pressed():
	OS.window_fullscreen = !OS.window_fullscreen


func _on_Continue_pressed():
	toggle()
	
func toggle():
	visible = !visible
	get_tree().paused = visible
	$MainMenu/VBoxContainer/Start.grab_focus()
	$MainMenu.show()
	$Options.hide()
	$Controls.hide()


func _on_Button2_pressed():
	$Controls.show()
	$Options.hide()
	$MainMenu.hide()
