--[[
	Far North Queensland
--]]


-- far north queensland
minetest.register_biome({
	name =             "far_north_queensland",
	node_top =         "default:dirt_with_grass",
	depth_top =        1,
	node_filler =      "default:dirt",
	depth_filler =     3,
	node_stone =       "default:stone",
	node_river_water = "outback:muddy_water_source",
	node_riverbed =    "default:sand",
	depth_riverbed =   1,
	y_min =            4,
	y_max =            31000,
	heat_point =       88,
	humidity_point =   73,
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
	biomes =         {"far_north_queensland"},
	clust_scarcity = 3375,
	clust_num_ores = 33,
	clust_size =     5,
	y_min =          -31,
	y_max =          31000,
})

minetest.register_ore({
	ore_type =       "blob",
	ore =            "outback:basalt",
	wherein =        {"default:stone"},
	biomes =         {"far_north_queensland"},
	clust_scarcity = 1000,
	clust_num_ores = 58,
	clust_size =     7,
	y_min =          -31,
	y_max =          31000,
})

-- Aluminium (Weipa / Cape York)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_aluminium",
	wherein =        {"default:stone"},
	biomes =         {"far_north_queensland"},
	clust_scarcity = 512,
	clust_num_ores = 5,
	clust_size =     3,
	y_min =          -31,
	y_max =          5,
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
            biomes =        {"far_north_queensland"},
            y_min =         4,
            y_max =         90,
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
            biomes =        {"far_north_queensland"},
            y_min =         91,
            y_max =         300,
            decoration =    "default:dry_grass_"..length,
        })
    end

    register_grass_decoration(-0.03,  0.09,  5)
    register_grass_decoration(-0.015, 0.075, 4)
    register_grass_decoration(0,      0.06,  3)
    register_grass_decoration(0.03,   0.09,  2)
    register_grass_decoration(0.06,   0.06,  1)

    register_dry_grass_decoration(0.01, 0.05, 5)
    register_dry_grass_decoration(0.03, 0.03, 4)
    register_dry_grass_decoration(0,    0.06, 3)
    register_dry_grass_decoration(0.03, 0.09, 2)
    register_dry_grass_decoration(0.06, 0.06, 1)

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
        biomes = {"far_north_queensland"},
        y_max = 0,
        y_min = 96,
        decoration = "flowers:waterlily",
        param2 = 0,
        param2_max = 3,
        place_offset_y = 1,
    })

    -- Small stone rocks
    local function register_small_stone_rocks(number)
        minetest.register_decoration({
            deco_type =   "simple",
            decoration =  "outback:small_stone_rocks"..number,
            sidelen =     80,
            place_on =    {"default:dirt_with_grass"},
            fill_ratio =  0.001,
            y_min =       42,
            biomes =      {"far_north_queensland"},
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
