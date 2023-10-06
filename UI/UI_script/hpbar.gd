extends TextureRect

func maxh(value):
	$TextureProgressBar.set_max(value)

func set_value(value):
	$TextureProgressBar.value = value
