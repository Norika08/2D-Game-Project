extends Area2D

# 恢复的血量
var heal_amount = 3

func _on_body_entered(body):
	if body.name == "Player":
		body.eat_fish(heal_amount)  # 调用玩家的吃鱼逻辑
		queue_free()  # 销毁鱼节点
