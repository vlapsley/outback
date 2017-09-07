--[[
	Underground
--]]


-- underground
minetest.register_biome({
	name =           "underground",
	node_stone =     "base:stone",
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
	wherein =        {"base:stone"},
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
	wherein =        {"base:stone"},
	biomes =         {"underground"},
	clust_scarcity = 2197,
	clust_num_ores = 58,
	clust_size =     7,
	y_min =          -1071,
	y_max =          -256,
})

-- Coal
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_coal",
	wherein =        {"base:stone"},
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

-- Iron
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_iron",
	wherein =        {"base:stone"},
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
	wherein =        {"base:granite"},
	biomes =         {"underground"},
	clust_scarcity = 343,
	clust_num_ores = 5,
	clust_size =     3,
	y_min =          -1071,
	y_max =          -512,
})

