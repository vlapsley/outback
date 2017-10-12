--[[
	Far North Queensland
--]]


-- localize math routines for performance
local math_random = math.random

-- far north queensland
minetest.register_biome({
	name =             "far_north_queensland",
	node_top =         "default:dirt_with_grass",
	depth_top =        1,
	node_filler =      "default:dirt",
	depth_filler =     3,
	node_stone =       "default:stone",
	node_river_water = "default:river_water_source",
	node_riverbed =    "default:sand",
	depth_riverbed =   1,
	y_min =            4,
	y_max =            31000,
	heat_point =       88,
	humidity_point =   73,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Basalt
minetest.register_ore({
	ore_type =       "blob",
	ore =            "australia:basalt",
	wherein =        {"default:stone"},
	biomes =         {"far_north_queensland"},
	clust_scarcity = 3375,
	clust_num_ores = 33,
	clust_size =     5,
	y_min =          -31,
	y_max =          31000,
})

minetest.register_ore({
	ore_type =       "blob",
	ore =            "australia:basalt",
	wherein =        {"default:stone"},
	biomes =         {"far_north_queensland"},
	clust_scarcity = 1000,
	clust_num_ores = 58,
	clust_size =     7,
	y_min =          -31,
	y_max =          31000,
})

-- Aluminium (Weipa / Cape York)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "australia:stone_with_aluminium",
	wherein =        {"default:stone"},
	biomes =         {"far_north_queensland"},
	clust_scarcity = 512,
	clust_num_ores = 5,
	clust_size =     3,
	y_min =          -31,
	y_max =          5,
})


--[[
	Decorations
--]]

-- Grass
local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"default:dirt_with_grass"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"far_north_queensland"},
		y_min =         4,
		y_max =         90,
		decoration =    "default:grass_"..length,
	})
end

local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"default:dirt_with_grass"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"far_north_queensland"},
		y_min =         91,
		y_max =         300,
		decoration =    "default:dry_grass_"..length,
	})
end

register_grass_decoration(-0.03,  0.09,  5)
register_grass_decoration(-0.015, 0.075, 4)
register_grass_decoration(0,      0.06,  3)
register_grass_decoration(0.03,   0.09, 2)
register_grass_decoration(0.06,   0.06,  1)

register_dry_grass_decoration(0.01, 0.05,  5)
register_dry_grass_decoration(0.03, 0.03,  4)
register_dry_grass_decoration(0,    0.06,  3)
register_dry_grass_decoration(0.03, 0.09, 2)
register_dry_grass_decoration(0.06, 0.06,  1)

-- Grass near rivers
local function register_rivergrass(length)
	plants_api.register_plant({
		nodes =     {"default:grass_"..length},
		cover =     0.33,
		density =   0.5,
		priority =  25,
		check = function(t, pos)
			return t.v2 > 0 and t.v2 < 0.03 and pos.y >= 4 and pos.y <= 300 and table.contains({"far_north_queensland"}, t.biome)
		end,
	})
end

register_rivergrass(5)
register_rivergrass(4)

-- Cooktown Orchid
plants_api.register_plant({
	nodes =     {"flowers:cooktown_orchid"},
	cover =     0.0015,
	density =   0.01,
	priority =  35,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 40 and table.contains({"far_north_queensland"}, t.biome)
	end,
})

-- Waterlily
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {
			"default:dirt",
			"default:sand",
	},
	sidelen = 80,
	fill_ratio =  0.3,
	biomes = {"far_north_queensland"},
	y_min = 0,
	y_max = 96,
	schematic = minetest.get_modpath("flowers") .. "/schematics/waterlily.mts",
	rotation = "random",
})

-- Small stone rocks
local function register_small_stone_rocks(number)
	minetest.register_decoration({
		deco_type =   "simple",
		decoration =  "australia:small_stone_rocks"..number,
		sidelen =     80,
		place_on =    {"default:dirt_with_grass"},
		fill_ratio =  0.001,
		y_min =       42,
		biomes =      {"far_north_queensland"},
		flags =       "place_center_x, place_center_z",
		rotation =    "random",
	})
end

register_small_stone_rocks(6)
register_small_stone_rocks(5)
register_small_stone_rocks(4)
register_small_stone_rocks(3)
register_small_stone_rocks(2)
register_small_stone_rocks(1)


--[[
	Trees
--]]

-- Black Wattle
plants_api.register_plant({
	nodes = {
		trunk =   "australia:black_wattle_tree",
		leaves =  "australia:black_wattle_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0025,
	density =   0.005,
	priority =  35,
	check = function(t, pos)
		return pos.y >= 75 and pos.y <= 125 and table.contains({"far_north_queensland"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(5, 7)
		local radius =  3
		aus.make_black_wattle(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Daintree Stringybark
plants_api.register_plant({
	nodes = {
		trunk =   "australia:daintree_stringybark_tree",
		leaves =  "australia:daintree_stringybark_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.00025,
	density =   0.005,
	priority =  45,
	check = function(t, pos)
		return t.valleys > 0.5 and pos.y >= 5 and pos.y <= 76 and table.contains({"far_north_queensland"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(12, 16)
		local radius =  math_random(6, 8)
		local limbs =   true
		aus.make_tall_gum(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Darwin Woollybutt
plants_api.register_plant({
	nodes = {
		trunk =   "australia:darwin_woollybutt_tree",
		leaves =  "australia:darwin_woollybutt_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0001,
	density =   0.001,
	priority =  45,
	check = function(t, pos)
		return t.valleys > 0.5 and pos.y >= 5 and pos.y <= 35 and table.contains({"far_north_queensland"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(7, 12)
		local radius =  math_random(4, 5)
		local limbs =   true
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Fan Palm
plants_api.register_plant({
	nodes = {
		trunk =   "australia:fan_palm_tree",
		leaves =  "australia:fan_palm_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.05,
	density =   0.025,
	priority =  60,
	check = function(t, pos)
		return t.valleys > 0 and t.valleys < 0.5 and pos.y >= 3 and pos.y <= 80 and table.contains({"far_north_queensland"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(5, 7)
		local radius =  3
		aus.make_fan_palm(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Fan Palm
plants_api.register_plant({
	nodes = {
		trunk =   "australia:fan_palm_tree",
		leaves =  "australia:fan_palm_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.025,
	density =   0.0125,
	priority =  55,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y <= 110 and table.contains({"far_north_queensland"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(5, 7)
		local radius =  3
		aus.make_fan_palm(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Illawarra Flame Tree
plants_api.register_plant({
	nodes = {
		trunk =   "australia:illawarra_flame_tree",
		leaves =  "australia:illawarra_flame_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.00025,
	density =   0.0005,
	priority =  45,
	check = function(t, pos)
		return t.valleys > 0.5 and pos.y >= 5 and pos.y <= 100 and table.contains({"far_north_queensland"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(8, 10)
		local radius =  math_random(5, 6)
		local limbs =   true
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Lemon Eucalyptus
plants_api.register_plant({
	nodes = {
		trunk =   "australia:lemon_eucalyptus_tree",
		leaves =  "australia:lemon_eucalyptus_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.005,
	density =   0.02,
	priority =  50,
	check = function(t, pos)
		return t.valleys > 0.5 and t.v4 > 0.5 and pos.y >= 5 and pos.y <= 110 and table.contains({"far_north_queensland"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(10, 15)
		local radius =  math_random(4, 5)
		local limbs =   true
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Lilly Pilly
plants_api.register_plant({
	nodes = {
		trunk =   "australia:lilly_pilly_tree",
		leaves =  "australia:lilly_pilly_leaves",
		fruit =   "australia:lilly_pilly_berries",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0001,
	density =   0.0001,
	priority =  40,
	check = function(t, pos)
		return t.valleys > 0.5 and pos.y >= 5 and pos.y <= 60 and table.contains({"far_north_queensland"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =        math_random(3, 5)
		local radius =        math_random(3, 5)
		local limbs =         nil
		local fruit_chance =  0.3
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})

-- Merbau
plants_api.register_plant({
	nodes = {
		trunk =   "australia:merbau_tree",
		leaves =  "australia:merbau_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.02,
	density =   0.01,
	priority =  50,
	check = function(t, pos)
		return t.valleys > 0 and t.valleys < 0.5 and pos.y >= 4 and pos.y <= 60 and table.contains({"far_north_queensland"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(12, 16)
		local radius =  math_random(4, 5)
		aus.make_merbau(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- River Oak
plants_api.register_plant({
	nodes = {
		trunk =   "australia:river_oak_tree",
		leaves =  "australia:river_oak_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.00025,
	density =   0.0005,
	priority =  30,
	check = function(t, pos)
		return t.valleys > 0.5 and pos.y >= 5 and pos.y <= 120 and table.contains({"far_north_queensland"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(10, 12)
		local radius =  math_random(3, 4)
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- River Oak
plants_api.register_plant({
	nodes = {
		trunk =   "australia:river_oak_tree",
		leaves =  "australia:river_oak_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.005,
	density =   0.0025,
	priority =  30,
	check = function(t, pos)
		return t.valleys > 0.5 and t.v2 > 0 and t.v2 < 0.03 and pos.y >= 5 and pos.y <= 120 and table.contains({"far_north_queensland"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(10, 12)
		local radius =  math_random(3, 4)
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})
