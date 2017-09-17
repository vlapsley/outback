local cast_iron_ingot
if minetest.get_modpath("technic_worldgen") then
	cast_iron_ingot = "technic:cast_iron_ingot"
else
	cast_iron_ingot = "base:steel_ingot"
end

minetest.register_craft({
	output = 'technic:iron_chest 1',
	recipe = {
		{cast_iron_ingot,cast_iron_ingot,cast_iron_ingot},
		{cast_iron_ingot,'chests:chest',cast_iron_ingot},
		{cast_iron_ingot,cast_iron_ingot,cast_iron_ingot},
	}
})

minetest.register_craft({
	output = 'technic:iron_locked_chest 1',
	recipe = {
		{cast_iron_ingot,cast_iron_ingot,cast_iron_ingot},
		{cast_iron_ingot,'chests:chest_locked',cast_iron_ingot},
		{cast_iron_ingot,cast_iron_ingot,cast_iron_ingot},
	}
})

minetest.register_craft({
	output = 'technic:iron_locked_chest 1',
	recipe = {
		{'base:steel_ingot'},
		{'technic:iron_chest'},
	}
})

technic.chests:register("Iron", {
	width = 9,
	height = 5,
	sort = true,
	autosort = false,
	infotext = false,
	color = false,
	locked = false,
})

technic.chests:register("Iron", {
	width = 9,
	height = 5,
	sort = true,
	autosort = false,
	infotext = false,
	color = false,
	locked = true,
})

