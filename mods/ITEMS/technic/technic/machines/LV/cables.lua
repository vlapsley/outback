
minetest.register_alias("lv_cable", "technic:lv_cable")

minetest.register_craft({
	output = 'technic:lv_cable 6',
	recipe = {
		{'base:paper',        'base:paper',        'base:paper'},
		{'base:copper_ingot', 'base:copper_ingot', 'base:copper_ingot'},
		{'base:paper',        'base:paper',        'base:paper'},
	}
}) 

technic.register_cable("LV", 2/16)

