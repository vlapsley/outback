--[[
	Nullabor Plains
--]]


-- localize math routines for performance
local math_random = math.random

-- nullabor plains
minetest.register_biome({
	name =             "nullabor_plains",
	node_top =         "default:desert_sand",
	depth_top =        1,
	node_filler =      "default:sandstone",
	depth_filler =     3,
	node_stone =       "default:stone",
	node_river_water = "default:dirt_with_dry_grass",
	node_riverbed =    "default:sandstone",
	depth_riverbed =   1,
	y_min =            4,
	y_max =            31000,
	heat_point =       65,
	humidity_point =   13,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Gold (Kalgoorlie / Boulder)
minetest.register_ore({
	ore_type =        "vein",
	ore =             "default:stone_with_gold",
	wherein =         {"default:stone"},
	biomes =          {"nullabor_plains"},
	y_min =           -31,
	y_max =           38,
	random_factor =   0.23,
	noise_threshold = 0.97,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x = 73, y = 251, z = 73},
		seed =    891,
		octaves = 4,
		persist = 0.5,
	    flags =   "eased",
	},
})

-- Nickel (Mount Margaret / Ravensthorpe)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "australia:stone_with_nickel",
	wherein =        {"default:stone"},
	biomes =         {"nullabor_plains"},
	clust_scarcity = 512,
	clust_num_ores = 5,
	clust_size =     3,
	y_min =          -31,
	y_max =          44,
})


--[[
	Decorations
--]]

-- Grass
local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"default:desert_sand"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"nullabor_plains"},
		y_min =         4,
		y_max =         240,
		decoration =    "default:dry_grass_"..length,
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
	place_on =    {"default:desert_sand"},
	sidelen =     80,
	fill_ratio =  0.03,
	biomes =      {"nullabor_plains"},
	y_min =       4,
	y_max =       41,
	decoration =  "australia:spinifex",
})

-- Sturt's Desert Pea
plants_api.register_plant({
	nodes =     {"flowers:sturts_desert_pea"},
	cover =     0.001,
	density =   0.2,
	priority =  30,
	check = function(t, pos)
		return t.v2 > 0.1 and t.v4 > 0.5 and t.v3 < 40 and pos.y >= 5 and pos.y <= 50 and table.contains({"nullabor_plains"}, t.biome)
	end,
})

-- Small sandstone rocks
local function register_small_sandstone_rocks(number)
	minetest.register_decoration({
		deco_type =   "simple",
		decoration =  "australia:small_sandstone_rocks"..number,
		sidelen =     80,
		place_on =    {"default:desert_sand"},
		fill_ratio =  0.002,
		biomes =      {"nullabor_plains"},
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
plants_api.register_plant({
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
		return t.v2 > 0 and t.v2 < 0.01 and pos.y >= 10 and pos.y <= 77 and table.contains({"nullabor_plains"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =        math_random(2, 3)
		local radius =        2
		local limbs =         nil
		local fruit_chance =  0.1
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})
