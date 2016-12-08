-- mods/australia_modpack/australia/biome_underground.lua

-- underground
minetest.register_biome({
	name = "underground",
	node_stone = "default:stone",
	y_min = -31000,
	y_max = -193,
	heat_point = 50,
	humidity_point = 50,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Bluestone (Basalt)
minetest.register_ore({
	ore_type		= "blob",
	ore				= "australia:bluestone",
	wherein			= {"default:stone"},
	clust_scarcity	= 16 * 16 * 16,
	clust_size		= 8,
	biomes			= {"underground"},
	y_min			= -31000,
	y_max			= -193,
	noise_threshold	= 0.0,
	noise_params	= {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = 677,
		octaves = 1,
		persist = 0.0
	},
})
