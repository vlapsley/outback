--[[
	Australian Alps
--]]


-- localize math routines for performance
local math_random = math.random

-- australian alps
minetest.register_biome({
	name =             "australian_alps",
	node_top =         "base:snowblock",
	depth_top =        2,
	node_filler =      "base:dirt_with_snow",
	depth_filler =     1,
	node_stone =       "base:stone",
	node_river_water = "base:river_water_source",
	node_riverbed =    "base:shale",
	depth_riverbed =   1,
	y_min =            150,
	y_max =            31000,
	heat_point =       10,
	humidity_point =   30,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Basalt
minetest.register_ore({
	ore_type =       "blob",
	ore =            "base:basalt",
	wherein =        {"base:stone"},
	clust_scarcity = 3375,
	clust_num_ores = 33,
	clust_size =     5,
	biomes =         {"australian_alps"},
	y_min =          -32,
	y_max =          31000,
})

minetest.register_ore({
	ore_type =       "blob",
	ore =            "base:basalt",
	wherein =        {"base:stone"},
	clust_scarcity = 1000,
	clust_num_ores = 58,
	clust_size =     7,
	biomes =         {"australian_alps"},
	y_min =          -32,
	y_max =          31000,
})


--[[
	Decorations
--]]

-- Grass
local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"base:snowblock"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"australian_alps"},
		y_min =         150,
		y_max =         210,
		decoration =    "base:grass_"..length,
	})
end

register_grass_decoration(0.015,  0.045, 2)
register_grass_decoration(0.03,   0.03,  1)

-- Snow
minetest.register_decoration({
	deco_type =   "simple",
	place_on =    {"base:snowblock"},
	sidelen =     80,
	fill_ratio =  0.3,
	biomes =      {"australian_alps"},
	y_min =       150,
	y_max =       31000,
	decoration =  "base:snow",
})


--[[
	Trees
--]]

-- Snow Gum
plants_api.register_plant({
	nodes = {
		trunk =   "base:snow_gum_tree",
		leaves =  "base:snow_gum_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.005,
	density =   0.005,
	priority =  50,
	check = function(t, pos)
		return pos.y >= 150 and pos.y <= 180 and table.contains({"australian_alps"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(2, 4)
		local radius =  2
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})
