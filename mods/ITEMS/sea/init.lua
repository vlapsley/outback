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
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("sea:coral_orange", {
	description = "Orange Coral",
	tiles = {"sea_coral_orange.png"},
	groups = {cracky = 3},
	drop = "sea:coral_skeleton",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("sea:coral_skeleton", {
	description = "Coral Skeleton",
	tiles = {"sea_coral_skeleton.png"},
	groups = {cracky = 3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_alias("default:coral_brown", "sea:coral_brown")
minetest.register_alias("default:coral_orange", "sea:coral_orange")
minetest.register_alias("default:coral_skeleton", "sea:coral_skeleton")

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
	place_on =      {"base:sand"},
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

