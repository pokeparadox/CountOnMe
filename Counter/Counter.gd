extends VBoxContainer

@export var max_digits : int = 8
var count : int = 0
 
signal count_changed(current_count : int)
signal counter_zeroed(last_count : int)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_label()

func set_label() -> void:
	$LabelCount.text = str(count).pad_zeros(max_digits)

func _on_button_count_pressed():
	emit_signal("count_changed", count)
	count += 1
	set_label()


func _on_button_rezero_pressed():
	emit_signal("counter_zeroed", count)
	count = 0
	set_label()
