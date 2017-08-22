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
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("sea:coral_orange", {
	description = "Orange Coral",
	tiles = {"sea_coral_orange.png"},
	groups = {cracky = 3},
	drop = "sea:coral_skeleton",
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("sea:coral_skeleton", {
	description = "Coral Skeleton",
	tiles = {"sea_coral_skeleton.png"},
	groups = {cracky = 3},
	sounds = core.node_sound_stone_defaults(),
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
	place_on =      {"core:sand"},
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

--
-- Narrowleaf Seagrass
--

minetest.register_node("sea:sea_grass", {
	description = "Narrowleaf Seagrass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"sea_sea_grass.png"},
	inventory_image = {"sea_sea_grass.png"},
	wield_image = {"sea_sea_grass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	climable = true,
	buildable_to = false,
	drowning = 1,
	is_ground_content = true,
	groups = {snappy = 3, attached_node = 1, sea = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Narrowleaf Seagrass
minetest.register_decoration({
	deco_type =   "simple",
	place_on =    {"core:sand"},
	sidelen =     80,
	fill_ratio =  0.01,
	biomes =      {
		"great_barrier_reef",
		"indian_ocean"
	},
	y_min =       -10,
	y_max =       -2,
	decoration =  "sea:sea_grass",
	flags =       "force_placement",
})

minetest.register_decoration({
	deco_type =   "simple",
	place_on =    {"core:sand"},
	sidelen =     80,
	fill_ratio =  0.02,
	biomes =      {"timor_sea"},
	y_min =       -10,
	y_max =       -2,
	decoration =  "sea:sea_grass",
	flags =       "force_placement",
})

