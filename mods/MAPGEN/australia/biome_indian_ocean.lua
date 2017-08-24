-- mods/australia_modpack/australia/biome_indian_ocean.lua

-- localize math routines for performance
local math_random = math.random

-- indian ocean
minetest.register_biome({
	name =            "indian_ocean",
	node_top =        "base:sand",
	depth_top =       3,
	node_filler =     "base:bluestone",
	depth_filler =    4,
	node_stone =      "base:stone",
	node_riverbed =   "base:sand",
	depth_riverbed =  1,
	y_min =           -192,
	y_max =           3,
	heat_point =      70,
	humidity_point =  35,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

minetest.register_ore({
	ore_type =        "scatter",
	ore =             "sea:woodship",
	wherein =         "base:sand",
	clust_scarcity =  30 * 30 * 30,
	clust_num_ores =  1,
	clust_size =      12,
	biomes =          {"indian_ocean"},
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
		biomes =        {"indian_ocean"},
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
		biomes =        {"indian_ocean"},
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

-- Rottnest Island Pine
plants_api.register_plant({
	nodes = {
		trunk =   "base:rottnest_island_pine_tree",
		leaves =  "base:rottnest_island_pine_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0025,
	density =   0.05,
	priority =  60,
	check = function(t, pos)
		return pos.y >= 3 and table.contains({"indian_ocean"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 4)
		local radius =  3
		aus.make_conifer(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
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


