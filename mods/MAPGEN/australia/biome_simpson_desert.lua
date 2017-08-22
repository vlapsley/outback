-- mods/australia_modpack/australia/biome_simpson_desert.lua

-- localize math routines for performance
local math_random = math.random

-- simpson desert
minetest.register_biome({
	name =              "simpson_desert",
	node_top =          "australia:red_sand",
	depth_top =         3,
	node_filler =       "australia:red_stone",
	depth_filler =      2,
	node_stone =        "base:stone",
	node_river_water =  "base:muddy_water_source",
	node_riverbed =     "australia:red_gravel",
	depth_riverbed =    1,
	y_min =             4,
	y_max =             31000,
	heat_point =        90,
	humidity_point =    10,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs


--[[
	Decorations
--]]

-- Small red rocks
local function register_small_red_rocks(number)
	minetest.register_decoration({
		deco_type =   "simple",
		decoration =  "australia:small_red_rocks"..number,
		sidelen =     80,
		place_on =    {"australia:red_sand"},
		fill_ratio =  0.001,
		y_min =       18,
		biomes =      {"simpson_desert"},
		flags =       "place_center_x, place_center_z",
		rotation =    "random",
	})
end

register_small_red_rocks(6)
register_small_red_rocks(5)
register_small_red_rocks(4)
register_small_red_rocks(3)
register_small_red_rocks(2)
register_small_red_rocks(1)


--[[
	Trees
--]]

-- Coolabah Tree
aus.register_plant({
	nodes = {
		trunk =   "australia:coolabah_tree",
		leaves =  "australia:coolabah_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.01,
	density =   0.0025,
	priority =  40,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.01 and pos.y >= 5 and pos.y <= 60 and table.contains({"simpson_desert"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(8, 10)
		local radius =  math_random(4, 5)
		local limbs =   true
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
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
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 10 and pos.y <= 77 and table.contains({"simpson_desert"}, t.biome)
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
		return t.v4 > 0.5 and pos.y >= 10 and pos.y <= 77 and table.contains({"simpson_desert"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =        math_random(2, 3)
		local radius =        2
		local limbs =         nil
		local fruit_chance =  0.1
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})
