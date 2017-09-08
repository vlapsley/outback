--[[
	Eastern Coasts
--]]


-- localize math routines for performance
local math_random = math.random

-- eastern coasts
minetest.register_biome({
	name =             "eastern_coasts",
	node_top =         "base:dirt_with_grass",
	depth_top =        1,
	node_filler =      "base:dirt",
	depth_filler =     3,
	node_stone =       "base:stone",
	node_river_water = "base:muddy_water_source",
	node_riverbed =    "base:dirt",
	depth_riverbed =   1,
	y_min =            4,
	y_max =            31000,
	heat_point =       7,
	humidity_point =   57,
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
	biomes =         {"eastern_coasts"},
	clust_scarcity = 3375,
	clust_num_ores = 33,
	clust_size =     5,
	y_min =          -31,
	y_max =          31000,
})

minetest.register_ore({
	ore_type =       "blob",
	ore =            "base:basalt",
	wherein =        {"base:stone"},
	biomes =         {"eastern_coasts"},
	clust_scarcity = 1000,
	clust_num_ores = 58,
	clust_size =     7,
	y_min =          -31,
	y_max =          31000,
})

-- Shale
minetest.register_ore({
	ore_type =       "blob",
	ore =            "base:shale",
	wherein =        {"base:stone"},
	biomes =         {"eastern_coasts"},
	clust_scarcity = 15625,
	clust_num_ores = 6,
	clust_size =     3,
	y_min =          -31,
	y_max =          31000,
})

-- Coal
minetest.register_ore({
	ore_type =               "sheet",
	ore =                    "base:stone_with_coal",
	wherein =                {"base:stone"},
	column_height_min =      2,
	column_height_max =      4,
	column_midpoint_factor = 0.5,
	biomes =                 {"eastern_coasts"},
	y_min =                  -31,
	y_max =                  70,
	noise_threshold =        1.25,
	noise_params =           {
		offset =  0,
		scale =   2,
		spread =  {x = 19, y = 19, z = 11},
		seed =    962,
		octaves = 2,
		persist = 0.8,
	},
})


--
-- Decorations
--

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
		biomes =        {"eastern_coasts"},
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
			return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 4 and pos.y <= 200 and table.contains({"eastern_coasts"}, t.biome)
		end,
	})
end

register_rivergrass(5)
register_rivergrass(4)

-- Waratah
plants_api.register_plant({
	nodes = {
		stem =    "base:bush_stem",
		leaves =  "base:waratah_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0001,
	density =   0.025,
	priority =  50,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 5 and pos.y <= 35 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  1
		local radius =  math_random(1, 2)
		base.make_bush(pos, data, area, height, radius, nodes.stem, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Snow
minetest.register_decoration({
	deco_type =   "simple",
	place_on =    {"base:dirt_with_grass"},
	sidelen =     80,
	fill_ratio =  0.3,
	biomes =      {"eastern_coasts"},
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
		y_min =       16,
		biomes =      {"eastern_coasts"},
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
	cover =     0.0002,
	density =   0.002,
	priority =  35,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 50 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(8, 12)
		local radius =  math_random(4, 5)
		base.make_black_wattle(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Black Wattle
plants_api.register_plant({
	nodes = {
		trunk = "base:black_wattle_tree",
		leaves = "base:black_wattle_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0002,
	density =   0.002,
	priority =  35,
	check = function(t, pos)
		return pos.y >= 51 and pos.y <= 125 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(5, 7)
		local radius =  3
		base.make_black_wattle(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Australian Cherry
plants_api.register_plant({
	nodes = {
		trunk = "base:cherry_tree",
		leaves = "base:cherry_leaves",
		fruit = "base:cherry",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.001,
	priority =  30,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 70 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =        math_random(3, 4)
		local radius =        3
		local limbs =         nil
		local fruit_chance =  0.2
		base.make_conifer(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})

-- Coast Banksia (big)
plants_api.register_plant({
	nodes = {
		trunk =   "base:coast_banksia_tree",
		leaves =  "base:coast_banksia_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.001,
	priority =  40,
	check = function(t, pos)
		return t.v2 > 0.5 and pos.y >= 16 and pos.y <= 150 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(7, 12)
		local radius =  math_random(4, 5)
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Coast Banksia (small)
plants_api.register_plant({
	nodes = {
		trunk =   "base:coast_banksia_tree",
		leaves =  "base:coast_banksia_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.001,
	priority =  40,
	check = function(t, pos)
		return pos.y >= 4 and pos.y <= 15 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 5)
		local radius =  math_random(2, 3)
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Coast Banksia (small and along rivers)
plants_api.register_plant({
	nodes = {
		trunk =   "base:coast_banksia_tree",
		leaves =  "base:coast_banksia_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.001,
	priority =  40,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y <= 15 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 5)
		local radius =  math_random(2, 3)
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Coolabah
plants_api.register_plant({
	nodes = {
		trunk =   "base:coolabah_tree",
		leaves =  "base:coolabah_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.0025,
	priority =  40,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y <= 60 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(7, 9)
		local radius =  math_random(4, 5)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Illawarra Flame Tree
plants_api.register_plant({
	nodes = {
		trunk =   "base:illawarra_flame_tree",
		leaves =  "base:illawarra_flame_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.00025,
	density =   0.0005,
	priority =  45,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 100 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(8, 10)
		local radius =  math_random(5, 6)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Lemon Eucalyptus
plants_api.register_plant({
	nodes = {
		trunk =   "base:lemon_eucalyptus_tree",
		leaves =  "base:lemon_eucalyptus_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0005,
	density =   0.002,
	priority =  50,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 110 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(10, 15)
		local radius =  math_random(4, 5)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Lemon Eucalyptus (forest)
plants_api.register_plant({
	nodes = {
		trunk =   "base:lemon_eucalyptus_tree",
		leaves =  "base:lemon_eucalyptus_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.005,
	density =   0.02,
	priority =  50,
	check = function(t, pos)
		return t.v4 > 0.5 and t.v2 > 0.1 and pos.y >= 20 and pos.y <= 60 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(10, 15)
		local radius =  math_random(4, 5)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Lemon Myrtle
plants_api.register_plant({
	nodes = {
		trunk =   "base:lemon_myrtle_tree",
		leaves =  "base:lemon_myrtle_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0001,
	density =   0.001,
	priority =  45,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 70 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 5)
		local radius =  math_random(2, 3)
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
		return t.valleys > 0 and t.valleys < 0.25 and pos.y >= 5 and pos.y <= 60 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =        math_random(3, 5)
		local radius =        math_random(3, 5)
		local limbs =         nil
		local fruit_chance =  0.3
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})

-- Macadamia Tree
plants_api.register_plant({
	nodes = {
		trunk =   "base:macadamia_tree",
		leaves =  "base:macadamia_leaves",
		fruit =   "base:macadamia",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0001,
	density =   0.002,
	priority =  40,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 100 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =        math_random(5, 7)
		local radius =        math_random(3, 4)
		local limbs =         nil
		local fruit_chance =  0.3
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})

-- Moreton Bay Fig
plants_api.register_plant({
	nodes = {
		trunk =   "base:moreton_bay_fig_tree",
		leaves =  "base:moreton_bay_fig_leaves",
		fruit =   "base:moreton_bay_fig",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0001,
	density =   0.00001,
	priority =  50,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 50 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =        math_random(12, 16)
		local radius =        math_random(10, 12)
		local limbs =         true
		local fruit_chance =  0.2
		base.make_moreton_bay_fig(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})

-- Paperbark Tree
plants_api.register_plant({
	nodes = {
		trunk =   "base:paperbark_tree",
		leaves =  "base:paperbark_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.001,
	priority =  60,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.025 and pos.y >= 5 and pos.y <= 20 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(5, 8)
		local radius =  math_random(3, 4)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Paperbark Tree
plants_api.register_plant({
	nodes = {
		trunk =   "base:paperbark_tree",
		leaves =  "base:paperbark_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0001,
	density =   0.01,
	priority =  60,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.3 and t.v4 > 0.5 and pos.y >= 5 and pos.y <= 20 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(5, 8)
		local radius =  math_random(3, 4)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- River Oak
plants_api.register_plant({
	nodes = {
		trunk =   "base:river_oak_tree",
		leaves =  "base:river_oak_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.01,
	priority =  30,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y <= 120 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(10, 12)
		local radius =  math_random(3, 4)
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
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
	cover =     0.0001,
	density =   0.001,
	priority =  70,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y <= 72 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(10, 15)
		local radius =  math_random(5, 7)
		local limbs =   true
		base.make_river_red_gum(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Scribbly Gum
plants_api.register_plant({
	nodes = {
		trunk =   "base:scribbly_gum_tree",
		leaves =  "base:scribbly_gum_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.005,
	priority =  65,
	check = function(t, pos)
		return t.valleys > 0.5 and pos.y >= 5 and pos.y <= 35 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(5, 7)
		local radius =  math_random(3, 4)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Scribbly Gum
plants_api.register_plant({
	nodes = {
		trunk =   "base:scribbly_gum_tree",
		leaves =  "base:scribbly_gum_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.005,
	priority =  65,
	check = function(t, pos)
		return t.v4 > 0.5 and pos.y >= 5 and pos.y <= 35 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(5, 7)
		local radius =  math_random(3, 4)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
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
		return pos.y >= 130 and pos.y <= 180 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(2, 4)
		local radius =  2
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Tea Tree
plants_api.register_plant({
	nodes = {
		trunk =   "base:tea_tree_tree",
		leaves =  "base:tea_tree_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0001,
	density =   0.001,
	priority =  50,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.03 and pos.y >= 5 and pos.y <= 30 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 4)
		local radius =  math_random(2, 3)
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Tea Tree
plants_api.register_plant({
	nodes = {
		trunk =   "base:tea_tree_tree",
		leaves =  "base:tea_tree_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0001,
	density =   0.001,
	priority =  50,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.3 and t.v4 > 0.5 and pos.y >= 5 and pos.y <= 30 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 4)
		local radius =  math_random(2, 3)
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})
