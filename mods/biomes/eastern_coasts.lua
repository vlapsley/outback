--[[
	Eastern Coasts
--]]


-- eastern coasts
minetest.register_biome({
	name =             "eastern_coasts",
	node_top =         "default:dirt_with_grass",
	depth_top =        1,
	node_filler =      "default:dirt",
	depth_filler =     3,
	node_stone =       "default:stone",
	node_river_water = "outback:muddy_water_source",
	node_riverbed =    "default:dirt",
	depth_riverbed =   1,
    vertical_blend =   3,
	y_max =            31000,
	y_min =            4,
	heat_point =       7,
	humidity_point =   57,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Basalt
minetest.register_ore({
	ore_type =       "blob",
	ore =            "outback:basalt",
	wherein =        {"default:stone"},
	biomes =         {"eastern_coasts"},
	clust_scarcity = 3375,
	clust_num_ores = 33,
	clust_size =     5,
	y_max =          31000,
	y_min =          -31,
})

minetest.register_ore({
	ore_type =       "blob",
	ore =            "outback:basalt",
	wherein =        {"default:stone"},
	biomes =         {"eastern_coasts"},
	clust_scarcity = 1000,
	clust_num_ores = 58,
	clust_size =     7,
	y_max =          31000,
	y_min =          -31,
})

-- Shale
minetest.register_ore({
	ore_type =       "blob",
	ore =            "outback:shale",
	wherein =        {"default:stone"},
	biomes =         {"eastern_coasts"},
	clust_scarcity = 15625,
	clust_num_ores = 6,
	clust_size =     3,
	y_max =          31000,
	y_min =          -31,
})

-- Coal
minetest.register_ore({
	ore_type =               "sheet",
	ore =                    "default:stone_with_coal",
	wherein =                {"default:stone"},
	column_height_min =      2,
	column_height_max =      4,
	column_midpoint_factor = 0.5,
	biomes =                 {"eastern_coasts"},
	y_max =                  70,
	y_min =                  -31,
	noise_threshold =        1.25,
	noise_params =           {
		offset =  0,
		scale =   2,
		spread =  {x = 19, y = 19, z = 11},
		seed =    962,
		octaves = 2,
		persist = 0.8,
	},
})

-- Amethyst (Oban River)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_amethyst",
	wherein =        {"default:stone"},
	biomes =         {"eastern_coasts"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          120,
	y_min =          -31,
})

-- Citrine (Oban River)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_citrine",
	wherein =        {"default:stone"},
	biomes =         {"eastern_coasts"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          120,
	y_min =          -31,
})

-- Ruby (Barrington Tops)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_ruby",
	wherein =        {"default:stone"},
	biomes =         {"eastern_coasts"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          129,
	y_min =          -31,
})

-- Sapphire (Kings Plains)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_sapphire",
	wherein =        {"default:stone"},
	biomes =         {"eastern_coasts"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          88,
	y_min =          -31,
})

-- Smoky Quartz (Kingsgate)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_smoky_quartz",
	wherein =        {"default:stone"},
	biomes =         {"eastern_coasts"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          115,
	y_min =          -31,
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
            biomes =        {"eastern_coasts"},
            y_max =         200,
            y_min =         4,
            decoration =    "default:grass_"..length,
        })
    end

    register_grass_decoration(-0.03,  0.09,  5)
    register_grass_decoration(-0.015, 0.075, 4)
    register_grass_decoration(0,      0.06,  3)
    register_grass_decoration(0.015,  0.045, 2)
    register_grass_decoration(0.03,   0.03,  1)

    -- Ferns
    local function register_fern_decoration(seed, size)
        minetest.register_decoration({
            name = "default:fern_" .. size,
            deco_type = "simple",
            place_on = {"default:dirt_with_grass"},
            sidelen = 16,
            noise_params = {
                offset = 0,
                scale = 0.2,
                spread = {x = 100, y = 100, z = 100},
                seed = seed,
                octaves = 3,
                persist = 0.7
            },
            biomes = {"eastern_coasts"},
            y_max = 140,
            y_min = 40,
            decoration = "default:fern_" .. size,
        })
    end

    register_fern_decoration(14936, 3)
    register_fern_decoration(801,   2)
    register_fern_decoration(5,     1)

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
        biomes = {"eastern_coasts"},
        y_min = 0,
        y_max = 96,
        decoration = "flowers:waterlily",
        param2 = 0,
        param2_max = 3,
        place_offset_y = 1,
    })

    -- Snow
    minetest.register_decoration({
        deco_type =   "simple",
        place_on =    {"default:dirt_with_grass"},
        sidelen =     80,
        fill_ratio =  0.3,
        biomes =      {"eastern_coasts"},
        y_max =       31000,
        y_min =       140,
        decoration =  "default:snow",
    })

    -- Small stone rocks
    local function register_small_stone_rocks(number)
        minetest.register_decoration({
            deco_type =   "simple",
            decoration =  "outback:small_stone_rocks"..number,
            sidelen =     80,
            place_on =    {"default:dirt_with_grass"},
            fill_ratio =  0.003,
            y_min =       16,
            biomes =      {"eastern_coasts"},
            flags =       "place_center_x, place_center_z",
            rotation =    "random",
        })
    end

    register_small_stone_rocks(6)
    register_small_stone_rocks(5)
    register_small_stone_rocks(4)
    register_small_stone_rocks(3)
    register_small_stone_rocks(2)
    register_small_stone_rocks(1)
end

if outback.decorations then
    register_decorations()
end
