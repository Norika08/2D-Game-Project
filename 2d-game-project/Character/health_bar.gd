extends TextureProgressBar

func _ready():
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.2, 0.2, 0.2)  # 背景颜色
	style.border_color = Color(0, 0, 0)    # 边框颜色
	style.border_width_top = 2
	style.border_width_bottom = 2
	style.border_width_left = 2
	style.border_width_right = 2
	style.corner_radius_top_left = 10
	style.corner_radius_top_right = 10
	style.corner_radius_bottom_left = 10
	style.corner_radius_bottom_right = 10
