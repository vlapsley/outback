
local S = mobs.intllib

-- name tag
minetest.register_craftitem("mobs:nametag", {
	description = S("Name Tag"),
	inventory_image = "mobs_nametag.png",
})

if minetest.get_modpath("dye") and minetest.get_modpath("farming") then
	minetest.register_craft({
		type = "shapeless",
		output = "mobs:nametag",
		recipe = {"core:paper", "dye:black", "farming:string"},
	})
end

-- leather
minetest.register_craftitem("mobs:leather", {
	description = S("Leather"),
	inventory_image = "mobs_leather.png",
})

-- raw meat
minetest.register_craftitem("mobs:meat_raw", {
	description = S("Raw Meat"),
	inventory_image = "mobs_meat_raw.png",
	on_use = minetest.item_eat(3),
})

-- cooked meat
minetest.register_craftitem("mobs:meat", {
	description = S("Meat"),
	inventory_image = "mobs_meat.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:meat",
	recipe = "mobs:meat_raw",
	cooktime = 5,
})

-- lasso
minetest.register_tool("mobs:lasso", {
	description = S("Lasso (right-click animal to put in inventory)"),
	inventory_image = "mobs_magic_lasso.png",
})

if minetest.get_modpath("farming") then
	minetest.register_craft({
		output = "mobs:lasso",
		recipe = {
			{"farming:string", "", "farming:string"},
			{"", "core:diamond", ""},
			{"farming:string", "", "farming:string"},
		}
	})
end

minetest.register_alias("mobs:magic_lasso", "mobs:lasso")

-- net
minetest.register_tool("mobs:net", {
	description = S("Net (right-click animal to put in inventory)"),
	inventory_image = "mobs_net.png",
})

if minetest.get_modpath("farming") then
	minetest.register_craft({
		output = "mobs:net",
		recipe = {
			{"group:stick", "", "group:stick"},
			{"group:stick", "", "group:stick"},
			{"farming:string", "group:stick", "farming:string"},
		}
	})
end

-- shears (right click to shear animal)
minetest.register_tool("mobs:shears", {
	description = S("Steel Shears (right-click to shear)"),
	inventory_image = "mobs_shears.png",
})

minetest.register_craft({
	output = 'mobs:shears',
	recipe = {
		{'', 'core:steel_ingot', ''},
		{'', 'group:stick', 'core:steel_ingot'},
	}
})

-- protection rune
minetest.register_craftitem("mobs:protector", {
	description = S("Mob Protection Rune"),
	inventory_image = "mobs_protector.png",
})

minetest.register_craft({
	output = "mobs:protector",
	recipe = {
		{"core:stone", "core:stone", "core:stone"},
		{"core:stone", "core:goldblock", "core:stone"},
		{"core:stone", "core:stone", "core:stone"},
	}
})

-- saddle
minetest.register_craftitem("mobs:saddle", {
	description = S("Saddle"),
	inventory_image = "mobs_saddle.png"
})

minetest.register_craft({
	output = "mobs:saddle",
	recipe = {
		{"mobs:leather", "mobs:leather", "mobs:leather"},
		{"mobs:leather", "core:steel_ingot", "mobs:leather"},
		{"mobs:leather", "core:steel_ingot", "mobs:leather"},
	}
})
