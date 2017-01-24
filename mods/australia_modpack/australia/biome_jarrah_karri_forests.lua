-- mods/australia_modpack/australia/biome_jarrah_karri_forests.lua

-- localize math routines for performance
local math_random = math.random

-- jarrah / karri forests
minetest.register_biome({
	name = "jarrah_karri_forests",
	node_top = "default:dirt_with_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 3,
	node_stone = "default:sandstone",
	node_river_water = "australia:muddy_river_water_source",
	node_riverbed = "default:dirt",
	depth_riverbed = 1,
	y_min = 4,
	y_max = 31000,
	heat_point = 30,
	humidity_point = 60,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Bluestone (Basalt)
minetest.register_ore({
	ore_type				= "sheet",
	ore						= "australia:bluestone",
	wherein					= "default:stone",
	column_height_min		= 2,
	column_height_max		= 4,
	column_midpoint_factor	= 0.5,
	biomes					= {"jarrah_karri_forests"},
	y_min					= -192,
	y_max					= 0,
	noise_threshold			= 1.25,
	noise_params			= {
		offset = 0,
		scale = 2,
		spread = {x = 19, y = 19, z = 11},
		seed = 677,
		octaves = 2,
		persist = 0.8,
	},
})


--[[
	Decorations
--]]

-- Grass
local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"jarrah_karri_forests"},
		y_min = 4,
		y_max = 50,
		decoration = "default:grass_"..length,
	})
end

local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"jarrah_karri_forests"},
		y_min = 40,
		y_max = 240,
		decoration = "default:dry_grass_"..length,
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
	aus.register_plant({
		nodes = {"default:grass_"..length},
		cover = 0.1,
		density = 0.33,
		priority = 25,
		check = function(t, pos)
			return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 4 and pos.y <= 240 and table.contains({"jarrah_karri_forests"}, t.biome)
		end,
	})
end

register_rivergrass(5)
register_rivergrass(4)

-- Couch Honeypot
aus.register_plant({
	nodes = {"australia:couch_honeypot"},
	cover = 0.0015,
	density = 0.01,
	priority = 35,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 4 and pos.y <= 30 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
})

-- Kangaroo Paw
aus.register_plant({
	nodes = {"australia:kangaroo_paw"},
	cover = 0.0015,
	density = 0.01,
	priority = 30,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.03 and pos.y >= 4 and pos.y <= 30 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
})

aus.register_plant({
	nodes = {"australia:kangaroo_paw"},
	cover = 0.0015,
	density = 0.01,
	priority = 30,
	check = function(t, pos)
		return t.v4 > 0.3 and pos.y >= 4 and pos.y <= 30 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
})

-- Small stone rocks
local function register_small_stone_rocks(number)
	minetest.register_decoration({
		deco_type = "simple",
		decoration = "australia:small_stone_rocks"..number,
		sidelen = 80,
		place_on = {"default:dirt_with_grass"},
		fill_ratio = 0.001,
		y_min = 24,
		biomes = {"jarrah_karri_forests"},
		flags = "place_center_x, place_center_z",
		rotation = "random",
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
aus.register_plant({
	nodes = {
		trunk = "australia:bull_banksia_tree",
		leaves = "australia:bull_banksia_leaves",
		air = "air", ignore = "ignore",
	},
	cover = 0.005,
	density = 0.0025,
	priority = 40,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 15 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(3, 5)
			local radius = math_random(2, 3)
			aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
		end,
})

-- Coolabah
aus.register_plant({
	nodes = {
		trunk = "australia:coolabah_tree",
		leaves = "australia:coolabah_leaves",
		air = "air", ignore = "ignore",
	},
	cover = 0.0025,
	density = 0.025,
	priority = 40,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y <= 60 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(7, 10)
			local radius = math_random(4, 5)
			local limbs = true
			aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
		end,
})

-- Flame Grevillea
aus.register_plant({
	nodes = {
		trunk = "australia:flame_grevillea_tree",
		leaves = "australia:flame_grevillea_leaves",
		air = "air", ignore = "ignore",
	},
	cover = 0.0004,
	density = 0.002,
	priority = 35,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 40 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(2, 3)
			local radius = math_random(2, 3)
			aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
		end,
})

-- Jarrah
aus.register_plant({
	nodes = {
		trunk = "australia:jarrah_tree",
		leaves = "australia:jarrah_leaves",
		air = "air", ignore = "ignore",
	},
	cover = 0.004,
	density = 0.002,
	priority = 55,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 5 and pos.y <= 35 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(15, 20)
			local radius = math_random(8, 10)
			local limbs = true
			aus.make_jarrah(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
		end,
})

-- Karri
aus.register_plant({
	nodes = {
		trunk = "australia:karri_tree",
		leaves = "australia:karri_leaves",
		air = "air", ignore = "ignore",
	},
	cover = 0.003,
	density = 0.001,
	priority = 50,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 5 and pos.y <= 35 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(20, 30)
			local radius = math_random(8, 10)
			local limbs = true
			aus.make_karri(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
		end,
})

-- Marri
aus.register_plant({
	nodes = {
		trunk = "australia:marri_tree",
		leaves = "australia:marri_leaves",
		air = "air", ignore = "ignore",
	},
	cover = 0.002,
	density = 0.001,
	priority = 45,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 5 and pos.y <= 35 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(15, 20)
			local radius = math_random(7, 10)
			local limbs = true
			aus.make_marri(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
		end,
})

-- Rottnest Island Pine
aus.register_plant({
	nodes = {
		trunk = "australia:rottnest_island_pine_tree",
		leaves = "australia:rottnest_island_pine_leaves",
		air = "air", ignore = "ignore",
	},
	cover = 0.0025,
	density = 0.05,
	priority = 60,
	check = function(t, pos)
		return t.valleys > 0.3 and pos.y >= 4 and pos.y <= 67 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(3, 4)
			local radius = 3
			aus.make_conifer(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
		end,
})

-- Swamp Paperbark
aus.register_plant({
	nodes = {
		trunk = "australia:swamp_paperbark_tree",
		leaves = "australia:swamp_paperbark_leaves",
		air = "air", ignore = "ignore",
	},
	cover = 0.025,
	density = 0.05,
	priority = 40,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.03 and pos.y >= 5 and pos.y <= 30 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(3, 4)
			local radius = 2
			aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
		end,
})

-- Swamp Paperbark
aus.register_plant({
	nodes = {
		trunk = "australia:swamp_paperbark_tree",
		leaves = "australia:swamp_paperbark_leaves",
		air = "air", ignore = "ignore",
	},
	cover = 0.0025,
	density = 0.005,
	priority = 40,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.3 and t.v4 > 0.5 and pos.y >= 5 and pos.y <= 30 and table.contains({"jarrah_karri_forests"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(3, 4)
			local radius = 2
			aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
		end,
})
