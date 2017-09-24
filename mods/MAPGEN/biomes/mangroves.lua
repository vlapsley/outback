--[[
	Mangroves
--]]


-- localize math routines for performance
local math_random = math.random

-- mangroves
minetest.register_biome({
	name =             "mangroves",
	node_top =         "base:mangrove_mud",
	depth_top =        3,
	node_filler =      "default:clay",
	depth_filler =     1,
	node_stone =       "default:stone",
	node_river_water = "base:muddy_water_source",
	node_riverbed =    "default:dirt",
	depth_riverbed =   1,
	y_min =            -2,
	y_max =            3,
	heat_point =       80,
	humidity_point =   80,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs


--[[
	Decorations
--]]

-- Mangrove Fern
minetest.register_decoration({
	deco_type =   "simple",
	place_on =    {
		"base:mangrove_mud",
		"default:sand",
		"default:dirt",
		"default:dirt_with_grass"
	},
	sidelen =     80,
	fill_ratio =  0.2,
	biomes =      {"mangroves"},
	y_min =       2,
	y_max =       3,
	decoration =  "base:mangrove_fern",
})

-- Mangrove Lily
minetest.register_decoration({
	deco_type =   "simple",
	place_on =    {
		"base:mangrove_mud",
		"default:sand",
		"default:dirt",
		"default:dirt_with_grass"
	},
	sidelen =     80,
	fill_ratio =  0.1,
	biomes =      {"mangroves"},
	y_min =       2,
	y_max =       3,
	decoration =  "flowers:mangrove_lily",
})

-- Nipa Palm
minetest.register_decoration({
	deco_type = "schematic",
	place_on =    {
		"base:mangrove_mud",
		"default:sand",
		"default:dirt",
	},
	sidelen =     80,
	fill_ratio =  0.3,
	biomes =      {"mangroves"},
	y_min =       1,
	y_max =       3,
	schematic =   {
		size = {x = 1, y = 4, z = 1},
		data = {
			{name = "ignore", param1 = 0, param2 = 0},
			{name = "base:mangrove_palm_trunk", param1 = 255, param2 = 0},
			{name = "base:mangrove_palm_leaf_bot", param1 = 255, param2 = 0},
			{name = "base:mangrove_palm_leaf_top", param1 = 255, param2 = 0},
		},
	},
	flags =       "force_placement",
})

-- Waterlily
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {
			"default:dirt",
			"base:mangrove_mud",
			"default:sand",
	},
	sidelen = 80,
	fill_ratio =  0.3,
	biomes = {"mangroves"},
	y_min = 0,
	y_max = 0,
	schematic = minetest.get_modpath("flowers") .. "/schematics/waterlily.mts",
	rotation = "random",
})


--[[
	Trees
--]]

-- Grey Mangrove
base.schematics.grey_mangrove = {}
local max_ht =  6
local tree =    "base:grey_mangrove_tree"
local leaves =  "base:grey_mangrove_leaves"
for h = 4, max_ht do
	local schem = base.generate_mangrove_tree_schematic(3, tree, leaves)
	base.push(base.schematics.grey_mangrove, schem)
	minetest.register_decoration({
		deco_type =   "schematic",
		sidelen =     80,
		place_on =    {
			"base:mangrove_mud",
			"default:sand",
			"default:dirt",
			"default:dirt_with_grass",
		},
		fill_ratio =  0.005,
		biomes =      {"mangroves"},
		y_min =       -1,
		y_max =       3,
		schematic =   schem,
		flags =       "place_center_x, place_center_z",
		rotation =    "random",
	})
end

-- Mangrove Apple
plants_api.register_plant({
	nodes = {
		trunk =   "base:mangrove_apple_tree",
		leaves =  "base:mangrove_apple_leaves",
		fruit =   "base:mangrove_apple",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0025,
	density =   0.005,
	priority =  45,
	check = function(t, pos)
		return pos.y >= 0 and pos.y <= 3 and table.contains({"mangroves"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =        math_random(6,8)
		local radius =        math_random(3,4)
		local limbs =         nil
		local fruit_chance =  0.2
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})

-- Stilted Mangrove
base.schematics.stilted_mangrove = {}
local max_ht =  6
local tree =    "base:stilted_mangrove_tree"
local leaves =  "base:stilted_mangrove_leaves"
for h = 4, max_ht do
	local schem = base.generate_mangrove_tree_schematic(3, tree, leaves)
	base.push(base.schematics.stilted_mangrove, schem)
	minetest.register_decoration({
		deco_type =   "schematic",
		sidelen =     80,
		place_on =    {
			"base:mangrove_mud",
			"default:sand",
			"default:dirt",
			"default:dirt_with_grass",
		},
		fill_ratio =  0.003,
		biomes =      {"mangroves"},
		y_min =       -1,
		y_max =       3,
		schematic =   schem,
		flags =       "place_center_x, place_center_z",
		rotation =    "random",
	})
end
