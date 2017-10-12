if minetest.get_modpath("australia") then
	minetest.register_craft({
		output = 'technic:silver_chest',
		recipe = {
			{'australia:silver_ingot','australia:silver_ingot','australia:silver_ingot'},
			{'australia:silver_ingot','technic:copper_chest','australia:silver_ingot'},
			{'australia:silver_ingot','australia:silver_ingot','australia:silver_ingot'},
		}
	})

	minetest.register_craft({
		output = 'technic:silver_locked_chest',
		recipe = {
			{'australia:silver_ingot','australia:silver_ingot','australia:silver_ingot'},
			{'australia:silver_ingot','technic:copper_locked_chest','australia:silver_ingot'},
			{'australia:silver_ingot','australia:silver_ingot','australia:silver_ingot'},
		}
	})
end

minetest.register_craft({
	output = 'technic:silver_locked_chest',
	recipe = {
		{'default:steel_ingot'},
		{'technic:silver_chest'},
	}
})

technic.chests:register("Silver", {
	width = 12,
	height = 6,
	sort = true,
	autosort = true,
	infotext = true,
	color = false,
	locked = false,
})

technic.chests:register("Silver", {
	width = 12,
	height = 6,
	sort = true,
	autosort = true,
	infotext = true,
	color = false,
	locked = true,
})

