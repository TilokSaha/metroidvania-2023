extends Node


const keymaps_path = "user://keymaps.dat"
var keymaps: Dictionary


func _ready() -> void:
	for action in InputMap.get_actions():
		keymaps[action] = InputMap.get_action_list(action)[0]
	load_keymap()


func load_keymap() -> void:
	var file := File.new()
	
	var __ = file.open(keymaps_path, File.READ)
	var temp_keymap: Dictionary = file.get_var(true)
	file.close()
	
	for action in keymaps.keys():
		if temp_keymap.has(action):
			keymaps[action] = temp_keymap[action]
			InputMap.action_erase_events(action)
			InputMap.action_add_event(action, keymaps[action])


func save_keymap() -> void:
	var file := File.new()
	
	var __ = file.open(keymaps_path, File.WRITE)
	file.store_var(keymaps, true)
	file.close()
