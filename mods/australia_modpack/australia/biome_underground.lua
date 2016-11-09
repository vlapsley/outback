-- mods/australia/biome_underground.lua

-- localize math routines for performance
local math_random = math.random

-- underground
minetest.register_biome({
	name = "underground",
	--node_dust = "",
	--node_top = "",
	--depth_top = ,
	--node_filler = "",
	--depth_filler = ,
	node_stone = "default:stone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = -31000,
	y_max = -193,
	heat_point = 50,
	humidity_point = 50,
})



--
-- Ores
--

-- Blob ore first to avoid other ores inside blobs

-- Bluestone (Basalt)
minetest.register_ore({
	ore_type        = "blob",
	ore             = "australia:bluestone",
	wherein         = {"default:stone"},
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 8,
	biomes          = {"underground"},
	y_min           = -31000,
	y_max           = -193,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = 677,
		octaves = 1,
		persist = 0.0
	},
})
