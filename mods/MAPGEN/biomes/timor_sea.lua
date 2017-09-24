--[[
	Timor Sea
--]]


-- timor sea
minetest.register_biome({
	name =             "timor_sea",
	node_top =         "default:sand",
	depth_top =        2,
	node_filler =      "default:sandstone",
	depth_filler =     2,
	node_stone =       "default:stone",
	node_river_water = "base:muddy_water_source",
	node_water =       "default:water_source",
	node_riverbed =    "default:sand",
	depth_riverbed =   1,
	y_min =            -31,
	y_max =            3,
	heat_point =       70,
	humidity_point =   90,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Oil
minetest.register_ore({
	ore_type =               "sheet",
	ore =                    "base:crude_oil_source",
	wherein =                {"default:stone"},
	biomes =                 {"timor_sea"},
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
	wherein =        "default:sand",
	clust_scarcity = 512000,
	clust_num_ores = 1,
	clust_size =     12,
	biomes =         {"timor_sea"},
	y_min =          -31,
	y_max =          -8,
})


--[[
	Decorations
--]]

local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"default:sand"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"timor_sea"},
		y_min =         3,
		y_max =         3,
		decoration =    "default:grass_"..length,
	})
end

-- Grasses
register_grass_decoration(-0.03,  0.09,  5)
register_grass_decoration(-0.015, 0.075, 4)
register_grass_decoration(0,      0.06,  3)
register_grass_decoration(0.015,  0.045, 2)
register_grass_decoration(0.03,   0.03,  1)


--[[
	Trees
--]]



--[[
	ABM's
--]]

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


