extends Node
class_name BpmCalc

var sample_window_size : int = 5
var beats = []
var _index : int = 0
var _has_enough_beats : bool = false

func _init() -> void:
	beats.resize(sample_window_size)

func beat() -> void:
	beats[_index] = Time.get_ticks_msec()
	if _index == sample_window_size-1:
		_has_enough_beats = true
	_index = (_index + 1) % sample_window_size

func reset() -> void:
	_index = 0
	_has_enough_beats = false
	beats.clear()
	
func get_current_bpm() -> float:
	if _has_enough_beats:
		var current_ticks : int = Time.get_ticks_msec()
		var oldest_ticks : int = beats[_index]
		var average_ticks = float((current_ticks - oldest_ticks)/float(sample_window_size))
		return float(60000 / average_ticks)
	return 0
