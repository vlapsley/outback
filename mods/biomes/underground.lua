--[[
	Underground
--]]


-- underground
minetest.register_biome({
	name =           "underground",
	node_stone =     "default:stone",
	y_max =          -32,
	y_min =          -1071,
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
	ore =            "outback:basalt",
	wherein =        {"default:stone"},
	biomes =         {"underground"},
	clust_scarcity = 6858,
	clust_num_ores = 33,
	clust_size =     5,
	y_max =          -256,
	y_min =          -1071,
})

minetest.register_ore({
	ore_type =       "blob",
	ore =            "outback:basalt",
	wherein =        {"default:stone"},
	biomes =         {"underground"},
	clust_scarcity = 2197,
	clust_num_ores = 58,
	clust_size =     7,
	y_max =          -256,
	y_min =          -1071,
})

-- Shale
minetest.register_ore({
	ore_type =       "blob",
	ore =            "outback:shale",
	wherein =        {"default:stone"},
	biomes =         {"underground"},
	clust_scarcity = 27000,
	clust_num_ores = 6,
	clust_size =     3,
	y_max =          -256,
	y_min =          -1071,
})

-- Slate
minetest.register_ore({
	ore_type =       "blob",
	ore =            "outback:slate",
	wherein =        {"default:stone"},
	biomes =         {"underground"},
	clust_scarcity = 27000,
	clust_num_ores = 6,
	clust_size =     3,
	y_max =          -256,
	y_min =          -1071,
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
	y_max =          -512,
	y_min =          -1071,
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
	y_max =          -256,
	y_min =          -1071,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:diorite_with_coal",
	wherein =        {"outback:diorite"},
	biomes =         {"underground"},
	clust_scarcity = 512,
	clust_num_ores = 8,
	clust_size =     3,
	y_max =          -256,
	y_min =          -1071,
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
	y_max =          -384,
	y_min =          -1071,
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
	y_max =          -512,
	y_min =          -1071,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:granite_with_iron",
	wherein =        {"technic:granite"},
	biomes =         {"underground"},
	clust_scarcity = 343,
	clust_num_ores = 5,
	clust_size =     3,
	y_max =          -512,
	y_min =          -1071,
})

-- Silver
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_silver",
	wherein =        {"default:stone"},
	biomes =         {"underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          -512,
	y_min =          -1071,
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
	y_max =          -512,
	y_min =          -1071,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:granite_with_tin",
	wherein =        {"technic:granite"},
	biomes =         {"underground"},
	clust_scarcity = 2197,
	clust_num_ores = 4,
	clust_size =     3,
	y_max =          -512,
	y_min =          -1071,
})
