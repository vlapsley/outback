--[[
	Pilbara
--]]


-- localize math routines for performance
local math_random = math.random

-- pilbara
minetest.register_biome({
	name =              "pilbara",
	node_top =          "base:red_gravel",
	depth_top =         1,
	node_filler =       "base:red_sandstone",
	depth_filler =      2,
	node_stone =        "base:granite",
	node_river_water =  "base:muddy_water_source",
	node_riverbed =     "base:red_gravel",
	depth_riverbed =    1,
	y_min =             -255,
	y_max =             31000,
	heat_point =        90,
	humidity_point =    39,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Iron
minetest.register_ore({
	ore_type =         "blob",
	ore =              "base:granite_with_iron",
	wherein =          {"base:granite"},
	clust_scarcity =   13824,
	clust_size =       8,
	biomes =           {"pilbara"},
	y_min =            -32,
	y_max =            35,
	noise_threshold =  1,
	noise_params =     {
		offset =   0,
		scale =    3,
		spread =   {x = 16, y = 16, z = 16},
		seed =     895,
		octaves =  3,
		persist =  0.6
	},
})

-- Iron
minetest.register_ore({
	ore_type =         "blob",
	ore =              "base:stone_with_iron",
	wherein =          {"base:stone"},
	clust_scarcity =   13824,
	clust_size =       8,
	biomes =           {"pilbara"},
	y_min =            -255,
	y_max =            -32,
	noise_threshold =  1,
	noise_params =     {
		offset =   0,
		scale =    3,
		spread =   {x = 16, y = 16, z = 16},
		seed =     895,
		octaves =  3,
		persist =  0.6
	},
})


--[[
	Decorations
--]]

-- Grass
local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"base:red_gravel"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"pilbara"},
		y_min =         4,
		y_max =         300,
		decoration =    "base:dry_grass_"..length,
	})
end

register_dry_grass_decoration(0.07, -0.01, 2)
register_dry_grass_decoration(0.09, -0.03, 1)

-- Mitchell Grass
plants_api.register_plant({
	nodes =     {"base:mitchell_grass"},
	cover =     0.001,
	density =   0.001,
	priority =  35,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.1 and pos.y >= 5 and pos.y <= 70 and table.contains({"pilbara"}, t.biome)
	end,
})

-- Pink Mulla Mulla
plants_api.register_plant({
	nodes =     {"flowers:pink_mulla_mulla"},
	cover =     0.0015,
	density =   0.001,
	priority =  30,
	check = function(t, pos)
		return t.v4 > 0.3 and pos.y >= 5 and pos.y <= 70 and table.contains({"pilbara"}, t.biome)
	end,
})

-- Spinifex
minetest.register_decoration({
	deco_type =  "simple",
	place_on =    {"base:red_gravel"},
	sidelen =     80,
	fill_ratio =  0.02,
	biomes =      {"pilbara"},
	y_min =       4,
	y_max =       41,
	decoration =  "base:spinifex",
})

-- Sturt's Desert Pea
plants_api.register_plant({
	nodes =     {"flowers:sturts_desert_pea"},
	cover =     0.001,
	density =   0.2,
	priority =  30,
	check = function(t, pos)
		return t.v2 > 0.1 and t.v4 > 0.5 and t.v3 < 40 and pos.y >= 5 and pos.y <= 50 and table.contains({"pilbara"}, t.biome)
	end,
})

-- Small red rocks
local function register_small_red_rocks(number)
	minetest.register_decoration({
		deco_type =   "simple",
		decoration =  "base:small_red_rocks"..number,
		sidelen =     80,
		place_on =    {"base:red_gravel"},
		fill_ratio =  0.003,
		biomes =      {"pilbara"},
		flags =       "place_center_x, place_center_z",
		rotation =    "random",
	})
end

register_small_red_rocks(6)
register_small_red_rocks(5)
register_small_red_rocks(4)
register_small_red_rocks(3)
register_small_red_rocks(2)
register_small_red_rocks(1)


--[[
	Trees
--]]

-- Desert Oak
plants_api.register_plant({
	nodes = {
		trunk =   "base:desert_oak_tree",
		leaves =  "base:desert_oak_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0025,
	density =   0.001,
	priority =  50,
	check = function(t, pos)
		return pos.y >= 25 and pos.y <= 70 and table.contains({"pilbara"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(4, 8)
		local radius =  math_random(2, 4)
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Wirewood
plants_api.register_plant({
	nodes = {
		trunk =   "base:wirewood_tree",
		leaves =  "base:wirewood_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover = 0.001,
	density = 0.001,
	priority = 55,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y <= 75 and table.contains({"pilbara"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(6, 8)
		local radius =  2
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Wirewood
plants_api.register_plant({
	nodes = {
		trunk =   "base:wirewood_tree",
		leaves =  "base:wirewood_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.001,
	priority =  45,
	check = function(t, pos)
		return t.v4 > 0.5 and pos.y >= 5 and pos.y <= 75 and table.contains({"pilbara"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(6, 8)
		local radius =  2
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})
