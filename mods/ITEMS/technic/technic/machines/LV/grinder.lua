
minetest.register_alias("grinder", "technic:lv_grinder")
minetest.register_craft({
	output = 'technic:lv_grinder',
	recipe = {
		{'base:desert_stone', 'base:diamond',        'base:desert_stone'},
		{'base:desert_stone', 'technic:machine_casing', 'base:desert_stone'},
		{'technic:granite',      'technic:lv_cable',       'technic:granite'},
	}
})

technic.register_grinder({tier="LV", demand={200}, speed=1})

