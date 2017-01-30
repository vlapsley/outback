-- mods/australian_modpack/australia/biome_eastern_coasts.lua

-- localize math routines for performance
local math_random = math.random

-- eastern coasts
minetest.register_biome({
	name =              "eastern_coasts",
	node_top =          "default:dirt_with_grass",
	depth_top =         1,
	node_filler =       "default:dirt",
	depth_filler =      3,
	node_stone =        "default:stone",
	node_river_water =  "australia:muddy_river_water_source",
	node_riverbed =     "default:dirt",
	depth_riverbed =    1,
	y_min =             4,
	y_max =             31000,
	heat_point =        35,
	humidity_point =    60,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Bluestone (Basalt)
minetest.register_ore({
	ore_type =                "sheet",
	ore =                     "australia:bluestone",
	wherein =                 "default:stone",
	column_height_min =       2,
	column_height_max =       4,
	column_midpoint_factor =  0.5,
	biomes =                  {"eastern_coasts"},
	y_min =                   -192,
	y_max =                   0,
	noise_threshold =         1.25,
	noise_params =            {
		offset =   0,
		scale =    2,
		spread =   {x = 19, y = 19, z = 11},
		seed =     677,
		octaves =  2,
		persist =  0.8,
	},
})

-- Coal
minetest.register_ore({
	ore_type =                "sheet",
	ore =                     "default:stone_with_coal",
	wherein =                 "default:stone",
	column_height_min =       2,
	column_height_max =       4,
	column_midpoint_factor =  0.5,
	biomes =                  {"eastern_coasts"},
	y_min =                   -192,
	y_max =                   70,
	noise_threshold =         1.25,
	noise_params =            {
		offset =   0,
		scale =    2,
		spread =   {x = 19, y = 19, z = 11},
		seed =     962,
		octaves =  2,
		persist =  0.8,
	},
})


--
-- Decorations
--

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
		biomes =        {"eastern_coasts"},
		y_min =         4,
		y_max =         200,
		decoration =    "default:grass_"..length,
	})
end

register_grass_decoration(-0.03,  0.09,  5)
register_grass_decoration(-0.015, 0.075, 4)
register_grass_decoration(0,      0.06,  3)
register_grass_decoration(0.015,  0.045, 2)
register_grass_decoration(0.03,   0.03,  1)

-- Grass near rivers
local function register_rivergrass(length)
	aus.register_plant({
		nodes =     {"default:grass_"..length},
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
aus.register_plant({
	nodes = {
		stem =    "default:acacia_bush_stem",
		leaves =  "australia:waratah_leaves",
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
		aus.make_bush(pos, data, area, height, radius, nodes.stem, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Snow
minetest.register_decoration({
	deco_type =   "simple",
	place_on =    {"default:dirt_with_grass"},
	sidelen =     80,
	fill_ratio =  0.3,
	biomes =      {"eastern_coasts"},
	y_min =       140,
	y_max =       31000,
	decoration =  "default:snow",
})

-- Small stone rocks
local function register_small_stone_rocks(number)
	minetest.register_decoration({
		deco_type =   "simple",
		decoration =  "australia:small_stone_rocks"..number,
		sidelen =     80,
		place_on =    {"default:dirt_with_grass"},
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
aus.register_plant({
	nodes = {
		trunk =   "australia:black_wattle_tree",
		leaves =  "australia:black_wattle_leaves",
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
		local height =  math_random(9, 15)
		local radius =  math_random(5, 6)
		aus.make_black_wattle(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Black Wattle
aus.register_plant({
	nodes = {
		trunk = "australia:black_wattle_tree",
		leaves = "australia:black_wattle_leaves",
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
		local height =  math_random(6, 8)
		local radius =  3
		aus.make_black_wattle(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Australian Cherry
aus.register_plant({
	nodes = {
		trunk = "australia:cherry_tree",
		leaves = "australia:cherry_leaves",
		fruit = "australia:cherry",
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
		aus.make_conifer(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})

-- Coast Banksia (big)
aus.register_plant({
	nodes = {
		trunk =   "australia:coast_banksia_tree",
		leaves =  "australia:coast_banksia_leaves",
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
		local height =  math_random(8, 13)
		local radius =  math_random(5, 6)
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Coast Banksia (small)
aus.register_plant({
	nodes = {
		trunk =   "australia:coast_banksia_tree",
		leaves =  "australia:coast_banksia_leaves",
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
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Coast Banksia (small and along rivers)
aus.register_plant({
	nodes = {
		trunk =   "australia:coast_banksia_tree",
		leaves =  "australia:coast_banksia_leaves",
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
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Coolabah
aus.register_plant({
	nodes = {
		trunk =   "australia:coolabah_tree",
		leaves =  "australia:coolabah_leaves",
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
		local height =  math_random(7, 10)
		local radius =  math_random(4, 5)
		local limbs =   true
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Illawarra Flame Tree
aus.register_plant({
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
		return pos.y >= 5 and pos.y <= 100 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(9, 11)
		local radius =  math_random(6, 7)
		local limbs =   true
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Lemon Eucalyptus
aus.register_plant({
	nodes = {
		trunk =   "australia:lemon_eucalyptus_tree",
		leaves =  "australia:lemon_eucalyptus_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0005,
	density =   0.002,
	priority =  50,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 160 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(12, 18)
		local radius =  math_random(5, 6)
		local limbs =   true
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Lemon Eucalyptus (forest)
aus.register_plant({
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
		return t.v4 > 0.5 and t.v2 > 0.1 and pos.y >= 20 and pos.y <= 60 and table.contains({"eastern_coasts"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(12, 18)
		local radius =  math_random(5, 6)
		local limbs =   true
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Lemon Myrtle
aus.register_plant({
	nodes = {
		trunk =   "australia:lemon_myrtle_tree",
		leaves =  "australia:lemon_myrtle_leaves",
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
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Lilly Pilly
aus.register_plant({
	nodes = {
		trunk =   "australia:lilly_pilly_tree",
		leaves =  "australia:lilly_pilly_leaves",
		fruit =   "australia:lilly_pilly_berries",
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
		local height =        math_random(4, 6)
		local radius =        math_random(4, 6)
		local limbs =         nil
		local fruit_chance =  0.3
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})

-- Macadamia Tree
aus.register_plant({
	nodes = {
		trunk =   "australia:macadamia_tree",
		leaves =  "australia:macadamia_leaves",
		fruit =   "australia:macadamia",
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
		local height =        math_random(6, 8)
		local radius =        math_random(3, 4)
		local limbs =         nil
		local fruit_chance =  0.3
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})

-- Moreton Bay Fig
aus.register_plant({
	nodes = {
		trunk =   "australia:moreton_bay_fig_tree",
		leaves =  "australia:moreton_bay_fig_leaves",
		fruit =   "australia:moreton_bay_fig",
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
		local height =        math_random(15, 20)
		local radius =        math_random(13, 15)
		local limbs =         true
		local fruit_chance =  0.2
		aus.make_moreton_bay_fig(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})

-- Paperbark Tree
aus.register_plant({
	nodes = {
		trunk =   "australia:paperbark_tree",
		leaves =  "australia:paperbark_leaves",
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
		local height =  math_random(6, 10)
		local radius =  math_random(4, 5)
		local limbs =   true
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Paperbark Tree
aus.register_plant({
	nodes = {
		trunk =   "australia:paperbark_tree",
		leaves =  "australia:paperbark_leaves",
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
		local height =  math_random(6, 10)
		local radius =  math_random(4, 5)
		local limbs =   true
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- River Oak
aus.register_plant({
	nodes = {
		trunk =   "australia:river_oak_tree",
		leaves =  "australia:river_oak_leaves",
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
		local height =  math_random(12, 15)
		local radius =  math_random(4,5 )
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- River Red Gum
aus.register_plant({
	nodes = {
		trunk =   "australia:river_red_gum_tree",
		leaves =  "australia:river_red_gum_leaves",
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
		local height =  math_random(12, 18)
		local radius =  math_random(6, 8)
		local limbs =   true
		aus.make_river_red_gum(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Scribbly Gum
aus.register_plant({
	nodes = {
		trunk =   "australia:scribbly_gum_tree",
		leaves =  "australia:scribbly_gum_leaves",
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
		local height =  math_random(6, 8)
		local radius =  math_random(4, 5)
		local limbs =   true
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Scribbly Gum
aus.register_plant({
	nodes = {
		trunk =   "australia:scribbly_gum_tree",
		leaves =  "australia:scribbly_gum_leaves",
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
		local height =  math_random(6, 8)
		local radius =  math_random(4, 5)
		local limbs =   true
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Snow Gum
aus.register_plant({
	nodes = {
		trunk =   "australia:snow_gum_tree",
		leaves =  "australia:snow_gum_leaves",
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
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Tea Tree
aus.register_plant({
	nodes = {
		trunk =   "australia:tea_tree_tree",
		leaves =  "australia:tea_tree_leaves",
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
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Tea Tree
aus.register_plant({
	nodes = {
		trunk =   "australia:tea_tree_tree",
		leaves =  "australia:tea_tree_leaves",
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
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})
