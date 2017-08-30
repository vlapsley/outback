--[[
	Tasman Sea
--]]


-- localize math routines for performance
local math_random = math.random

-- tasman sea
minetest.register_biome({
	name =            "tasman_sea",
	node_top =        "base:sand",
	depth_top =       3,
	node_filler =     "base:basalt",
	depth_filler =    4,
	node_stone =      "base:stone",
	node_riverbed =   "base:sand",
	depth_riverbed =  1,
	y_min =           -192,
	y_max =           3,
	heat_point =      10,
	humidity_point =  10,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

minetest.register_ore({
	ore_type =        "scatter",
	ore =             "sea:woodship",
	wherein =         {"base:sand"},
	clust_scarcity =  60 * 60 * 60,
	clust_num_ores =  1,
	clust_size =      12,
	biomes =          {"tasman_sea"},
	y_min =           -64,
	y_max =           -6,
})


--[[
	Decorations
--]]

-- Grass
local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"base:sand"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"tasman_sea"},
		y_min =         3,
		y_max =         3,
		decoration =    "base:grass_"..length,
	})
end

local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"base:sand"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"tasman_sea"},
		y_min =         3,
		y_max =         3,
		decoration =    "base:dry_grass_"..length,
	})
end

register_grass_decoration(0.015,  0.045, 2)
register_grass_decoration(0.03,   0.03,  1)

register_dry_grass_decoration(0.01, 0.05,  5)
register_dry_grass_decoration(0.03, 0.03,  4)
register_dry_grass_decoration(0.05, 0.01,  3)


--[[
	Trees
--]]

-- Coast Banksia (small)
plants_api.register_plant({
	nodes = {
		trunk =   "base:coast_banksia_tree",
		leaves =  "base:coast_banksia_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0005,
	density =   0.001,
	priority =  40,
	check = function(t, pos)
		return pos.y >= 3 and pos.y <= 3 and table.contains({"tasman_sea"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 5)
		local radius =  math_random(2, 3)
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})


--[[
	ABM's
--]]

minetest.register_abm({
	nodenames =  {"sea:woodship"},
	interval =   1,
	chance =     1,
	action = function(pos, node)
		local yp = {x = pos.x, y = pos.y + 3, z = pos.z}
		if node.name == "sea:woodship" and 
				minetest.get_node(yp).name == "base:water_source" then
			sea.place_woodship(pos)
		end
	end
})


