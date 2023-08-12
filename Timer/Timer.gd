extends VBoxContainer

var ui_sound_enabled : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_button_sound():
	if ui_sound_enabled:
		$Clock/TickTockSound.pitch_scale = 1.5
		$Clock/TickTockSound.play()

func _on_button_sound_on_off_pressed():
	play_button_sound()
	$Clock.sound_enabled = not $Clock.sound_enabled
	if $Clock.sound_enabled:
		$ClockControls/ButtonSoundOnOff.text = "Sound Off"
	else:
		$ClockControls/ButtonSoundOnOff.text = "Sound On"

func _on_button_reset_pressed():
	play_button_sound()
	$Clock.reset()


func _on_button_start_stop_pressed():
	play_button_sound()
	if $Clock/AlternateTimer.timer_active:
		$Clock/AlternateTimer.stop()
		$ClockControls/ButtonStartStop.text = "Start"
	else:
		$Clock/AlternateTimer.start()
		$ClockControls/ButtonStartStop.text = "Stop"

