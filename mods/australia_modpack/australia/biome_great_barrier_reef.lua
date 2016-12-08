-- mods/australia_modpack/australia/biome_great_barrier_reef.lua

-- Localize math routines for performance.
local math_random = math.random

-- great barrier reef
minetest.register_biome({
	name = "great_barrier_reef",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 2,
	node_stone = "default:stone",
	y_min = -192,
	y_max = 3,
	heat_point = 75,
	humidity_point = 85,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs.

minetest.register_ore({
	ore_type		= "scatter",
	ore				= "australia:woodship",
	wherein			= "default:sand",
	clust_scarcity	= 30 * 30 * 30,
	clust_num_ores	= 1,
	clust_size		= 12,
	biomes			= {"great_barrier_reef"},
	y_min			= -64,
	y_max			= -6,
})


--[[
	Decorations
--]]

-- Narrowleaf Seagrass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:sand"},
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"great_barrier_reef"},
	y_min = -10,
	y_max = -2,
	decoration = "australia:sea_grass",
	flags = "force_placement",
})

-- Coral
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:sand"},
	noise_params = {
		offset = -0.004,
		scale = 0.1,
		spread = {x = 200, y = 200, z = 200},
		seed = 7013,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {"great_barrier_reef"},
	y_min = -12,
	y_max = -2,
	schematic = minetest.get_modpath("default") .. "/schematics/coral_reef.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})


--[[
	Trees
--]]

-- Placeholder for Palm Tree
-- Awaiting a fix for L-system lighting bug #3421.
-- https://github.com/minetest/minetest/issues/3421


--[[
	ABM's
--]]
