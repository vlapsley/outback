--[[
	Mapgen base
--]]


--
-- Aliases for map generator outputs
--

minetest.register_alias("mapgen_stone", "base:stone")
minetest.register_alias("mapgen_dirt", "base:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "base:dirt_with_grass")
minetest.register_alias("mapgen_sand", "base:sand")
minetest.register_alias("mapgen_water_source", "base:water_source")
minetest.register_alias("mapgen_river_water_source", "base:river_water_source")
minetest.register_alias("mapgen_lava_source", "base:lava_source")
minetest.register_alias("mapgen_gravel", "base:gravel")
minetest.register_alias("mapgen_desert_stone", "base:desert_stone")
minetest.register_alias("mapgen_desert_sand", "base:desert_sand")
minetest.register_alias("mapgen_dirt_with_snow", "base:dirt_with_snow")
minetest.register_alias("mapgen_snowblock", "base:snowblock")
minetest.register_alias("mapgen_snow", "base:snow")
minetest.register_alias("mapgen_ice", "base:ice")
minetest.register_alias("mapgen_sandstone", "base:sandstone")

-- Flora
minetest.register_alias("mapgen_tree", "base:tree")
minetest.register_alias("mapgen_leaves", "base:leaves")
minetest.register_alias("mapgen_apple", "base:apple")
minetest.register_alias("mapgen_jungletree", "base:jungletree")
minetest.register_alias("mapgen_jungleleaves", "base:jungleleaves")
minetest.register_alias("mapgen_junglegrass", "base:junglegrass")
minetest.register_alias("mapgen_pine_tree", "base:pine_tree")
minetest.register_alias("mapgen_pine_needles", "base:pine_needles")

-- Dungeons
minetest.register_alias("mapgen_cobble", "base:cobble")
minetest.register_alias("mapgen_stair_cobble", "stairs:stair_cobble")
minetest.register_alias("mapgen_mossycobble", "base:mossycobble")
minetest.register_alias("mapgen_stair_desert_stone", "stairs:stair_desert_stone")
minetest.register_alias("mapgen_sandstonebrick", "base:sandstonebrick")
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
	ore              = "base:clay",
	wherein          = {"base:dirt"},
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
	ore              = "base:sand",
	wherein          = {"base:stone", "base:sandstone"},
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
	ore              = "base:dirt",
	wherein          = {"base:stone"},
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
	ore              = "base:gravel",
	wherein          = {"base:stone"},
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
	ore            = "base:diorite",
	wherein        = {"base:stone"},
	clust_scarcity = 15*15*15,
	clust_num_ores = 33,
	clust_size     = 5,
	y_min          = -31000,
	y_max          = 31000,
})

minetest.register_ore({
	ore_type       = "blob",
	ore            = "base:diorite",
	wherein        = {"base:stone"},
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
	wherein        = {"base:stone"},
	clust_scarcity = 15*15*15,
	clust_num_ores = 33,
	clust_size     = 5,
	y_min          = -31000,
	y_max          = 31000,
})

minetest.register_ore({
	ore_type       = "blob",
	ore            = "technic:granite",
	wherein        = {"base:stone"},
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
	surface = {"base:sand"},
	max_count = 4,
	rarity = 33,
	seed_diff = 330,
	min_elevation = -1,
    max_elevation = 3,
	near_nodes = {"base:water_source"},
	near_nodes_size = 15,
	near_nodes_count = 10,
	temp_min = -0.2,
	},
	base.palm_model
)

