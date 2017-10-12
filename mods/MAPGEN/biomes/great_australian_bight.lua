--[[
	Great Australian Bight
--]]


-- great australian bight
minetest.register_biome({
	name =             "great_australian_bight",
	node_top =         "australia:limestone",
	depth_top =        3,
	node_filler =      "australia:basalt",
	depth_filler =     3,
	node_stone =       "default:stone",
	node_river_water = "australia:muddy_water_source",
	node_riverbed =    "australia:limestone",
	depth_riverbed =   1,
	y_min =            -31,
	y_max =            3,
	heat_point =       55,
	humidity_point =   50,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Oil
minetest.register_ore({
	ore_type =               "sheet",
	ore =                    "australia:crude_oil_source",
	wherein =                {"default:stone"},
	biomes =                 {"great_australian_bight"},
	column_height_min =      2,
	column_height_max =      4,
	column_midpoint_factor = 0.5,
	y_min =                  -31,
	y_max =                  -3,
	noise_threshold =        1.25,
	noise_params =           {
		offset =  0,
		scale =   2,
		spread =  {x = 24, y = 24, z = 24},
		seed =    812,
		octaves = 2,
		persist = 0.5,
	},
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "sea:submarine",
	wherein =        "australia:limestone",
	clust_scarcity = 512000,
	clust_num_ores = 1,
	clust_size =     12,
	biomes =         {"great_australian_bight"},
	y_min =          -31,
	y_max =          -8,
})

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "sea:woodship",
	wherein =        "australia:limestone",
	clust_scarcity = 27000,
	clust_num_ores = 1,
	clust_size =     12,
	biomes =         {"great_australian_bight"},
	y_min =          -31,
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
				minetest.get_node(yp).name == "default:water_source" then
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
				minetest.get_node(yp).name == "default:water_source" then
			sea.place_submarine(pos)
		end
	end
})


