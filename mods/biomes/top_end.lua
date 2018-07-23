--[[
	Top End
--]]


-- top end
minetest.register_biome({
	name =             "top_end",
	node_top =         "default:dirt_with_grass",
	depth_top =        1,
	node_filler =      "default:sandstone",
	depth_filler =     3,
	node_stone =       "default:stone",
	node_river_water = "outback:muddy_water_source",
	node_riverbed =    "default:dirt",
	depth_riverbed =   1,
	y_max =            31000,
	y_min =            4,
	heat_point =       86,
	humidity_point =   86,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Lead (McArthur River)
minetest.register_ore({
	ore_type =        "blob",
	ore =             "technic:mineral_lead",
	wherein =         {"default:stone"},
	clust_scarcity =  85184,
	clust_size =      8,
	biomes =          {"top_end"},
	y_max =           4,
	y_min =           -31,
	noise_threshold = 1.1,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x = 16, y = 16, z = 16},
		seed =    556,
		octaves = 3,
		persist = 0.6
	},
})

-- Zinc (McArthur River)
minetest.register_ore({
	ore_type =        "blob",
	ore =             "technic:mineral_zinc",
	wherein =         {"default:stone"},
	clust_scarcity =  85184,
	clust_size =      8,
	biomes =          {"top_end"},
	y_max =           4,
	y_min =           -31,
	noise_threshold = 1.2,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x = 16, y = 16, z = 16},
		seed =    557,
		octaves = 3,
		persist = 0.6
	},
})

-- Diamonds (Argyle)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "default:stone_with_diamond",
	wherein =        {"default:stone"},
	clust_scarcity = 64000,
	clust_num_ores = 12,
	clust_size =     6,
	biomes =         {"top_end"},
	y_max =          17,
	y_min =          -31,
})

-- Uranium (Ranger)
minetest.register_ore({
	ore_type =        "scatter",
	ore =             "technic:mineral_uranium",
	wherein =         {"default:stone"},
	clust_scarcity =  21952,
	clust_num_ores =  4,
	clust_size =      3,
	biomes =          {"top_end"},
	y_max =           19,
	y_min =           -31,
	noise_threshold = 0.6,
	noise_params =    {
		offset =  0,
		scale =   1,
		spread =  {x = 100, y = 100, z = 100},
		seed =    420,
		octaves = 3,
		persist = 0.7
		},
})

-- Uranium (Jabiluka)
minetest.register_ore({
	ore_type =        "scatter",
	ore =             "technic:mineral_uranium",
	wherein =         {"default:stone"},
	clust_scarcity =  17576,
	clust_num_ores =  4,
	clust_size =      3,
	biomes =          {"top_end"},
	y_max =           6,
	y_min =           -31,
	noise_threshold = 0.6,
	noise_params =    {
		offset =  0,
		scale =   1,
		spread =  {x = 100, y = 100, z = 100},
		seed =    241,
		octaves = 3,
		persist = 0.7
		},
})


--[[
	Decorations
--]]

local function register_decorations()

    -- Grass
    local function register_grass_decoration(offset, scale, length)
        minetest.register_decoration({
            deco_type =     "simple",
            place_on =      {"default:dirt_with_grass"},
            sidelen =       16,
            noise_params =  {
                offset =   offset,
                scale =    scale,
                spread =   {x = 200, y = 200, z = 200},
                seed =     329,
                octaves =  3,
                persist =  0.6
            },
            biomes =        {"top_end"},
            y_max =         20,
            y_min =         4,
            decoration =    "default:grass_"..length,
        })
    end

    local function register_dry_grass_decoration(offset, scale, length)
        minetest.register_decoration({
            deco_type =     "simple",
            place_on =      {"default:dirt_with_grass"},
            sidelen =       16,
            noise_params =  {
                offset =   offset,
                scale =    scale,
                spread =   {x = 200, y = 200, z = 200},
                seed =     329,
                octaves =  3,
                persist =  0.6
            },
            biomes =        {"top_end"},
            y_max =         300,
            y_min =         18,
            decoration =    "default:dry_grass_"..length,
        })
    end

    register_grass_decoration(-0.03,  0.09,  5)
    register_grass_decoration(-0.015, 0.075, 4)
    register_grass_decoration(0,      0.06,  3)
    register_grass_decoration(0.015,  0.045, 2)
    register_grass_decoration(0.03,   0.03,  1)

    register_dry_grass_decoration(0.01, 0.05,  5)
    register_dry_grass_decoration(0.03, 0.03,  4)
    register_dry_grass_decoration(0.05, 0.01,  3)
    register_dry_grass_decoration(0.07, -0.01, 2)
    register_dry_grass_decoration(0.09, -0.03, 1)

    -- Waterlily
    minetest.register_decoration({
        name = "default:waterlily",
        deco_type = "simple",
        place_on = {
            "default:dirt",
            "default:sand",
        },
        sidelen = 16,
        noise_params = {
            offset = -0.12,
            scale = 0.3,
            spread = {x = 200, y = 200, z = 200},
            seed = 33,
            octaves = 3,
            persist = 0.7
        },
        biomes = {"top_end"},
        y_max = 96,
        y_min = 0,
        decoration = "flowers:waterlily",
        param2 = 0,
        param2_max = 3,
        place_offset_y = 1,
    })

    -- Small sandstone rocks
    local function register_small_sandstone_rocks(number)
        minetest.register_decoration({
            deco_type =   "simple",
            decoration =  "outback:small_sandstone_rocks"..number,
            sidelen =     80,
            place_on =    {"default:dirt_with_grass"},
            fill_ratio =  0.002,
            y_min =       25,
            biomes =      {"top_end"},
            flags =       "place_center_x, place_center_z",
            rotation =    "random",
        })
    end

    register_small_sandstone_rocks(6)
    register_small_sandstone_rocks(5)
    register_small_sandstone_rocks(4)
    register_small_sandstone_rocks(3)
    register_small_sandstone_rocks(2)
    register_small_sandstone_rocks(1)
end

if outback.decorations then
    register_decorations()
end
