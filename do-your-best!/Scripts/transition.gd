extends Node

var button_type = null

func _ready() -> void:
	$Load_In.show()
	$Load_In/enter.start()
	$Load_In/AnimationPlayer.play("fade_in")

func _on_exit_pressed() -> void:
	$Exit.show()
	$Exit/leave.start()
	$Exit/AnimationPlayer.play("fade_out")
	button_type = "exit"

func _on_leave_timeout() -> void:
	if button_type == "exit":
		get_tree().change_scene_to_file("res://Main_Menu.tscn")
		button_type = null

func _on_enter_timeout() -> void:
	$Load_In.hide()
