-- mods/australia/biome_central_australia.lua

-- localize math routines for performance
local math_random = math.random

-- central australia
minetest.register_biome({
	name = "central_australia",
	--node_dust = "",
	node_top = "australia:red_dirt",
	depth_top = 1,
	node_filler = "australia:red_stone",
	depth_filler = 2,
	node_stone = "default:stone",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	node_river_water = "australia:muddy_river_water_source",
	y_min = 4,
	y_max = 31000,
	heat_point = 80,
	humidity_point = 25,
})



--
-- Ores
--

-- Blob ore first to avoid other ores inside blobs

-- Opal
-- Coober Pedy
minetest.register_ore({
	ore_type        = "vein",
	ore             = "australia:stone_with_opal",
	wherein         = "default:stone",
	biomes          = {"central_australia"},
	y_min           = -30,
	y_max           = 23,
	noise_params = {
		offset = 0,
		scale = 3,
		spread = {x=211, y=211, z=211},
		seed = 3223,
		octaves = 3,
		persist = 0.5,
		flags = "eased",
	},
	noise_threshold = 1.7,
})

-- Uranium from Technic modpack: technic_worldgen mod
-- Olympic Dam
if minetest.get_modpath("technic_worldgen") then
	minetest.register_ore({
		ore_type        = "scatter",
		ore             = "technic:mineral_uranium",
		wherein         = "default:stone",
		clust_scarcity  = 20 * 20 * 20,
		clust_num_ores  = 6,
		clust_size      = 4,
		biomes          = {"central_australia"},
		y_min           = -64,
		y_max           = 11,
		noise_params    = {
			offset = 0,
			scale = 1,
			spread = {x = 100, y = 100, z = 100},
			seed = 419,
			octaves = 3,
			persist = 0.7
			},
		noise_threshold = 0.6,
	})
end



--
-- Decorations
--

local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"australia:red_dirt"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"central_australia"},
		y_min = 4,
		y_max = 300,
		decoration = "default:dry_grass_"..length,
	})
end

-- Dry grasses
register_dry_grass_decoration(0.05, 0.01,  3)
register_dry_grass_decoration(0.07, -0.01, 2)
register_dry_grass_decoration(0.09, -0.03, 1)

-- Grass near rivers
local function register_dryrivergrass(length)
	aus.register_plant({
		nodes = {"default:dry_grass_"..length},
		cover = 0.1,
		density = 0.33,
		priority = 25,
		check = function(t, pos)
			return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 4 and pos.y <= 300 and table.contains({"central_australia"}, t.biome)
		end,
	})
end
register_dryrivergrass(5)
register_dryrivergrass(4)

-- Bush Tomato
aus.register_plant({
	nodes = {"australia:tomato_bush"},
	cover = 0.0002,
	density = 0.01,
	priority = 30,
	check = function(t, pos)
		return t.valleys > 0.25 and pos.y >= 15 and pos.y <= 153 and table.contains({"central_australia"}, t.biome)
	end,
})

-- Mitchell Grass
aus.register_plant({
	nodes = {"australia:mitchell_grass"},
	cover = 0.01,
	density = 0.01,
	priority = 35,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.2 and pos.y >= 5 and pos.y <= 70 and table.contains({"central_australia"}, t.biome)
	end,
})

-- Pink Mulla Mulla
aus.register_plant({
	nodes = {"australia:pink_mulla_mulla"},
	cover = 0.0015,
	density = 0.005,
	priority = 30,
	check = function(t, pos)
		return t.v4 > 0.3 and pos.y >= 5 and pos.y <= 70 and table.contains({"central_australia"}, t.biome)
	end,
})

-- Spinifex
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"australia:red_dirt"},
	sidelen = 80,
	fill_ratio = 0.02,
	biomes = {"central_australia"},
	y_min = 4,
	y_max = 41,
	decoration = "australia:spinifex",
})

-- Sturt's Desert Pea
aus.register_plant({
	nodes = {"australia:sturts_desert_pea"},
	cover = 0.001,
	density = 0.2,
	priority = 30,
	check = function(t, pos)
		return t.v2 > 0.1 and t.v4 > 0.5 and t.v3 < 40 and pos.y >= 5 and pos.y <= 50 and table.contains({"central_australia"}, t.biome)
	end,
})

local function register_small_red_rocks(number)
	minetest.register_decoration({
		deco_type = "simple",
		decoration = "australia:small_red_rocks"..number,
		sidelen = 80,
		place_on = {"australia:red_dirt"},
		fill_ratio = 0.002,
		biomes = {"central_australia"},
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

-- Small stone rocks
register_small_red_rocks(6)
register_small_red_rocks(5)
register_small_red_rocks(4)
register_small_red_rocks(3)
register_small_red_rocks(2)
register_small_red_rocks(1)


--
-- Trees
--

-- Coolabah Tree
aus.register_plant({
	nodes = {
		trunk = "australia:coolabah_tree",
		leaves = "australia:coolabah_leaves",
		air = "air", ignore = "ignore",
	},
	cover = 0.0025,
	density = 0.001,
	priority = 40,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y < 60 and table.contains({"central_australia"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(8,10)
			local radius = math_random(4,5)
			local limbs = true
			aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
		end,
})

-- Desert Oak
aus.register_plant({
	nodes = {
		trunk = "australia:desert_oak_tree",
		leaves = "australia:desert_oak_leaves",
		air = "air", ignore = "ignore",
	},
	cover = 0.001,
	density = 0.005,
	priority = 60,
	check = function(t, pos)
		return pos.y >= 25 and pos.y <= 70 and table.contains({"central_australia"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(4,8)
			local radius = math_random(2,4)
			aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
		end,
})

-- Quandong
aus.register_plant({
	nodes = {
		trunk = "australia:quandong_tree",
		leaves = "australia:quandong_leaves",
		fruit = "australia:quandong",
		air = "air", ignore = "ignore",
	},
	cover = 0.0005,
	density = 0.0025,
	priority = 50,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.03 and pos.y >= 10 and pos.y <= 77 and table.contains({"central_australia"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(2,3)
			local radius = 2
			local limbs = nil
			local fruit_chance = 0.2
			aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
		end,
})

-- Quandong
aus.register_plant({
	nodes = {
		trunk = "australia:quandong_tree",
		leaves = "australia:quandong_leaves",
		fruit = "australia:quandong",
		air = "air", ignore = "ignore",
	},
	cover = 0.0005,
	density = 0.001,
	priority = 50,
	check = function(t, pos)
		return t.v4 > 0.5 and pos.y >= 10 and pos.y <= 77 and table.contains({"central_australia"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(2,3)
			local radius = 2
			local limbs = nil
			local fruit_chance = 0.1
			aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
		end,
})

-- River Red Gum
aus.register_plant({
	nodes = {
		trunk = "australia:river_red_gum_tree",
		leaves = "australia:river_red_gum_leaves",
		air = "air", ignore = "ignore",
	},
	cover = 0.0025,
	density = 0.001,
	priority = 25,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y <= 72 and table.contains({"central_australia"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(12,18)
			local radius = math_random(6,8)
			local limbs = true
			aus.make_river_red_gum(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
		end,
})

-- Wirewood
aus.register_plant({
	nodes = {
		trunk = "australia:wirewood_tree",
		leaves = "australia:wirewood_leaves",
		air = "air", ignore = "ignore",
	},
	cover = 0.001,
	density = 0.001,
	priority = 55,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.04 and pos.y >= 5 and pos.y <= 75 and table.contains({"central_australia"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(6,8)
			local radius = 2
			aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
		end,
})

-- Wirewood
aus.register_plant({
	nodes = {
		trunk = "australia:wirewood_tree",
		leaves = "australia:wirewood_leaves",
		air = "air", ignore = "ignore",
	},
	cover = 0.001,
	density = 0.001,
	priority = 45,
	check = function(t, pos)
		return t.v4 > 0.5 and pos.y >= 5 and pos.y <= 75 and table.contains({"central_australia"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(6,8)
			local radius = 2
			aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
		end,
})
