--[[
	Murray-Darling Basin
--]]


-- localize math routines for performance
local math_random = math.random

-- murray-darling basin
minetest.register_biome({
	name =             "murray_darling_basin",
	node_top =         "base:dirt_with_dry_grass",
	depth_top =        1,
	node_filler =      "base:dirt",
	depth_filler =     3,
	node_stone =       "base:stone",
	node_river_water = "base:muddy_water_source",
	node_riverbed =    "base:dirt",
	depth_riverbed =   1,
	y_min =            4,
	y_max =            31000,
	heat_point =       64,
	humidity_point =   48,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Zinc (Broken Hill)
minetest.register_ore({
	ore_type =        "blob",
	ore =             "technic:mineral_zinc",
	wherein =         {"base:stone"},
	clust_scarcity =  85184,
	clust_size =      5,
	biomes =          {"murray_darling_basin"},
	y_min =           -31,
	y_max =           33,
	noise_threshold = 1.5,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x = 16, y = 16, z = 16},
		seed =    557,
		octaves = 3,
		persist = 0.6
	},
})

-- Amethyst (Broken Hill)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_amethyst",
	wherein =        {"base:stone"},
	biomes =         {"murray_darling_basin"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_min =          -31,
	y_max =          33,
})

--Copper (Cadia)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_copper",
	wherein =        {"base:stone"},
	biomes =         {"murray_darling_basin"},
	clust_scarcity = 1728,
	clust_num_ores = 4,
	clust_size =     3,
	y_min =          -31,
	y_max =          69,
})

-- Gold (Cadia)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_gold",
	wherein =        {"base:stone"},
	biomes =         {"murray_darling_basin"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_min =          -31,
	y_max =          69,
})


--[[
	Decorations
--]]

-- Grass
local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"base:dirt_with_dry_grass"},
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
		decoration =    "base:grass_"..length,
	})
end

local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"base:dirt_with_dry_grass"},
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
		decoration =    "base:dry_grass_"..length,
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
	plants_api.register_plant({
		nodes =     {"base:grass_"..length},
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
plants_api.register_plant({
	nodes =     {"flowers:darling_lily"},
	cover =     0.01,
	density =   0.1,
	priority =  30,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.03 and pos.y >= 5 and pos.y <= 70 and table.contains({"murray_darling_basin"}, t.biome)
	end,
})

-- Darling Lily
plants_api.register_plant({
	nodes =     {"flowers:darling_lily"},
	cover =     0.005,
	density =   0.01,
	priority =  30,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.3 and t.v4 > 0.5 and pos.y >= 5 and pos.y <= 70 and table.contains({"murray_darling_basin"}, t.biome)
	end,
})

-- Saltbush
plants_api.register_plant({
	nodes =     {"base:saltbush"},
	cover =     0.005,
	density =   0.01,
	priority =  35,
	check = function(t, pos)
		return t.v4 > 0.3 and pos.y >= 5 and pos.y <= 40 and table.contains({"murray_darling_basin"}, t.biome)
	end,
})

-- Silver Daisy
plants_api.register_plant({
	nodes =     {"flowers:silver_daisy"},
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
		decoration =  "base:small_stone_rocks"..number,
		sidelen =     80,
		place_on =    {"base:dirt_with_dry_grass"},
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
plants_api.register_plant({
	nodes = {
		trunk =   "base:black_box_tree",
		leaves =  "base:black_box_leaves",
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
		local height =  math_random(5, 9)
		local radius =  math_random(4, 6)
		local limbs =   true
		base.make_black_box(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Black Box
plants_api.register_plant({
	nodes = {
		trunk =   "base:black_box_tree",
		leaves =  "base:black_box_leaves",
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
		local height =  math_random(5, 9)
		local radius =  math_random(4, 6)
		local limbs =   true
		base.make_black_box(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
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
	cover =     0.002,
	density =   0.005,
	priority =  40,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y <= 60 and table.contains({"murray_darling_basin"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(7, 9)
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
		return t.v4 < 0.5 and pos.y >= 5 and pos.y <= 150 and table.contains({"murray_darling_basin"}, t.biome)
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
		return t.valleys > 0.3 and pos.y >= 5 and pos.y <= 150 and table.contains({"murray_darling_basin"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 4)
		local radius =  2
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Quandong
plants_api.register_plant({
	nodes = {
		trunk =   "base:quandong_tree",
		leaves =  "base:quandong_leaves",
		fruit =   "base:quandong",
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
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})

-- Quandong
plants_api.register_plant({
	nodes = {
		trunk =   "base:quandong_tree",
		leaves =  "base:quandong_leaves",
		fruit =   "base:quandong",
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
	cover =     0.2,
	density =   0.0025,
	priority =  70,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.05 and pos.y >= 5 and pos.y <= 72 and table.contains({"murray_darling_basin"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(10, 15)
		local radius =  math_random(5, 7)
		local limbs =   true
		base.make_river_red_gum(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Shoestring Acacia
plants_api.register_plant({
	nodes = {
		trunk =   "base:shoestring_acacia_tree",
		leaves =  "base:shoestring_acacia_leaves",
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
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Shoestring Acacia
plants_api.register_plant({
	nodes = {
		trunk =   "base:shoestring_acacia_tree",
		leaves =  "base:shoestring_acacia_leaves",
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
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
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
		return t.valleys > 0.3 and pos.y >= 65 and pos.y <= 145 and table.contains({"murray_darling_basin"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(6, 10)
		local radius =  math_random(5, 7)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})
