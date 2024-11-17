extends ProgressBar

# 定义变量
var max_hp = 30
var current_hp = 30
var damage_timer = 10.0  # 每 10 秒掉血一次
var heal_amount = 5  # 每次吃鱼恢复的血量

# 引用血条节点
@onready var hp_bar = $Control/HPBar

# 游戏逻辑定时器
var damage_timer_active = true  # 掉血计时是否开启

# 游戏初始化
func _ready():
	hp_bar.max_value = max_hp
	hp_bar.value = current_hp
	start_damage_timer()

# 每 10 秒减少一格血量
func start_damage_timer():
	damage_timer_active = true
	_damage_tick()

# 模拟血量递减
func _damage_tick():
	if damage_timer_active:
		current_hp -= 1
		update_hp_bar()
		if current_hp <= 0:
			on_player_death()
		else:
			await get_tree().create_timer(damage_timer).timeout
			_damage_tick()

# 更新血条 UI
func update_hp_bar():
	hp_bar.value = current_hp

# 玩家死亡逻辑
func on_player_death():
	damage_timer_active = false
	show_death_popup()

# 恢复血量（吃鱼触发）
func heal_hp():
	current_hp = min(current_hp + heal_amount, max_hp)
	update_hp_bar()

# 显示死亡弹窗
func show_death_popup():
	var popup = $Control/DeathPopup  # 假设弹窗节点在场景树下
	popup.visible = true
  $"Control/DeathPopup/RestartButton".pressed.connect(_restart_game)


# 重置游戏逻辑
func _restart_game():
	current_hp = max_hp
	update_hp_bar()
	damage_timer_active = true
	_damage_tick()
	$Control/DeathPopup.visible = false
