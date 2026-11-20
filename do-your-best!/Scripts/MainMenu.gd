extends Control

var button_type = null

func _ready() -> void:
	$Load_In.show()
	$Load_In/enter.start()
	$Load_In/AnimationPlayer.play("fade_in")

func _on_start_pressed() -> void:
	button_type = "start"
	$Exit.show()
	$Exit/fade_timer.start()
	$Exit/AnimationPlayer.play("fade_out")

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_fade_timer_timeout() -> void:
	if button_type == "start":
		get_tree().change_scene_to_file("res://Sisyphus.tscn")
		button_type = null
		$Exit.hide()

func _on_enter_timeout() -> void:
	$Load_In.hide()
