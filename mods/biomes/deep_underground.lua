--[[
	Deep Underground
--]]


-- deep_underground
minetest.register_biome({
	name =           "deep_underground",
	node_stone =     "default:stone",
	y_max =          -1072,
	y_min =          -31000,
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
	biomes =         {"deep_underground"},
	clust_scarcity = 5832,
	clust_num_ores = 33,
	clust_size =     5,
	y_max =          -1072,
	y_min =          -31000,
})

minetest.register_ore({
	ore_type =       "blob",
	ore =            "outback:basalt",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 1728,
	clust_num_ores = 58,
	clust_size =     7,
	y_max =          -1072,
	y_min =          -31000,
})

-- Shale
minetest.register_ore({
	ore_type =       "blob",
	ore =            "outback:shale",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 15625,
	clust_num_ores = 6,
	clust_size =     3,
	y_max =          -1072,
	y_min =          -31000,
})

-- Slate
minetest.register_ore({
	ore_type =       "blob",
	ore =            "outback:slate",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 64000,
	clust_num_ores = 6,
	clust_size =     3,
	y_max =          -1072,
	y_min =          -31000,
})

-- Chromium
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "technic:mineral_chromium",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 2197,
	clust_num_ores = 5,
	clust_size =     3,
	y_max =          -1072,
	y_min =          -31000,
})

-- Coal
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "default:stone_with_coal",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 13824,
	clust_num_ores = 27,
	clust_size =     6,
	y_max =          -1072,
	y_min =          -31000,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:diorite_with_coal",
	wherein =        {"outback:diorite"},
	biomes =         {"deep_underground"},
	clust_scarcity = 13824,
	clust_num_ores = 27,
	clust_size =     6,
	y_max =          -1072,
	y_min =          -31000,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "default:stone_with_coal",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 512,
	clust_num_ores = 8,
	clust_size =     3,
	y_max =          -1072,
	y_min =          -31000,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:diorite_with_coal",
	wherein =        {"outback:diorite"},
	biomes =         {"deep_underground"},
	clust_scarcity = 512,
	clust_num_ores = 8,
	clust_size =     3,
	y_max =          -1072,
	y_min =          -31000,
})

-- Copper
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "default:stone_with_copper",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 729,
	clust_num_ores = 5,
	clust_size =     3,
	y_max =          -1072,
	y_min =          -31000,
})

-- Diamond
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "default:stone_with_diamond",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 4913,
	clust_num_ores = 4,
	clust_size =     3,
	y_max =          -1072,
	y_min =          -1607,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "default:stone_with_diamond",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 4,
	clust_size =     3,
	y_max =          -1608,
	y_min =          -31000,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:basalt_with_diamond",
	wherein =        {"outback:basalt"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 4,
	clust_size =     3,
	y_max =          -1608,
	y_min =          -31000,
})

-- Gold
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "default:stone_with_gold",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 2197,
	clust_num_ores = 5,
	clust_size =     3,
	y_max =          -1072,
	y_min =          -31000,
})

-- Iron
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "default:stone_with_iron",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 343,
	clust_num_ores = 5,
	clust_size =     3,
	y_max =          -1072,
	y_min =          -31000,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:granite_with_iron",
	wherein =        {"technic:granite"},
	biomes =         {"deep_underground"},
	clust_scarcity = 343,
	clust_num_ores = 5,
	clust_size =     3,
	y_max =          -1072,
	y_min =          -31000,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "default:stone_with_iron",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 13824,
	clust_num_ores = 27,
	clust_size =     6,
	y_max =          -1072,
	y_min =          -31000,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:granite_with_iron",
	wherein =        {"technic:granite"},
	biomes =         {"deep_underground"},
	clust_scarcity = 13824,
	clust_num_ores = 27,
	clust_size =     6,
	y_max =          -1072,
	y_min =          -31000,
})

-- Silver
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_silver",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 2197,
	clust_num_ores = 5,
	clust_size =     3,
	y_max =          -1072,
	y_min =          -31000,
})

-- Tin
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "default:stone_with_tin",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 1000,
	clust_num_ores = 5,
	clust_size =     3,
	y_max =          -1072,
	y_min =          -31000,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:granite_with_tin",
	wherein =        {"technic:granite"},
	biomes =         {"deep_underground"},
	clust_scarcity = 1000,
	clust_num_ores = 5,
	clust_size =     3,
	y_max =          -1072,
	y_min =          -31000,
})

-- Agate
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_agate",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          -1072,
	y_min =          -31000,
})

-- Amethyst
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_amethyst",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          -1072,
	y_min =          -31000,
})

-- Citrine
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_citrine",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          -1072,
	y_min =          -31000,
})

-- Emerald
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_emerald",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          -1072,
	y_min =          -31000,
})

-- Jade
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_jade",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          -1072,
	y_min =          -31000,
})

-- Ruby
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_ruby",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          -1072,
	y_min =          -31000,
})

-- Sapphire
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_sapphire",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          -1072,
	y_min =          -31000,
})

-- Smoky Quartz
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_smoky_quartz",
	wherein =        {"default:stone"},
	biomes =         {"deep_underground"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          -1072,
	y_min =          -31000,
})
