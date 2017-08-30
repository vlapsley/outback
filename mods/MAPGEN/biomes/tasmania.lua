--[[
	Tasmania
--]]


-- localize math routines for performance
local math_random = math.random

-- tasmania
minetest.register_biome({
	name =              "tasmania",
	node_top =          "base:dirt_with_grass",
	depth_top =         1,
	node_filler =       "base:dirt",
	depth_filler =      3,
	node_stone =        "base:stone",
	node_river_water =  "base:river_water_source",
	node_riverbed =     "base:sand",
	depth_riverbed =    1,
	y_min =             4,
	y_max =             31000,
	heat_point =        10,
	humidity_point =    10,
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
	biomes         = {"tasmania"},
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
	biomes         = {"tasmania"},
	y_min          = -255,
	y_max          = 31000,
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
		biomes =        {"tasmania"},
		y_min =         4,
		y_max =         170,
		decoration =    "base:grass_"..length,
	})
end

register_grass_decoration(-0.03,  0.09,  5)
register_grass_decoration(-0.015, 0.075, 4)
register_grass_decoration(0,      0.06,  3)
register_grass_decoration(0.03,   0.09,  2)
register_grass_decoration(0.06,   0.06,  1)

-- Grass near rivers
local function register_rivergrass(length)
	plants_api.register_plant({
		nodes =     {"base:grass_"..length},
		cover =     0.33,
		density =   0.5,
		priority =  25,
		check = function(t, pos)
			return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 4 and pos.y <= 170 and table.contains({"tasmania"}, t.biome)
		end,
	})
end

register_rivergrass(5)
register_rivergrass(4)

-- Snow
minetest.register_decoration({
	deco_type =   "simple",
	place_on =    {"base:dirt_with_grass"},
	sidelen =     80,
	fill_ratio =  0.3,
	biomes =      {"tasmania"},
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
		fill_ratio =  0.001,
		y_min =       48,
		biomes =      {"tasmania"},
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
	density =   0.001,
	priority =  35,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 50 and table.contains({"tasmania"}, t.biome)
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
	cover =     0.001,
	density =   0.005,
	priority =  35,
	check = function(t, pos)
		return pos.y >= 51 and pos.y <= 125 and table.contains({"tasmania"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(6, 8)
		local radius =  3
		base.make_black_wattle(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Blue Gum (in valleys)
plants_api.register_plant({
	nodes = {
		trunk =   "base:blue_gum_tree",
		leaves =  "base:blue_gum_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0001,
	density =   0.0025,
	priority =  80,
	check = function(t, pos)
		return t.valleys > 0 and t.valleys < 0.3 and pos.y >= 5 and pos.y <= 40 and table.contains({"tasmania"}, t.biome)
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
	cover =     0.0001,
	density =   0.0025,
	priority =  80,
	check = function(t, pos)
		return t.v4 > 0.5 and pos.y >= 5 and pos.y <= 40 and table.contains({"tasmania"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(12, 22)
		local radius =  math_random(5, 7)
		local limbs =   true
		base.make_tall_gum(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Celery-top Pine (forest)
plants_api.register_plant({
	nodes = {
		trunk =   "base:celery_top_pine_tree",
		leaves =  "base:celery_top_pine_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.005,
	density =   0.01,
	priority =  55,
	check = function(t, pos)
		return t.valleys > 0.3 and t.v4 > 0.4 and t.v4 < 0.6 and pos.y >= 40 and pos.y <= 80 and table.contains({"tasmania"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(8, 10)
		local radius =  math_random(3, 4)
		base.make_conifer(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Celery-top Pine
plants_api.register_plant({
	nodes = {
		trunk =   "base:celery_top_pine_tree",
		leaves =  "base:celery_top_pine_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.0025,
	priority =  55,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 39 and table.contains({"tasmania"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(8, 10)
		local radius =  math_random(3, 4)
		base.make_conifer(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Celery-top Pine
plants_api.register_plant({
	nodes = {
		trunk =   "base:celery_top_pine_tree",
		leaves =  "base:celery_top_pine_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.0025,
	priority =  55,
	check = function(t, pos)
		return pos.y >= 81 and pos.y <= 120 and table.contains({"tasmania"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(8, 10)
		local radius =  math_random(3, 4)
		base.make_conifer(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Huon Pine (along rivers)
plants_api.register_plant({
	nodes = {
		trunk =   "base:huon_pine_tree",
		leaves =  "base:huon_pine_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.01,
	density =   0.01,
	priority =  50,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.05 and pos.y >= 5 and pos.y <= 15 and table.contains({"tasmania"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(8, 13)
		local radius =  math_random(5, 6)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Huon Pine
plants_api.register_plant({
	nodes = {
		trunk =   "base:huon_pine_tree",
		leaves =  "base:huon_pine_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0025,
	density =   0.0025,
	priority =  50,
	check = function(t, pos)
		return t.v4 > 0.6 and pos.y >= 5 and pos.y <= 90 and table.contains({"tasmania"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(8, 13)
		local radius =  math_random(5, 6)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Southern Sassafras (along rivers)
plants_api.register_plant({
	nodes = {
		trunk =   "base:southern_sassafras_tree",
		leaves =  "base:southern_sassafras_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.002,
	density =   0.002,
	priority =  70,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.05 and pos.y >= 5 and pos.y <= 80 and table.contains({"tasmania"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(8, 13)
		local radius =  math_random(6, 8)
		base.make_conifer(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Southern Sassafras (in valleys)
plants_api.register_plant({
	nodes = {
		trunk =   "base:southern_sassafras_tree",
		leaves =  "base:southern_sassafras_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.001,
	priority =  70,
	check = function(t, pos)
		return t.valleys > 0 and t.valleys < 0.3 and pos.y >= 5 and pos.y <= 80 and table.contains({"tasmania"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(8, 13)
		local radius =  math_random(6, 8)
		base.make_conifer(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
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
		return t.valleys > 0.3 and t.v4 > 0.6 and pos.y >= 35 and pos.y <= 50 and table.contains({"tasmania"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(30, 40)
		local radius =  math_random(8, 10)
		local limbs =   true
		base.make_swamp_gum(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Tasmanian Myrtle (forest)
plants_api.register_plant({
	nodes = {
		trunk =   "base:tasmanian_myrtle_tree",
		leaves =  "base:tasmanian_myrtle_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.005,
	density =   0.01,
	priority =  60,
	check = function(t, pos)
		return t.v3 > 0.5 and t.v4 < 0.5 and pos.y >= 5 and pos.y <= 30 and table.contains({"tasmania"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(15, 20)
		local radius =  math_random(7, 9)
		local limbs =   true
		base.make_tasmanian_myrtle(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Tasmanian Myrtle (low alt - bigger tree)
plants_api.register_plant({
	nodes = {
		trunk =   "base:tasmanian_myrtle_tree",
		leaves =  "base:tasmanian_myrtle_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0005,
	density =   0.001,
	priority =  60,
	check = function(t, pos)
		return pos.y >= 31 and pos.y <= 100 and table.contains({"tasmania"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(15, 20)
		local radius =  math_random(7, 9)
		local limbs =   true
		base.make_tasmanian_myrtle(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Tasmanian Myrtle (high alt - smaller tree)
plants_api.register_plant({
	nodes = {
		trunk =   "base:tasmanian_myrtle_tree",
		leaves =  "base:tasmanian_myrtle_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.002,
	density =   0.002,
	priority =  60,
	check = function(t, pos)
		return pos.y >= 101 and pos.y <= 157 and table.contains({"tasmania"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(10, 14)
		local radius =  math_random(5, 6)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})
