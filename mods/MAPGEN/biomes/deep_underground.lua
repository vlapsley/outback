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

-- Shale
minetest.register_ore({
	ore_type =       "blob",
	ore =            "base:shale",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 15625,
	clust_num_ores = 6,
	clust_size =     3,
	y_min =          -31000,
	y_max =          -1072,
})

-- Slate
minetest.register_ore({
	ore_type =       "blob",
	ore =            "base:slate",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 64000,
	clust_num_ores = 6,
	clust_size =     3,
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

-- Copper
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_copper",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 729,
	clust_num_ores = 5,
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

-- Gold
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_gold",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 2197,
	clust_num_ores = 5,
	clust_size =     3,
	y_min =          -31000,
	y_max =          -1072,
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

--Silver
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_silver",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 2197,
	clust_num_ores = 5,
	clust_size =     3,
	y_min =          -31000,
	y_max =          -1072,
})

-- Tin
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_tin",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 1000,
	clust_num_ores = 5,
	clust_size =     3,
	y_min =          -31000,
	y_max =          -1072,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:granite_with_tin",
	wherein =        {"base:granite"},
	biomes =         {"deep_underground"},
	clust_scarcity = 1000,
	clust_num_ores = 5,
	clust_size =     3,
	y_min =          -31000,
	y_max =          -1072,
})

-- Agate
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_agate",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_min =          -31000,
	y_max =          -1072,
})

-- Amethyst
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_amethyst",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_min =          -31000,
	y_max =          -1072,
})

-- Citrine
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_citrine",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_min =          -31000,
	y_max =          -1072,
})

-- Emerald
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_emerald",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_min =          -31000,
	y_max =          -1072,
})

-- Jade
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_jade",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_min =          -31000,
	y_max =          -1072,
})

-- Ruby
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_ruby",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_min =          -31000,
	y_max =          -1072,
})

-- Sapphire
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_sapphire",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_min =          -31000,
	y_max =          -1072,
})

-- Smoky Quartz
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_smoky_quartz",
	wherein =        {"base:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_min =          -31000,
	y_max =          -1072,
})

