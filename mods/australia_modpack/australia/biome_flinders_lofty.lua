-- mods/australia_modpack/australia/biome_flinders_lofty.lua

-- localize math routines for performance
local math_random = math.random

-- flinders / lofty
minetest.register_biome({
	name =              "flinders_lofty",
	node_top =          "default:dirt_with_dry_grass",
	depth_top =         1,
	node_filler =       "australia:red_dirt",
	depth_filler =      2,
	node_stone =        "default:stone",
	node_river_water =  "australia:muddy_river_water_source",
	node_riverbed =     "default:dirt",
	depth_riverbed =    1,
	y_min =             4,
	y_max =             31000,
	heat_point =        50,
	humidity_point =    50,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Bluestone (Basalt)
minetest.register_ore({
	ore_type =         "blob",
	ore =              "australia:bluestone",
	wherein =          {"default:stone"},
	clust_scarcity =   24 * 24 * 24,
	clust_size =       8,
	biomes =           {"flinders_lofty"},
	y_min =            0,
	y_max =            47,
	noise_threshold =  0.2,
	noise_params =     {
		offset =   0.5,
		scale =    0.2,
		spread =   {x = 5, y = 5, z = 5},
		seed =     774,
		octaves =  1,
		persist =  0.0
	},
})

minetest.register_ore({
	ore_type =                "sheet",
	ore =                     "australia:bluestone",
	wherein =                 "default:stone",
	column_height_min =       2,
	column_height_max =       4,
	column_midpoint_factor =  0.5,
	biomes =                  {"flinders_lofty"},
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

-- Copper (Olympic Dam)
minetest.register_ore({
	ore_type =         "vein",
	ore =              "default:stone_with_copper",
	wherein =          "default:stone",
	biomes =           {"flinders_lofty"},
	y_min =            -64,
	y_max =            34,
	noise_threshold =  1.6,
	noise_params =     {
		offset =   0,
		scale =    3,
		spread =   {x=211, y=211, z=211},
		seed =     4825,
		octaves =  3,
		persist =  0.6,
		flags =    "eased",
	},
})


--[[
	Decorations
--]]

-- Grass
local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"default:dirt_with_dry_grass"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"flinders_lofty"},
		y_min =         4,
		y_max =         73,
		decoration =    "default:grass_"..length,
	})
end

local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"default:dirt_with_dry_grass"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"flinders_lofty"},
		y_min =         68,
		y_max =         240,
		decoration =    "default:dry_grass_"..length,
	})
end

register_grass_decoration(0.015, 0.045, 2)
register_grass_decoration(0.03, 0.03, 1)

register_dry_grass_decoration(0.01, 0.05, 5)
register_dry_grass_decoration(0.03, 0.03, 4)
register_dry_grass_decoration(0.05, 0.01, 3)
register_dry_grass_decoration(0.07, -0.01, 2)
register_dry_grass_decoration(0.09, -0.03, 1)

-- Grass near rivers
local function register_rivergrass(length)
	aus.register_plant({
		nodes =     {"default:grass_"..length},
		cover =     0.33,
		density =   0.5,
		priority =  25,
		check = function(t, pos)
			return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 4 and pos.y <= 240 and table.contains({"flinders_lofty"}, t.biome)
		end,
	})
end

register_rivergrass(5)
register_rivergrass(4)

-- Lavender Grevillea
aus.register_plant({
	nodes = {
		trunk =  "australia:lavender_grevillea",
		leaves =  "australia:lavender_grevillea",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0001,
	density =   0.025,
	priority =  50,
	check = function(t, pos)
		return t.v2 > 0.1 and t.v4 > 0.5 and t.v3 < 40 and pos.y >= 5 and pos.y <= 73 and table.contains({"flinders_lofty"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(1, 2)
		local radius =  math_random(1, 2)
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Pink Mulla Mulla
aus.register_plant({
	nodes =     {"australia:pink_mulla_mulla"},
	cover =     0.0015,
	density =   0.01,
	priority =  30,
	check = function(t, pos)
		return t.v4 > 0.3 and pos.y >= 5 and pos.y <= 70 and table.contains({"flinders_lofty"}, t.biome)
	end,
})

-- Sturt's Desert Pea'
aus.register_plant({
	nodes =     {"australia:sturts_desert_pea"},
	cover =     0.0025,
	density =   0.2,
	priority =  30,
	check = function(t, pos)
		return t.v2 > 0.1 and t.v4 > 0.5 and t.v3 < 40 and pos.y >= 5 and pos.y <= 50 and table.contains({"flinders_lofty"}, t.biome)
	end,
})

-- Small stone rocks
local function register_small_stone_rocks(number)
	minetest.register_decoration({
		deco_type =   "simple",
		decoration =  "australia:small_stone_rocks"..number,
		sidelen =     80,
		place_on =    {"default:dirt_with_dry_grass"},
		fill_ratio =  0.002,
		y_min =       24,
		biomes =      {"flinders_lofty"},
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
		return pos.y >= 5 and pos.y <= 50 and table.contains({"flinders_lofty"}, t.biome)
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
		trunk =   "australia:black_wattle_tree",
		leaves =  "australia:black_wattle_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0002,
	density =   0.002,
	priority =  35,
	check = function(t, pos)
		return pos.y >= 51 and pos.y <= 125 and table.contains({"flinders_lofty"}, t.biome)
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
		trunk =   "australia:cherry_tree",
		leaves =  "australia:cherry_leaves",
		fruit =   "australia:cherry",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.001,
	priority =  30,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 70 and table.contains({"flinders_lofty"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =        math_random(3, 4)
		local radius =        3
		local limbs =         nil
		local fruit_chance =  0.2
		aus.make_conifer(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
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
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y <= 60 and table.contains({"flinders_lofty"}, t.biome)
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
	cover =     0.0002,
	density =   0.0025,
	priority =  40,
	check = function(t, pos)
		return t.v4 < 0.5 and pos.y >= 5 and pos.y <= 150 and table.contains({"flinders_lofty"}, t.biome)
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
		return t.valleys > 0.3 and pos.y >= 5 and pos.y <= 150 and table.contains({"flinders_lofty"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 4)
		local radius =  2
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
	cover =     0.002,
	density =   0.005,
	priority =  70,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.03 and pos.y >= 5 and pos.y <= 72 and table.contains({"flinders_lofty"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(12, 18)
		local radius =  math_random(6, 8)
		local limbs =   true
		aus.make_river_red_gum(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Sugar Gum
aus.register_plant({
	nodes = {
		trunk =   "australia:sugar_gum_tree",
		leaves =  "australia:sugar_gum_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.00025,
	density =   0.001,
	priority =  40,
	check = function(t, pos)
		return pos.y >= 5 and pos.y < 60 and table.contains({"flinders_lofty"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(9, 13)
		local radius =  math_random(8, 10)
		local limbs =   true
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})
