extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	reset()

func reset() -> void:
	set_h(0)
	set_m(0)
	set_s(0)
	set_ms(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_ms() -> int:
	return int($LabelMs.text)
	
func get_s() -> int:
	return int($LabelSs.text)
	
func get_m() -> int:
	return int($LabelMm.text)

func get_h() -> int:
	return int($Labelh.text)

func set_ms(ms : int) -> void:
	$LabelMs.text = str(ms).pad_zeros(3)

func set_s(s : int) -> void:
	$LabelSs.text = str(s).pad_zeros(2)

func set_m(m : int) -> void:
	$LabelMm.text = str(m).pad_zeros(2)

func set_h(h : int) -> void:
	$LabelHh.text = str(h).pad_zeros(2)
	
func _on_alternate_timer_millisecond_elapsed(num_ms):
	set_ms(num_ms)


func _on_alternate_timer_second_elapsed(num_s):
	set_s(num_s)


func _on_alternate_timer_minute_elapsed(num_m):
	set_m(num_m)


func _on_alternate_timer_hour_elapsed(num_h):
	set_h(num_h)
