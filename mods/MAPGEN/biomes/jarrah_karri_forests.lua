--[[
	Jarrah / Karri Forests
--]]


-- localize math routines for performance
local math_random = math.random

-- jarrah / karri forests
minetest.register_biome({
	name =             "jarrah_karri_forests",
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
	heat_point =       6,
	humidity_point =   91,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Aluminium (Darling Scarp)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_aluminium",
	wherein =        {"base:stone"},
	biomes =         {"jarrah_karri_forests"},
	clust_scarcity = 1728,
	clust_num_ores = 8,
	clust_size =     4,
	y_min =          -31,
	y_max =          58,
})

-- Gold (Boddington)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "base:stone_with_gold",
	wherein =        {"base:stone"},
	biomes =         {"jarrah_karri_forests"},
	clust_scarcity = 2197,
	clust_num_ores = 5,
	clust_size =     3,
	y_min =          -31,
	y_max =          27,
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
		biomes =        {"jarrah_karri_forests"},
		y_min =         4,
		y_max =         50,
		decoration =    "base:grass_"..length,
	})
end

local function register_dry_grass_decoration(offset, scale, length)
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
		biomes =        {"jarrah_karri_forests"},
		y_min =         40,
		y_max =         240,
		decoration =    "base:dry_grass_"..length,
	})
end

register_grass_decoration(0.015,  0.045, 2)
register_grass_decoration(0.03,   0.03,  1)

register_dry_grass_decoration(0.01, 0.05,  5)
register_dry_grass_decoration(0.03, 0.03,  4)
register_dry_grass_decoration(0.05, 0.01,  3)
register_dry_grass_decoration(0.07, -0.01, 2)
register_dry_grass_decoration(0.09, -0.03, 1)

-- Grass near rivers
local function register_rivergrass(length)
	plants_api.register_plant({
		nodes =     {"base:grass_"..length},
		cover =     0.1,
		density =   0.33,
		priority =  25,
		check = function(t, pos)
			return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 4 and pos.y <= 240 and table.contains({"jarrah_karri_forests"}, t.biome)
		end,
	})
end

register_rivergrass(5)
register_rivergrass(4)

-- Couch Honeypot
plants_api.register_plant({
	nodes =     {"flowers:couch_honeypot"},
	cover =     0.0015,
	density =   0.01,
	priority =  35,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 4 and pos.y <= 30 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
})

-- Flame Grevillea
plants_api.register_plant({
	nodes = {
		stem =    "base:acacia_bush_stem",
		leaves =  "base:flame_grevillea_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0004,
	density =   0.002,
	priority =  35,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 40 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  1
		local radius =  math_random(2, 3)
		base.make_bush(pos, data, area, height, radius, nodes.stem, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Kangaroo Paw
plants_api.register_plant({
	nodes =     {"flowers:kangaroo_paw"},
	cover =     0.0015,
	density =   0.01,
	priority =  30,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.03 and pos.y >= 4 and pos.y <= 30 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
})

plants_api.register_plant({
	nodes = {"flowers:kangaroo_paw"},
	cover =     0.0015,
	density =   0.01,
	priority =  30,
	check = function(t, pos)
		return t.v4 > 0.3 and pos.y >= 4 and pos.y <= 30 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
})

-- Small stone rocks
local function register_small_stone_rocks(number)
	minetest.register_decoration({
		deco_type =  "simple",
		decoration =  "base:small_stone_rocks"..number,
		sidelen =     80,
		place_on =    {"base:dirt_with_grass"},
		fill_ratio =  0.001,
		y_min =       24,
		biomes =      {"jarrah_karri_forests"},
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

-- Bull Banksia
plants_api.register_plant({
	nodes = {
		trunk =   "base:bull_banksia_tree",
		leaves =  "base:bull_banksia_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.005,
	density =   0.0025,
	priority =  40,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 15 and table.contains({"jarrah_karri_forests"}, t.biome)
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
	cover =     0.0025,
	density =   0.025,
	priority =  40,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y <= 60 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(7, 10)
		local radius =  math_random(4, 5)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Jarrah
plants_api.register_plant({
	nodes = {
		trunk =   "base:jarrah_tree",
		leaves =  "base:jarrah_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.004,
	density =   0.002,
	priority =  55,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 5 and pos.y <= 35 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(15, 20)
		local radius =  math_random(8, 10)
		local limbs =   true
		base.make_jarrah(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Karri
plants_api.register_plant({
	nodes = {
		trunk =   "base:karri_tree",
		leaves =  "base:karri_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.003,
	density =   0.001,
	priority =  50,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 5 and pos.y <= 35 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(20, 30)
		local radius =  math_random(8, 10)
		local limbs =   true
		base.make_karri(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Marri
plants_api.register_plant({
	nodes = {
		trunk =   "base:marri_tree",
		leaves =  "base:marri_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.002,
	density =   0.001,
	priority =  45,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 5 and pos.y <= 35 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(15, 20)
		local radius =  math_random(7, 10)
		local limbs =   true
		base.make_marri(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Rottnest Island Pine
plants_api.register_plant({
	nodes = {
		trunk =   "base:rottnest_island_pine_tree",
		leaves =  "base:rottnest_island_pine_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0025,
	density =   0.05,
	priority =  60,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 4 and pos.y <= 67 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 4)
		local radius =  3
		base.make_conifer(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Swamp Paperbark
plants_api.register_plant({
	nodes = {
		trunk =   "base:swamp_paperbark_tree",
		leaves =  "base:swamp_paperbark_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.025,
	density =   0.05,
	priority =  40,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.03 and pos.y >= 5 and pos.y <= 30 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 4)
		local radius =  2
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Swamp Paperbark
plants_api.register_plant({
	nodes = {
		trunk =   "base:swamp_paperbark_tree",
		leaves =  "base:swamp_paperbark_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0025,
	density =   0.005,
	priority =  40,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.3 and t.v4 > 0.5 and pos.y >= 5 and pos.y <= 30 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 4)
		local radius =  2
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})
