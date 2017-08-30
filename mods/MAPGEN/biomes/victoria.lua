--[[
	Victoria
--]]


-- localize math routines for performance
local math_random = math.random

-- victoria
minetest.register_biome({
	name =              "victoria",
	node_top =          "base:dirt_with_grass",
	depth_top =         1,
	node_filler =       "base:dirt",
	depth_filler =      3,
	node_stone =        "base:stone",
	node_river_water =  "base:muddy_water_source",
	node_riverbed =     "base:dirt",
	depth_riverbed =    1,
	y_min =             4,
	y_max =             31000,
	heat_point =        17,
	humidity_point =    18,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Basalt
minetest.register_ore({
	ore_type       = "blob",
	ore            = "base:basalt",
	wherein        = {"base:stone"},
	clust_scarcity = 15*15*15,
	clust_num_ores = 33,
	clust_size     = 5,
	biomes         = {"victoria"},
	y_min          = -255,
	y_max          = 31000,
})

minetest.register_ore({
	ore_type       = "blob",
	ore            = "base:basalt",
	wherein        = {"base:stone"},
	clust_scarcity = 10*10*10,
	clust_num_ores = 58,
	clust_size     = 7,
	biomes         = {"victoria"},
	y_min          = -255,
	y_max          = 31000,
})

-- Gold
minetest.register_ore({
	ore_type =         "vein",
	ore =              "base:stone_with_gold",
	wherein =          {"base:stone"},
	biomes =           {"victoria"},
	y_min =            -192,
	y_max =            44,
	random_factor =    0.23,
	noise_threshold =  0.97,
	noise_params =     {
		offset =   0,
		scale =    3,
		spread =   {x = 73, y = 251, z = 73},
		seed =     894,
		octaves =  4,
		persist =  0.5,
	    flags =    "eased",
	},
})

-- Coal
minetest.register_ore({
	ore_type =                "sheet",
	ore =                     "base:stone_with_coal",
	wherein =                 {"base:stone"},
	column_height_min =       2,
	column_height_max =       4,
	column_midpoint_factor =  0.5,
	biomes =                  {"victoria"},
	y_min =                   -192,
	y_max =                   128,
	noise_threshold =         1.25,
	noise_params =            {
		offset =   0,
		scale =    2,
		spread =   {x = 19, y = 19, z = 11},
		seed =     963,
		octaves =  2,
		persist =  0.8,
	},
})


--[[
	Decorations
--]]

-- Grass
local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"base:dirt_with_grass"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"victoria"},
		y_min =         4,
		y_max =         200,
		decoration =    "base:grass_"..length,
	})
end

register_grass_decoration(-0.03,  0.09,  5)
register_grass_decoration(-0.015, 0.075, 4)
register_grass_decoration(0,      0.06,  3)
register_grass_decoration(0.015,  0.045, 2)
register_grass_decoration(0.03,   0.03,  1)

-- Grass near rivers
local function register_rivergrass(length)
	plants_api.register_plant({
		nodes =     {"base:grass_"..length},
		cover =     0.33,
		density =   0.5,
		priority =  25,
		check = function(t, pos)
			return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 4 and pos.y <= 200 and table.contains({"victoria"}, t.biome)
		end,
	})
end

register_rivergrass(5)
register_rivergrass(4)

-- Red Bottlebrush
plants_api.register_plant({
	nodes = {
		stem =    "base:bush_stem",
		leaves =  "base:red_bottlebrush_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.01,
	density =   0.0025,
	priority =  50,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y <= 100 and table.contains({"victoria"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  1
		local radius =  math_random(2, 3)
		base.make_bush(pos, data, area, height, radius, nodes.stem, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Snow
minetest.register_decoration({
	deco_type =   "simple",
	place_on =    {"base:dirt_with_grass"},
	sidelen =     80,
	fill_ratio =  0.3,
	biomes =      {"victoria"},
	y_min =       140,
	y_max =       31000,
	decoration =  "base:snow",
})

-- Small stone rocks
local function register_small_stone_rocks(number)
	minetest.register_decoration({
		deco_type =   "simple",
		decoration =  "base:small_stone_rocks"..number,
		sidelen =     80,
		place_on =    {"base:dirt_with_grass"},
		fill_ratio =  0.003,
		y_min =       12,
		biomes =      {"victoria"},
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
		trunk =   "base:black_wattle_tree",
		leaves =  "base:black_wattle_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0001,
	density =   0.0001,
	priority =  35,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 5 and pos.y <= 40 and table.contains({"victoria"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(9, 15)
		local radius =  math_random(5, 6)
		base.make_black_wattle(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Black Wattle
plants_api.register_plant({
	nodes = {
		trunk =   "base:black_wattle_tree",
		leaves =  "base:black_wattle_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0001,
	density =   0.0001,
	priority =  35,
	check = function(t, pos)
		return t.v4 < 0.5 and pos.y >= 5 and pos.y <= 40 and table.contains({"victoria"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(9, 15)
		local radius =  math_random(5, 6)
		base.make_black_wattle(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Black Wattle
plants_api.register_plant({
	nodes = {
		trunk =   "base:black_wattle_tree",
		leaves =  "base:black_wattle_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0002,
	density =   0.005,
	priority =  35,
	check = function(t, pos)
		return pos.y >= 41 and pos.y <= 125 and table.contains({"victoria"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(6, 8)
		local radius =  3
		base.make_black_wattle(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Blue Gum
plants_api.register_plant({
	nodes = {
		trunk =   "base:blue_gum_tree",
		leaves =  "base:blue_gum_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.01,
	density =   0.01,
	priority =  80,
	check = function(t, pos)
		return t.valleys > 0 and t.valleys < 0.3 and pos.y >= 5 and pos.y <= 40 and table.contains({"victoria"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(12, 22)
		local radius =  math_random(5, 7)
		local limbs =   true
		base.make_tall_gum(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Blue Gum
plants_api.register_plant({
	nodes = {
		trunk =   "base:blue_gum_tree",
		leaves =  "base:blue_gum_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.01,
	density =   0.01,
	priority =  80,
	check = function(t, pos)
		return t.v4 > 0.5 and pos.y >= 5 and pos.y <= 40 and table.contains({"victoria"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(12, 22)
		local radius =  math_random(5, 7)
		local limbs =   true
		base.make_tall_gum(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Coolabah Tree
plants_api.register_plant({
	nodes = {
		trunk =   "base:coolabah_tree",
		leaves =  "base:coolabah_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.005,
	density =   0.0025,
	priority =  40,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y <= 60 and table.contains({"victoria"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(7, 10)
		local radius =  math_random(4, 5)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Golden Wattle
plants_api.register_plant({
	nodes = {
		trunk =   "base:golden_wattle_tree",
		leaves =  "base:golden_wattle_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0005,
	density =   0.0025,
	priority =  40,
	check = function(t, pos)
		return t.v4 < 0.5 and pos.y >= 5 and pos.y <= 150 and table.contains({"victoria"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 4)
		local radius =  2
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Golden Wattle
plants_api.register_plant({
	nodes = {
		trunk =   "base:golden_wattle_tree",
		leaves =  "base:golden_wattle_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0005,
	density =   0.0025,
	priority =  40,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 5 and pos.y <= 150 and table.contains({"victoria"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 4)
		local radius =  2
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Lilly Pilly
plants_api.register_plant({
	nodes = {
		trunk =   "base:lilly_pilly_tree",
		leaves =  "base:lilly_pilly_leaves",
		fruit =   "base:lilly_pilly_berries",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0001,
	density =   0.001,
	priority =  40,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 60 and table.contains({"victoria"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =        math_random(4, 6)
		local radius =        math_random(4, 6)
		local limbs =         nil
		local fruit_chance =  0.3
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})

-- River Red Gum
plants_api.register_plant({
	nodes = {
		trunk =   "base:river_red_gum_tree",
		leaves =  "base:river_red_gum_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.00025,
	density =   0.0025,
	priority =  70,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.03 and pos.y >= 5 and pos.y <= 72 and table.contains({"victoria"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(12, 18)
		local radius =  math_random(6, 8)
		local limbs =   true
		base.make_river_red_gum(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Snow Gum
plants_api.register_plant({
	nodes = {
		trunk =   "base:snow_gum_tree",
		leaves =  "base:snow_gum_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.025,
	density =   0.05,
	priority =  50,
	check = function(t, pos)
		return pos.y >= 130 and pos.y <= 180 and table.contains({"victoria"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(2, 4)
		local radius =  2
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Swamp Gum (forest)
plants_api.register_plant({
	nodes = {
		trunk =   "base:swamp_gum_tree",
		leaves =  "base:swamp_gum_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.005,
	density =   0.005,
	priority =  65,
	check = function(t, pos)
		return t.valleys > 0 and t.valleys < 0.3 and t.v4 > 0.6 and pos.y >= 45 and pos.y <= 64 and table.contains({"victoria"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(30, 40)
		local radius =  math_random(8, 10)
		local limbs =   true
		base.make_swamp_gum(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- White Box
plants_api.register_plant({
	nodes = {
		trunk =   "base:white_box_tree",
		leaves =  "base:white_box_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0003,
	density =   0.003,
	priority =  75,
	check = function(t, pos)
		return t.valleys > 0.3 and t.v4 < 0.5 and pos.y >= 5 and pos.y <= 40 and table.contains({"victoria"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(7, 12)
		local radius =  math_random(6, 8)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- White Box
plants_api.register_plant({
	nodes = {
		trunk =   "base:white_box_tree",
		leaves =  "base:white_box_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0005,
	density =   0.005,
	priority =  75,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 41 and pos.y <= 145 and table.contains({"victoria"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(7, 12)
		local radius =  math_random(6, 8)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})
