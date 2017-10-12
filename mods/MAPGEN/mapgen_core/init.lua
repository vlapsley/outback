--[[
	Mapgen base
--]]


--
-- Aliases for map generators
--

minetest.register_alias("mapgen_stone", "default:stone")
minetest.register_alias("mapgen_dirt", "default:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "default:dirt_with_grass")
minetest.register_alias("mapgen_sand", "default:sand")
minetest.register_alias("mapgen_water_source", "default:water_source")
minetest.register_alias("mapgen_river_water_source", "default:river_water_source")
minetest.register_alias("mapgen_lava_source", "default:lava_source")
minetest.register_alias("mapgen_gravel", "default:gravel")
minetest.register_alias("mapgen_desert_stone", "default:desert_stone")
minetest.register_alias("mapgen_desert_sand", "default:desert_sand")
minetest.register_alias("mapgen_dirt_with_snow", "default:dirt_with_snow")
minetest.register_alias("mapgen_snowblock", "default:snowblock")
minetest.register_alias("mapgen_snow", "default:snow")
minetest.register_alias("mapgen_ice", "default:ice")
minetest.register_alias("mapgen_sandstone", "default:sandstone")

-- Flora
minetest.register_alias("mapgen_tree", "default:tree")
minetest.register_alias("mapgen_leaves", "default:leaves")
minetest.register_alias("mapgen_apple", "default:apple")
minetest.register_alias("mapgen_jungletree", "default:jungletree")
minetest.register_alias("mapgen_jungleleaves", "default:jungleleaves")
minetest.register_alias("mapgen_junglegrass", "default:junglegrass")
minetest.register_alias("mapgen_pine_tree", "default:pine_tree")
minetest.register_alias("mapgen_pine_needles", "default:pine_needles")

-- Dungeons
minetest.register_alias("mapgen_cobble", "default:cobble")
minetest.register_alias("mapgen_stair_cobble", "stairs:stair_cobble")
minetest.register_alias("mapgen_mossycobble", "default:mossycobble")
minetest.register_alias("mapgen_stair_desert_stone", "stairs:stair_desert_stone")
minetest.register_alias("mapgen_sandstonebrick", "default:sandstonebrick")
minetest.register_alias("mapgen_stair_sandstone_block", "stairs:stair_sandstone_block")


-- Mapgen settings
minetest.set_mapgen_setting("mg_flags", "caves,nodungeons,decorations,light", true)


minetest.clear_registered_decorations()
minetest.clear_registered_ores()


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Clay
minetest.register_ore({
	ore_type         = "blob",
	ore              = "default:clay",
	wherein          = {"default:dirt"},
	clust_scarcity   = 16 * 16 * 16,
	clust_size       = 5,
	y_min            = -15,
	y_max            = 64,
	noise_threshold  = 0.0,
	noise_params     = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = -316,
		octaves = 1,
		persist = 0.0
	},
})

-- Sand
minetest.register_ore({
	ore_type         = "blob",
	ore              = "default:sand",
	wherein          = {"default:stone", "default:sandstone"},
	clust_scarcity   = 16 * 16 * 16,
	clust_size       = 5,
	y_min            = -31,
	y_max            = 12,
	noise_threshold  = 0.0,
	noise_params     = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = 2316,
		octaves = 1,
		persist = 0.0
	},
})

-- Dirt
minetest.register_ore({
	ore_type         = "blob",
	ore              = "default:dirt",
	wherein          = {"default:stone"},
	clust_scarcity   = 16 * 16 * 16,
	clust_size       = 5,
	y_min            = -31,
	y_max            = 31000,
	noise_threshold  = 0.0,
	noise_params     = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = 17676,
		octaves = 1,
		persist = 0.0
	},
})

-- Gravel
minetest.register_ore({
	ore_type         = "blob",
	ore              = "default:gravel",
	wherein          = {"default:stone"},
	clust_scarcity   = 16 * 16 * 16,
	clust_size       = 5,
	y_min            = -31000,
	y_max            = 31000,
	noise_threshold  = 0.0,
	noise_params     = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = 766,
		octaves = 1,
		persist = 0.0
	},
})

-- Diorite
minetest.register_ore({
	ore_type       = "blob",
	ore            = "australia:diorite",
	wherein        = {"default:stone"},
	clust_scarcity = 15*15*15,
	clust_num_ores = 33,
	clust_size     = 5,
	y_min          = -31000,
	y_max          = 31000,
})

minetest.register_ore({
	ore_type       = "blob",
	ore            = "australia:diorite",
	wherein        = {"default:stone"},
	clust_scarcity = 10*10*10,
	clust_num_ores = 58,
	clust_size     = 7,
	y_min          = -31000,
	y_max          = 31000,
})

-- Granite
minetest.register_ore({
	ore_type       = "blob",
	ore            = "technic:granite",
	wherein        = {"default:stone"},
	clust_scarcity = 15*15*15,
	clust_num_ores = 33,
	clust_size     = 5,
	y_min          = -31000,
	y_max          = 31000,
})

minetest.register_ore({
	ore_type       = "blob",
	ore            = "technic:granite",
	wherein        = {"default:stone"},
	clust_scarcity = 10*10*10,
	clust_num_ores = 58,
	clust_size     = 7,
	y_min          = -31000,
	y_max          = 31000,
})


--[[
	Trees
--]]

--Palm trees on beaches in warmer biomes
biome_lib:register_generate_plant({
	surface = {"default:sand"},
	max_count = 4,
	rarity = 33,
	seed_diff = 330,
	min_elevation = -1,
    max_elevation = 3,
	near_nodes = {"default:water_source"},
	near_nodes_size = 15,
	near_nodes_count = 10,
	temp_min = -0.2,
	},
	aus.palm_model
)

