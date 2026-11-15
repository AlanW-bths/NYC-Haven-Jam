extends Control

var button_type = null

func _on_start_pressed() -> void:
	button_type = "start"
	$Main.show()
	$Main/fade_timer.start()
	$Main/AnimationPlayer.play("fade_out")

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_fade_timer_timeout() -> void:
	if button_type == "start":
		get_tree().change_scene_to_file("res://Sisyphus.tscn")
		button_type = null
