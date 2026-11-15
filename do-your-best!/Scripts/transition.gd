extends Node

var button_type = null

func _ready() -> void:
	$Main.show()
	$Main/AnimationPlayer.play("fade_in")
	$Main.hide()

	
func _on_exit_pressed() -> void:
	$Main.show()
	$Main/Timer.start()
	$Main/AnimationPlayer.play("fade_out")
	button_type = "exit"

func _on_timer_timeout() -> void:
	if button_type == "exit":
		get_tree().change_scene_to_file("res://Main_Menu.tscn")
		button_type = null
