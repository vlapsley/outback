--[[
	Great Australian Bight
--]]


-- localize math routines for performance
local math_random = math.random

-- great australian bight
minetest.register_biome({
	name =             "great_australian_bight",
	node_top =         "base:limestone",
	depth_top =        3,
	node_filler =      "base:basalt",
	depth_filler =     4,
	node_stone =       "base:stone",
	node_river_water = "base:muddy_water_source",
	node_riverbed =    "base:limestone",
	depth_riverbed =   1,
	y_min =            -32,
	y_max =            3,
	heat_point =       55,
	humidity_point =   50,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "sea:submarine",
	wherein =        "base:sand",
	clust_scarcity = 512000,
	clust_num_ores = 1,
	clust_size =     12,
	biomes =         {"great_australian_bight"},
	y_min =          -32,
	y_max =          -8,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "sea:woodship",
	wherein =        "base:sandstone",
	clust_scarcity = 27000,
	clust_num_ores = 1,
	clust_size =     12,
	biomes =         {"great_australian_bight"},
	y_min =          -32,
	y_max =          -6,
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

minetest.register_abm({
	nodenames =  {"sea:submarine"},
	interval =   1,
	chance =     1,
	action = function(pos, node)
		local yp = {x = pos.x, y = pos.y + 8, z = pos.z}
		if node.name == "sea:submarine" and
				minetest.get_node(yp).name == "base:water_source" then
			sea.place_submarine(pos)
		end
	end
})


