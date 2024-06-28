class_name AutoFontLabel extends Label
## Label que escola o tamanho da fonte automaticamente entre o tamanho mínimo [member AutoFontLabel.min_size] e máximo [member AutoFontLabel.max_size]

## Smallest possible font size text can be in the label.
@export var min_size := 20

## Largest possible font size text can be in the label, also default font size when there is not much text.
@export var max_size := 60


func _ready():
	# Clip text must be true otherwise label just resizes rather than hiding lines,
	# which the update_font_size function relies on to resize font.
	clip_text = true
	autowrap_mode = TextServer.AUTOWRAP_WORD_SMART


func _set(property, value):
	if property == "text":
		text = value
		add_theme_font_size_override("font_size", max_size)
		update_font_size()
		return true
	
	return false


func update_font_size():
	var font_size = get_theme_font_size("font_size")
	
	while get_visible_line_count() < get_line_count():
		font_size -= 1
		
		add_theme_font_size_override("font_size", font_size)
