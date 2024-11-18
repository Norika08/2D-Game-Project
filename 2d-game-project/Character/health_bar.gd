extends ProgressBar


# 最大血量和当前血量
var max_hp = 30
var current_hp = 30

# 定时掉血逻辑
var damage_timer = 10.0  # 每 10 秒掉一格血量
var damage_timer_active = true

# 初始化
func _ready():
	set_max_hp(max_hp)
	set_hp(current_hp)
	start_damage_timer()

# 设置最大血量
func set_max_hp(value):
	max_hp = value
	self.max_value = max_hp  # 设置血条最大值

# 设置当前血量
func set_hp(value):
	current_hp = clamp(value, 0, max_hp)  # 限制在 0 到 max_hp 范围
	self.value = current_hp  # 更新血条显示
	if current_hp <= 0:
		on_player_death()

# 定时掉血
func start_damage_timer():
	damage_timer_active = true
	_damage_tick()

func _damage_tick():
	while damage_timer_active:
		set_hp(current_hp - 1)  # 减少 1 格血量
		if current_hp <= 0:
			damage_timer_active = false
			break
		await get_tree().create_timer(damage_timer).timeout

# 恢复血量
func heal_hp(amount):
	set_hp(current_hp + amount)

# 玩家死亡逻辑
func on_player_death():
	print("Player is dead!")
	damage_timer_active = false
	# 在此触发游戏死亡弹窗或其他逻辑
