minetest.register_craft({
	output = 'technic:copper_chest 1',
	recipe = {
		{'base:copper_ingot','base:copper_ingot','base:copper_ingot'},
		{'base:copper_ingot','technic:iron_chest','base:copper_ingot'},
		{'base:copper_ingot','base:copper_ingot','base:copper_ingot'},
	}
})

minetest.register_craft({
	output = 'technic:copper_locked_chest 1',
	recipe = {
		{'base:copper_ingot','base:copper_ingot','base:copper_ingot'},
		{'base:copper_ingot','technic:iron_locked_chest','base:copper_ingot'},
		{'base:copper_ingot','base:copper_ingot','base:copper_ingot'},
	}
})

minetest.register_craft({
	output = 'technic:copper_locked_chest 1',
	recipe = {
		{'base:steel_ingot'},
		{'technic:copper_chest'},
	}
})

technic.chests:register("Copper", {
	width = 12,
	height = 5,
	sort = true,
	autosort = true,
	infotext = false,
	color = false,
	locked = false,
})

technic.chests:register("Copper", {
	width = 12,
	height = 5,
	sort = true,
	autosort = true,
	infotext = false,
	color = false,
	locked = true,
})

