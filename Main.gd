extends Control

var milliseconds : int = 0
var enable_sounds : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_timer_timeout():
	milliseconds = milliseconds + 1
	# Convert to hh:mm::ss::ms
	
	##Display
	$VBoxContainer/LabelTimer.text = str(milliseconds)


func _on_button_timer_toggled(button_pressed):
	#if button_pressed:
	#	$Timer.start()
	#else:
	#	$Timer.stop()
	pass

func _on_counter_count_changed(current_count):
	if enable_sounds:
		$ClickSound.play()
	# we can save the value
	


func _on_counter_counter_zeroed(last_count):
	if enable_sounds:
		$SwishSound.play()
	# We can generate some stats when this happens
	# -rolling average
	# -last count history
	pass # Replace with function body.


func _on_button_sound_effects_pressed():
	enable_sounds = not enable_sounds
	
