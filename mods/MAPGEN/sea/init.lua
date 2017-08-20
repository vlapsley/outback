--[[
	Sea
--]]



--
-- Corals
--

minetest.register_node("sea:coral_brown", {
	description = "Brown Coral",
	tiles = {"sea_coral_brown.png"},
	groups = {cracky = 3},
	drop = "sea:coral_skeleton",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("sea:coral_orange", {
	description = "Orange Coral",
	tiles = {"sea_coral_orange.png"},
	groups = {cracky = 3},
	drop = "sea:coral_skeleton",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("sea:coral_skeleton", {
	description = "Coral Skeleton",
	tiles = {"sea_coral_skeleton.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})


--
-- Coral death near air
--

minetest.register_abm({
	nodenames = {"sea:coral_brown", "sea:coral_orange"},
	neighbors = {"air"},
	interval = 17,
	chance = 5,
	catch_up = false,
	action = function(pos, node)
		minetest.set_node(pos, {name = "sea:coral_skeleton"})
	end,
})


-- Coral
minetest.register_decoration({
	deco_type =     "schematic",
	place_on =      {"default:sand"},
	noise_params =  {
		offset =   -0.004,
		scale =    0.1,
		spread =   {x = 200, y = 200, z = 200},
		seed =     7013,
		octaves =  3,
		persist =  0.7,
	},
	biomes =        {"great_barrier_reef"},
	y_min =         -12,
	y_max =         -2,
	schematic =     minetest.get_modpath("sea") .. "/schematics/corals.mts",
	flags =         "place_center_x, place_center_z",
	rotation =      "random",
})
