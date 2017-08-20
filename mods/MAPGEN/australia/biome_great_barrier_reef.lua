-- mods/australia_modpack/australia/biome_great_barrier_reef.lua

-- Localize math routines for performance.
local math_random = math.random

-- great barrier reef
minetest.register_biome({
	name =            "great_barrier_reef",
	node_top =        "default:sand",
	depth_top =       3,
	node_filler =     "australia:bluestone",
	depth_filler =    4,
	node_stone =      "default:stone",
	node_riverbed =   "default:sand",
	depth_riverbed =  1,
	y_min =           -192,
	y_max =           3,
	heat_point =      88,
	humidity_point =  73,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs.

minetest.register_ore({
	ore_type =        "scatter",
	ore =             "australia:woodship",
	wherein =         "default:sand",
	clust_scarcity =  30 * 30 * 30,
	clust_num_ores =  1,
	clust_size =      12,
	biomes =          {"great_barrier_reef"},
	y_min =           -64,
	y_max =           -6,
})


--[[
	Decorations
--]]

-- Narrowleaf Seagrass
minetest.register_decoration({
	deco_type =   "simple",
	place_on =    {"default:sand"},
	sidelen =     80,
	fill_ratio =  0.01,
	biomes =      {"great_barrier_reef"},
	y_min =       -10,
	y_max =       -2,
	decoration =  "australia:sea_grass",
	flags =       "force_placement",
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
