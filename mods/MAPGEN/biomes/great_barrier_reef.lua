--[[
	Great Barrier Reef
--]]


-- great barrier reef
minetest.register_biome({
	name =             "great_barrier_reef",
	node_top =         "default:sand",
	depth_top =        2,
	node_filler =      "australia:basalt",
	depth_filler =     3,
	node_stone =       "default:stone",
	node_river_water = "default:river_water_source",
	node_riverbed =    "default:sand",
	depth_riverbed =   1,
	y_min =            -31,
	y_max =            3,
	heat_point =       88,
	humidity_point =   73,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs.

minetest.register_ore({
	ore_type =       "scatter",
	ore =            "sea:woodship",
	wherein =        "default:sand",
	clust_scarcity = 27000,
	clust_num_ores = 1,
	clust_size =     12,
	biomes =         {"great_barrier_reef"},
	y_min =          -31,
	y_max =          -6,
})


--[[
	Decorations
--]]



--[[
	Trees
--]]


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


