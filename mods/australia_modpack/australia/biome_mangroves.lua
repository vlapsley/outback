-- mods/australia/biome_mangroves.lua

-- localize math routines for performance
local math_random = math.random

-- mangroves
minetest.register_biome({
	name =              "mangroves",
	node_top =          "australia:mangrove_mud",
	depth_top =         3,
	node_filler =       "default:clay",
	depth_filler =      1,
	node_stone =        "default:stone",
	node_river_water =  "australia:muddy_river_water_source",
	node_riverbed =     "default:dirt",
	depth_riverbed =    1,
	y_min =             -2,
	y_max =             3,
	heat_point =        75,
	humidity_point =    75,
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
	deco_type = "simple",
	place_on = {"australia:mangrove_mud",
		"default:sand",
		"default:dirt",
		"default:dirt_with_grass"},
	sidelen = 80,
	fill_ratio = 0.2,
	biomes = {"mangroves"},
	y_min = 2,
	y_max = 3,
	decoration = "australia:mangrove_fern",
})

-- Mangrove Lily
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"australia:mangrove_mud",
		"default:sand",
		"default:dirt",
		"default:dirt_with_grass"},
	sidelen = 80,
	fill_ratio = 0.1,
	biomes = {"mangroves"},
	y_min = 2,
	y_max = 3,
	decoration = "australia:mangrove_lily",
})

-- Nipa Palm
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {
		"australia:mangrove_mud",
		"default:sand",
		"default:dirt",
	},
	sidelen = 80,
	fill_ratio = 0.3,
	biomes = {"mangroves"},
	y_min = 1,
	y_max = 3,
	schematic = {
		size = {x = 1, y = 4, z = 1},
		data = {
			{name = "ignore", param1 = 0, param2 = 0},
			{name = "australia:mangrove_palm_trunk", param1 = 255, param2 = 0},
			{name = "australia:mangrove_palm_leaf_bot", param1 = 255, param2 = 0},
			{name = "australia:mangrove_palm_leaf_top", param1 = 255, param2 = 0},
		},
	},
	flags = "force_placement",
})


--[[
	Trees
--]]

-- Grey Mangrove
aus.schematics.grey_mangrove = {}
local max_ht = 6
local tree = "australia:grey_mangrove_tree"
local leaves = "australia:grey_mangrove_leaves"
for h = 4,max_ht do
	local schem = aus.generate_mangrove_tree_schematic(3, tree, leaves)
	push(aus.schematics.grey_mangrove, schem)
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {
			"australia:mangrove_mud",
			"default:sand",
			"default:dirt",
			"default:dirt_with_grass",
		},
		fill_ratio = 0.004,
		biomes = {"mangroves"},
		y_min = -1,
		y_max = 3,
		schematic = schem,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

-- Mangrove Apple
aus.register_plant({
	nodes = {
		trunk = "australia:mangrove_apple_tree",
		leaves = "australia:mangrove_apple_leaves",
		fruit = "australia:mangrove_apple",
		air = "air", ignore = "ignore",
	},
	cover = 0.005,
	density = 0.005,
	priority = 45,
	check = function(t, pos)
		return pos.y >= 0 and pos.y <= 3 and table.contains({"mangroves"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(6,8)
			local radius = math_random(3,4)
			local limbs = nil
			local fruit_chance = 0.2
			aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
		end,
})

-- Stilted Mangrove
aus.schematics.stilted_mangrove = {}
local max_ht = 6
local tree = "australia:stilted_mangrove_tree"
local leaves = "australia:stilted_mangrove_leaves"
for h = 4,max_ht do
	local schem = aus.generate_mangrove_tree_schematic(3, tree, leaves)
	push(aus.schematics.stilted_mangrove, schem)
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {
			"australia:mangrove_mud",
			"default:sand",
			"default:dirt",
			"default:dirt_with_grass",
		},
		fill_ratio = 0.002,
		biomes = {"mangroves"},
		y_min = -1,
		y_max = 3,
		schematic = schem,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end
