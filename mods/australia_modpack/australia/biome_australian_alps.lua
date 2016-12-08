-- mods/australia_modpack/australia/biome_australian_alps.lua

-- localize math routines for performance
local math_random = math.random

-- australian alps
minetest.register_biome({
	name = "australian_alps",
	node_top = "default:snowblock",
	depth_top = 2,
	node_filler = "default:dirt_with_snow",
	depth_filler = 1,
	node_stone = "default:stone",
	y_min = 150,
	y_max = 31000,
	heat_point = 10,
	humidity_point = 50,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Bluestone (Basalt)
minetest.register_ore({
	ore_type		= "blob",
	ore				= "australia:bluestone",
	wherein			= {"default:stone"},
	clust_scarcity	= 16 * 16 * 16,
	clust_size		= 8,
	biomes			= {"australian_alps"},
	y_min			= 150,
	y_max			= 222,
	noise_threshold	= 0.0,
	noise_params	= {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = 677,
		octaves = 1,
		persist = 0.0
	},
})


--[[
	Decorations
--]]

-- Grass
local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:snowblock"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"australian_alps"},
		y_min = 150,
		y_max = 210,
		decoration = "default:grass_"..length,
	})
end

register_grass_decoration(0.015,  0.045, 2)
register_grass_decoration(0.03,   0.03,  1)

-- Snow
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:snowblock"},
	sidelen = 80,
	fill_ratio = 0.3,
	biomes = {"australian_alps"},
	y_min = 150,
	y_max = 31000,
	decoration = "default:snow",
})


--[[
	Trees
--]]

-- Snow Gum
aus.register_plant({
	nodes = {
		trunk = "australia:snow_gum_tree",
		leaves = "australia:snow_gum_leaves",
		air = "air", ignore = "ignore",
	},
	cover = 0.005,
	density = 0.005,
	priority = 50,
	check = function(t, pos)
		return pos.y >= 150 and pos.y <= 180 and table.contains({"australian_alps"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(2, 4)
			local radius = 2
			aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
		end,
})
