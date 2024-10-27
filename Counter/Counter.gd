extends VBoxContainer

@export var max_digits : int = 8
var count : int = 0

enum COUNT_MODE
{
	COUNT,
	BPM
}
var count_mode : COUNT_MODE = COUNT_MODE.COUNT

signal count_changed(current_count : int)
signal counter_zeroed(last_count : int)

var BpmCalc = preload("res://bpm_calc.gd")
var _bpm_calc : BpmCalc
# Called when the node enters the scene tree for the first time.
func _ready():
	set_label()
	_bpm_calc = BpmCalc.new()

func set_label() -> void:
	if count_mode == COUNT_MODE.COUNT:
		$LabelCount.text = str(count).pad_zeros(max_digits)
	else:
		var format : String = "%" + str(max_digits) + ".3f"
		$LabelCount.text = format % _bpm_calc.get_current_bpm()

func _on_button_count_pressed():
	emit_signal("count_changed", count)
	if count_mode == COUNT_MODE.BPM:
		_bpm_calc.beat()
	count += 1
	set_label()



func _on_button_rezero_pressed():
	emit_signal("counter_zeroed", count)
	count = 0
	if count_mode == COUNT_MODE.BPM:
		_bpm_calc.reset()
	set_label()


func _on_button_mode_pressed() -> void:
	if count_mode == COUNT_MODE.COUNT:
		$HBoxContainer/ButtonMode.text = "Counter"
		count_mode = COUNT_MODE.BPM
	else:
		$HBoxContainer/ButtonMode.text = "BPM"
		count_mode = COUNT_MODE.COUNT
