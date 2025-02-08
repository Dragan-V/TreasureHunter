extends Node

var time_left = 55
var treasures_collected = 0
var total_treasures = 0

@onready var timer_label = $CanvasLayer/TimerLabel
@onready var score_label = $CanvasLayer/ScoreLabel
@onready var overlay = $CanvasLayer/ColorRect
@onready var game_over_label = $CanvasLayer/GameOverLabel

func _ready():
	total_treasures = get_tree().get_nodes_in_group("treasure").size()
	update_score_label()
	overlay.hide()
	game_over_label.hide()
	
func _process(delta):
	if time_left > 0:
		time_left -= delta
		update_timer_label()
	else:
		game_over(false)

func update_timer_label():
	var minutes = int(floor(time_left / 60))
	var seconds = int(floor(time_left)) % 60
	timer_label.text = "%02d:%02d" % [minutes, seconds]

func update_score_label():
	score_label.text = "Treasures: %d/%d" % [treasures_collected, total_treasures]

func collect_treasure():
	treasures_collected += 1
	update_score_label()
	
	if treasures_collected >= total_treasures:
		game_over(true)

func game_over(won: bool):
	get_tree().paused = true
	overlay.show()
	game_over_label.show()
	
	if won:
		game_over_label.text = "Победивте!"
	else:
		game_over_label.text = "Обиди се повторно!"
