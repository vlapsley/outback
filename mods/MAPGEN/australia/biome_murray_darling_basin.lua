-- mods/australia_modpack/australia/biome_murray_darling_basin.lua

-- localize math routines for performance
local math_random = math.random

-- murray-darling basin
minetest.register_biome({
	name =              "murray_darling_basin",
	node_top =          "core:dirt_with_dry_grass",
	depth_top =         1,
	node_filler =       "core:dirt",
	depth_filler =      3,
	node_stone =        "core:stone",
	node_river_water =  "australia:muddy_river_water_source",
	node_riverbed =     "core:dirt",
	depth_riverbed =    1,
	y_min =             4,
	y_max =             31000,
	heat_point =        64,
	humidity_point =    48,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

minetest.register_ore({
	ore_type =                "sheet",
	ore =                     "australia:bluestone",
	wherein =                 "core:stone",
	column_height_min =       2,
	column_height_max =       4,
	column_midpoint_factor =  0.5,
	biomes =                  {"murray_darling_basin"},
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


--[[
	Decorations
--]]

-- Grass
local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"core:dirt_with_dry_grass"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"murray_darling_basin"},
		y_min =         4,
		y_max =         15,
		decoration =    "core:grass_"..length,
	})
end

local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"core:dirt_with_dry_grass"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"murray_darling_basin"},
		y_min =         9,
		y_max =         240,
		decoration =    "core:dry_grass_"..length,
	})
end

register_grass_decoration(0.015,  0.045, 2)
register_grass_decoration(0.03,   0.03,  1)

register_dry_grass_decoration(0.01, 0.1,  5)
register_dry_grass_decoration(0.03, 0.06,  4)
register_dry_grass_decoration(0.05, 0.02,  3)
register_dry_grass_decoration(0.07, -0.01, 2)
register_dry_grass_decoration(0.09, -0.03, 1)

-- Grass near rivers
local function register_rivergrass(length)
	aus.register_plant({
		nodes =     {"core:grass_"..length},
		cover =     0.33,
		density =   0.5,
		priority =  25,
		check = function(t, pos)
			return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 4 and pos.y <= 240 and table.contains({"murray_darling_basin"}, t.biome)
		end,
	})
end

register_rivergrass(5)
register_rivergrass(4)

-- Darling Lily
aus.register_plant({
	nodes =     {"australia:darling_lily"},
	cover =     0.01,
	density =   0.1,
	priority =  30,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.03 and pos.y >= 5 and pos.y <= 70 and table.contains({"murray_darling_basin"}, t.biome)
	end,
})

-- Darling Lily
aus.register_plant({
	nodes =     {"australia:darling_lily"},
	cover =     0.005,
	density =   0.01,
	priority =  30,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.3 and t.v4 > 0.5 and pos.y >= 5 and pos.y <= 70 and table.contains({"murray_darling_basin"}, t.biome)
	end,
})

-- Saltbush
aus.register_plant({
	nodes =     {"australia:saltbush"},
	cover =     0.005,
	density =   0.01,
	priority =  35,
	check = function(t, pos)
		return t.v4 > 0.3 and pos.y >= 5 and pos.y <= 40 and table.contains({"murray_darling_basin"}, t.biome)
	end,
})

-- Silver Daisy
aus.register_plant({
	nodes =     {"australia:silver_daisy"},
	cover =     0.005,
	density =   0.001,
	priority =  35,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 5 and pos.y <= 117 and table.contains({"murray_darling_basin"}, t.biome)
	end,
})

-- Small stone rocks
local function register_small_stone_rocks(number)
	minetest.register_decoration({
		deco_type =   "simple",
		decoration =  "australia:small_stone_rocks"..number,
		sidelen =     80,
		place_on =    {"core:dirt_with_dry_grass"},
		fill_ratio =  0.001,
		y_min =       24,
		biomes =      {"murray_darling_basin"},
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

-- Black Box
aus.register_plant({
	nodes = {
		trunk =   "australia:black_box_tree",
		leaves =  "australia:black_box_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.003,
	density =   0.005,
	priority =  50,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.03 and pos.y >= 5 and pos.y <= 45 and table.contains({"murray_darling_basin"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(5, 10)
		local radius =  math_random(4, 6)
		local limbs =   true
		aus.make_black_box(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Black Box
aus.register_plant({
	nodes = {
		trunk =   "australia:black_box_tree",
		leaves =  "australia:black_box_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.003,
	density =   0.005,
	priority =  50,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.3 and t.v4 > 0.5 and pos.y >= 5 and pos.y <= 45 and table.contains({"murray_darling_basin"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(5, 10)
		local radius =  math_random(4, 6)
		local limbs =   true
		aus.make_black_box(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Coolabah Tree
aus.register_plant({
	nodes = {
		trunk =   "australia:coolabah_tree",
		leaves =  "australia:coolabah_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.002,
	density =   0.005,
	priority =  40,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y <= 60 and table.contains({"murray_darling_basin"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(7, 10)
		local radius =  math_random(4, 5)
		local limbs =   true
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Golden Wattle
aus.register_plant({
	nodes = {
		trunk =   "australia:golden_wattle_tree",
		leaves =  "australia:golden_wattle_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0005,
	density =   0.0025,
	priority =  40,
	check = function(t, pos)
		return t.v4 < 0.5 and pos.y >= 5 and pos.y <= 150 and table.contains({"murray_darling_basin"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 4)
		local radius =  2
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Golden Wattle
aus.register_plant({
	nodes = {
		trunk =   "australia:golden_wattle_tree",
		leaves =  "australia:golden_wattle_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0005,
	density =   0.0025,
	priority =  40,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 5 and pos.y <= 150 and table.contains({"murray_darling_basin"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 4)
		local radius =  2
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Quandong
aus.register_plant({
	nodes = {
		trunk =   "australia:quandong_tree",
		leaves =  "australia:quandong_leaves",
		fruit =   "australia:quandong",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0005,
	density =   0.0025,
	priority =  50,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.03 and pos.y >= 10 and pos.y <= 77 and table.contains({"murray_darling_basin"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =        math_random(2, 3)
		local radius =        2
		local limbs =         nil
		local fruit_chance =  0.2
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})

-- Quandong
aus.register_plant({
	nodes = {
		trunk =   "australia:quandong_tree",
		leaves =  "australia:quandong_leaves",
		fruit =   "australia:quandong",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0005,
	density =   0.001,
	priority =  50,
	check = function(t, pos)
		return t.v4 > 0.5 and pos.y >= 10 and pos.y <= 77 and table.contains({"murray_darling_basin"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =        math_random(2, 3)
		local radius =        2
		local limbs =         nil
		local fruit_chance =  0.2
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
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
	cover =     0.2,
	density =   0.0025,
	priority =  70,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.05 and pos.y >= 5 and pos.y <= 72 and table.contains({"murray_darling_basin"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(12, 18)
		local radius =  math_random(6, 8)
		local limbs =   true
		aus.make_river_red_gum(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Shoestring Acacia
aus.register_plant({
	nodes = {
		trunk =   "australia:shoestring_acacia_tree",
		leaves =  "australia:shoestring_acacia_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0005,
	density =   0.0025,
	priority =  60,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.05 and pos.y >= 5 and pos.y <= 50 and table.contains({"murray_darling_basin"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 5)
		local radius =  math_random(3, 4)
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Shoestring Acacia
aus.register_plant({
	nodes = {
		trunk =   "australia:shoestring_acacia_tree",
		leaves =  "australia:shoestring_acacia_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0005,
	density =   0.0025,
	priority =  60,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.2 and t.v4 > 0.5 and pos.y >= 5 and pos.y <= 50 and table.contains({"murray_darling_basin"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 5)
		local radius =  math_random(3, 4)
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- White Box
aus.register_plant({
	nodes = {
		trunk =   "australia:white_box_tree",
		leaves =  "australia:white_box_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0003,
	density =   0.003,
	priority =  75,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 65 and pos.y <= 145 and table.contains({"murray_darling_basin"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(7, 12)
		local radius =  math_random(6, 8)
		local limbs =   true
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})
