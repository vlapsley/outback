--[[
	Deep Underground
--]]


-- deep_underground
minetest.register_biome({
	name =           "deep_underground",
	node_stone =     "base:stone",
	y_min =          -31000,
	y_max =          -1072,
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
	biomes =         {"deep_underground"},
	clust_scarcity = 5832,
	clust_num_ores = 33,
	clust_size =     5,
	y_min =          -31000,
	y_max =          -1072,
})

minetest.register_ore({
	ore_type =       "blob",
	ore =            "base:basalt",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 1728,
	clust_num_ores = 58,
	clust_size =     7,
	y_min =          -31000,
	y_max =          -1072,
})

-- Coal
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_coal",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 13824,
	clust_num_ores = 27,
	clust_size =     6,
	y_min =          -31000,
	y_max =          -1072,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:diorite_with_coal",
	wherein =        {"base:diorite"},
	biomes =         {"deep_underground"},
	clust_scarcity = 13824,
	clust_num_ores = 27,
	clust_size =     6,
	y_min =          -31000,
	y_max =          -1072,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_coal",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 512,
	clust_num_ores = 8,
	clust_size =     3,
	y_min =          -31000,
	y_max =          -1072,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:diorite_with_coal",
	wherein =        {"base:diorite"},
	biomes =         {"deep_underground"},
	clust_scarcity = 512,
	clust_num_ores = 8,
	clust_size =     3,
	y_min =          -31000,
	y_max =          -1072,
})

-- Diamond
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_diamond",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 4913,
	clust_num_ores = 4,
	clust_size =     3,
	y_min =          -1607,
	y_max =          -1072,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_diamond",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 4,
	clust_size =     3,
	y_min =          -31000,
	y_max =          -1608,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:basalt_with_diamond",
	wherein =        {"base:basalt"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 4,
	clust_size =     3,
	y_min =          -31000,
	y_max =          -1608,
})

-- Iron
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_iron",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 343,
	clust_num_ores = 5,
	clust_size =     3,
	y_min =          -31000,
	y_max =          -1072,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:granite_with_iron",
	wherein =        {"base:granite"},
	biomes =         {"deep_underground"},
	clust_scarcity = 343,
	clust_num_ores = 5,
	clust_size =     3,
	y_min =          -31000,
	y_max =          -1072,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_iron",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 13824,
	clust_num_ores = 27,
	clust_size =     6,
	y_min =          -31000,
	y_max =          -1072,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:granite_with_iron",
	wherein =        {"base:granite"},
	biomes =         {"deep_underground"},
	clust_scarcity = 13824,
	clust_num_ores = 27,
	clust_size =     6,
	y_min =          -31000,
	y_max =          -1072,
})

