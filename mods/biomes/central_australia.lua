--[[
	Central Australia
--]]


-- central australia
minetest.register_biome({
	name =             "central_australia",
	node_top =         "outback:red_dirt",
	depth_top =        2,
	node_filler =      "outback:red_sandstone",
	depth_filler =     2,
	node_stone =       "technic:granite",
	node_river_water = "outback:muddy_water_source",
	node_riverbed =    "outback:red_dirt",
	depth_riverbed =   1,
	y_max =            31000,
	y_min =            4,
	heat_point =       38,
	humidity_point =   66,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Copper (Olympic Dam)
minetest.register_ore({
	ore_type =        "blob",
	ore =             "outback:granite_with_copper",
	wherein =         {"technic:granite"},
	clust_scarcity =  85184,
	clust_size =      8,
	biomes =          {"central_australia"},
	y_max =           12,
	y_min =           -31,
	noise_threshold = 1,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x = 16, y = 16, z = 16},
		seed =    555,
		octaves = 3,
		persist = 0.6
	},
})

-- Opal (Coober Pedy)
minetest.register_ore({
	ore_type =        "vein",
	ore =             "outback:granite_with_opal",
	wherein =         "technic:granite",
	biomes =          {"central_australia"},
	y_max =           21,
	y_min =           -31,
	noise_threshold = 1.7,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x=211, y=211, z=211},
		seed =    3223,
		octaves = 3,
		persist = 0.5,
		flags =   "eased",
	},
})

-- Smoky Quartz (Kalkarindji)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:granite_with_smoky_quartz",
	wherein =        {"technic:granite"},
	biomes =         {"central_australia"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          19,
	y_min =          -31,
})

-- Uranium (Olympic Dam)
minetest.register_ore({
	ore_type =        "scatter",
	ore =             "technic:granite_mineral_uranium",
	wherein =         "technic:granite",
	clust_scarcity =  8000,
	clust_num_ores =  8,
	clust_size =      5,
	biomes =          {"central_australia"},
	y_max =           12,
	y_min =           -31,
	noise_threshold = 0.6,
	noise_params =    {
		offset =  0,
		scale =   1,
		spread =  {x = 100, y = 100, z = 100},
		seed =    419,
		octaves = 3,
		persist = 0.7
	},
})


--[[
	Decorations
--]]

local function register_decorations()

    -- Grass
    local function register_dry_grass_decoration(offset, scale, length)
        minetest.register_decoration({
            deco_type =     "simple",
            place_on =      {"outback:red_dirt"},
            sidelen =       16,
            noise_params =  {
                offset =   offset,
                scale =    scale,
                spread =   {x = 200, y = 200, z = 200},
                seed =     329,
                octaves =  3,
                persist =  0.6
            },
            biomes =        {"central_australia"},
            y_max =         300,
            y_min =         4,
            decoration =    "default:dry_grass_"..length,
        })
    end

    register_dry_grass_decoration(0.05, 0.01,  3)
    register_dry_grass_decoration(0.07, -0.01, 2)
    register_dry_grass_decoration(0.09, -0.03, 1)

    -- Small stone rocks
    local function register_small_red_rocks(number)
        minetest.register_decoration({
            deco_type =   "simple",
            decoration =  "outback:small_red_rocks"..number,
            sidelen =     80,
            place_on =    {"outback:red_dirt"},
            fill_ratio =  0.002,
            biomes =      {"central_australia"},
            flags =       "place_center_x, place_center_z",
            rotation =    "random",
        })
    end

    register_small_red_rocks(6)
    register_small_red_rocks(5)
    register_small_red_rocks(4)
    register_small_red_rocks(3)
    register_small_red_rocks(2)
    register_small_red_rocks(1)
end

if outback.decorations then
    register_decorations()
end
