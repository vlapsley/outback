-- mods/australia_modpack/australia/biome_goldfields_esperence.lua

-- localize math routines for performance
local math_random = math.random

-- goldfields / esperence
minetest.register_biome({
	name =              "goldfields_esperence",
	node_top =          "base:desert_sand",
	depth_top =         2,
	node_filler =       "base:sandstone",
	depth_filler =      2,
	node_stone =        "base:stone",
	node_river_water =  "base:dirt_with_dry_grass",
	node_riverbed =     "base:sandstone",
	depth_riverbed =    1,
	y_min =             4,
	y_max =             31000,
	heat_point =        65,
	humidity_point =    13,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Gold
minetest.register_ore({
	ore_type =         "vein",
	ore =              "base:stone_with_gold",
	wherein =          {"base:stone"},
	biomes =           {"goldfields_esperence"},
	y_min =            -192,
	y_max =            47,
	random_factor =    0.23,
	noise_threshold =  0.97,
	noise_params =     {
		offset =   0,
		scale =    3,
		spread =   {x = 73, y = 251, z = 73},
		seed =     891,
		octaves =  4,
		persist =  0.5,
	    flags =    "eased",
	},
})


--[[
	Decorations
--]]

-- Grass
local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"base:desert_sand"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"goldfields_esperence"},
		y_min =         4,
		y_max =         240,
		decoration =    "base:dry_grass_"..length,
	})
end

register_dry_grass_decoration(0.01, 0.05,  5)
register_dry_grass_decoration(0.03, 0.03,  4)
register_dry_grass_decoration(0.05, 0.01,  3)
register_dry_grass_decoration(0.07, -0.01, 2)
register_dry_grass_decoration(0.09, -0.03, 1)

-- Spinifex
minetest.register_decoration({
	deco_type =   "simple",
	place_on =    {"base:desert_sand"},
	sidelen =     80,
	fill_ratio =  0.03,
	biomes =      {"goldfields_esperence"},
	y_min =       4,
	y_max =       41,
	decoration =  "australia:spinifex",
})

-- Sturt's Desert Pea
aus.register_plant({
	nodes =     {"flowers:sturts_desert_pea"},
	cover =     0.001,
	density =   0.2,
	priority =  30,
	check = function(t, pos)
		return t.v2 > 0.1 and t.v4 > 0.5 and t.v3 < 40 and pos.y >= 5 and pos.y <= 50 and table.contains({"goldfields_esperence"}, t.biome)
	end,
})

-- Small sandstone rocks
local function register_small_sandstone_rocks(number)
	minetest.register_decoration({
		deco_type =   "simple",
		decoration =  "base:small_sandstone_rocks"..number,
		sidelen =     80,
		place_on =    {"base:desert_sand"},
		fill_ratio =  0.002,
		biomes =      {"goldfields_esperence"},
		flags =       "place_center_x, place_center_z",
		rotation =    "random",
	})
end

register_small_sandstone_rocks(6)
register_small_sandstone_rocks(5)
register_small_sandstone_rocks(4)
register_small_sandstone_rocks(3)
register_small_sandstone_rocks(2)
register_small_sandstone_rocks(1)


--[[
	Trees
--]]

-- Quandong
aus.register_plant({
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
		return t.v2 > 0 and t.v2 < 0.01 and pos.y >= 10 and pos.y <= 77 and table.contains({"goldfields_esperence"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =        math_random(2, 3)
		local radius =        2
		local limbs =         nil
		local fruit_chance =  0.1
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})
