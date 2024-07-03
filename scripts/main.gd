extends Node

@onready var _MainWindow: Window = get_window()

func _ready():
	#_MainWindow.set_flag(_MainWindow.FLAG_BORDERLESS, true)
	_MainWindow.set_flag(_MainWindow.FLAG_TRANSPARENT, true)
	#_MainWindow.set_transparent_background(true)
