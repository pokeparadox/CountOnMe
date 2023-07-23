extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_sound_on_off_pressed():
	$Clock/DingSound.play()
	$Clock.sound_enabled = not $Clock.sound_enabled
	if $Clock.sound_enabled:
		$ClockControls/ButtonSoundOnOff.text = "Sound Off"
	else:
		$ClockControls/ButtonSoundOnOff.text = "Sound On"

func _on_button_reset_pressed():
	$Clock/DingSound.play()
	$Clock.reset()


func _on_button_start_stop_pressed():
	$Clock/DingSound.play()
	if $Clock/AlternateTimer.timer_active:
		$Clock/AlternateTimer.stop()
		$ClockControls/ButtonStartStop.text = "Start"
	else:
		$Clock/AlternateTimer.start()
		$ClockControls/ButtonStartStop.text = "Stop"

