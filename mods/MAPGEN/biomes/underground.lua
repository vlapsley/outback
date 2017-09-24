--[[
	Underground
--]]


-- underground
minetest.register_biome({
	name =           "underground",
	node_stone =     "default:stone",
	y_min =          -1071,
	y_max =          -32,
	heat_point =     50,
	humidity_point = 50,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Basalt
minetest.register_ore({
	ore_type =       "blob",
	ore =            "base:basalt",
	wherein =        {"default:stone"},
	biomes =         {"underground"},
	clust_scarcity = 6858,
	clust_num_ores = 33,
	clust_size =     5,
	y_min =          -1071,
	y_max =          -256,
})

minetest.register_ore({
	ore_type =       "blob",
	ore =            "base:basalt",
	wherein =        {"default:stone"},
	biomes =         {"underground"},
	clust_scarcity = 2197,
	clust_num_ores = 58,
	clust_size =     7,
	y_min =          -1071,
	y_max =          -256,
})

-- Shale
minetest.register_ore({
	ore_type =       "blob",
	ore =            "base:shale",
	wherein =        {"default:stone"},
	biomes =         {"underground"},
	clust_scarcity = 27000,
	clust_num_ores = 6,
	clust_size =     3,
	y_min =          -1071,
	y_max =          -256,
})

-- Slate
minetest.register_ore({
	ore_type =       "blob",
	ore =            "base:slate",
	wherein =        {"default:stone"},
	biomes =         {"underground"},
	clust_scarcity = 27000,
	clust_num_ores = 6,
	clust_size =     3,
	y_min =          -1071,
	y_max =          -256,
})

-- Chromium
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "technic:mineral_chromium",
	wherein =        {"default:stone"},
	biomes =         {"underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_min =          -1071,
	y_max =          -512,
})

-- Coal
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "default:stone_with_coal",
	wherein =        {"default:stone"},
	biomes =         {"underground"},
	clust_scarcity = 512,
	clust_num_ores = 8,
	clust_size =     3,
	y_min =          -1071,
	y_max =          -256,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:diorite_with_coal",
	wherein =        {"base:diorite"},
	biomes =         {"underground"},
	clust_scarcity = 512,
	clust_num_ores = 8,
	clust_size =     3,
	y_min =          -1071,
	y_max =          -256,
})

--Copper
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "default:stone_with_copper",
	wherein =        {"default:stone"},
	biomes =         {"underground"},
	clust_scarcity = 1728,
	clust_num_ores = 4,
	clust_size =     3,
	y_min =          -1071,
	y_max =          -384,
})

-- Iron
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "default:stone_with_iron",
	wherein =        {"default:stone"},
	biomes =         {"underground"},
	clust_scarcity = 343,
	clust_num_ores = 5,
	clust_size =     3,
	y_min =          -1071,
	y_max =          -512,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:granite_with_iron",
	wherein =        {"technic:granite"},
	biomes =         {"underground"},
	clust_scarcity = 343,
	clust_num_ores = 5,
	clust_size =     3,
	y_min =          -1071,
	y_max =          -512,
})

-- Silver
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_silver",
	wherein =        {"default:stone"},
	biomes =         {"underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_min =          -1071,
	y_max =          -512,
})

-- Tin
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "default:stone_with_tin",
	wherein =        {"default:stone"},
	biomes =         {"underground"},
	clust_scarcity = 2197,
	clust_num_ores = 4,
	clust_size =     3,
	y_min =          -1071,
	y_max =          -512,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:granite_with_tin",
	wherein =        {"technic:granite"},
	biomes =         {"underground"},
	clust_scarcity = 2197,
	clust_num_ores = 4,
	clust_size =     3,
	y_min =          -1071,
	y_max =          -512,
})

