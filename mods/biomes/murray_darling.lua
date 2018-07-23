--[[
	Murray-Darling
--]]


-- murray-darling
minetest.register_biome({
	name =             "murray_darling",
	node_top =         "default:dirt_with_dry_grass",
	depth_top =        1,
	node_filler =      "outback:red_dirt",
	depth_filler =     3,
	node_stone =       "default:stone",
	node_river_water = "outback:muddy_water_source",
	node_riverbed =    "default:dirt",
	depth_riverbed =   1,
    vertical_blend =   3,
	y_max =            31000,
	y_min =            4,
	heat_point =       64,
	humidity_point =   48,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Zinc (Broken Hill)
minetest.register_ore({
	ore_type =        "blob",
	ore =             "technic:mineral_zinc",
	wherein =         {"default:stone"},
	clust_scarcity =  85184,
	clust_size =      5,
	biomes =          {"murray_darling"},
	y_max =           33,
	y_min =           -31,
	noise_threshold = 1.5,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x = 16, y = 16, z = 16},
		seed =    557,
		octaves = 3,
		persist = 0.6
	},
})

-- Amethyst (Broken Hill)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_amethyst",
	wherein =        {"default:stone"},
	biomes =         {"murray_darling"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          33,
	y_min =          -31,
})

--Copper (Cadia)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "default:stone_with_copper",
	wherein =        {"default:stone"},
	biomes =         {"murray_darling"},
	clust_scarcity = 1728,
	clust_num_ores = 4,
	clust_size =     3,
	y_max =          69,
	y_min =          -31,
})

-- Gold (Cadia)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "default:stone_with_gold",
	wherein =        {"default:stone"},
	biomes =         {"murray_darling"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          69,
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
            place_on =      {"default:dirt_with_dry_grass"},
            sidelen =       16,
            noise_params =  {
                offset =   offset,
                scale =    scale,
                spread =   {x = 200, y = 200, z = 200},
                seed =     329,
                octaves =  3,
                persist =  0.6
            },
            biomes =        {"murray_darling"},
            y_max =         240,
            y_min =         100,
            decoration =    "default:grass_"..length,
        })
    end

    local function register_dry_grass_decoration(offset, scale, length)
        minetest.register_decoration({
            deco_type =     "simple",
            place_on =      {"default:dirt_with_dry_grass"},
            sidelen =       16,
            noise_params =  {
                offset =   offset,
                scale =    scale,
                spread =   {x = 200, y = 200, z = 200},
                seed =     329,
                octaves =  3,
                persist =  0.6
            },
            biomes =        {"murray_darling"},
            y_max =         120,
            y_min =         4,
            decoration =    "default:dry_grass_"..length,
        })
    end

    register_grass_decoration(0.015,  0.045, 2)
    register_grass_decoration(0.03,   0.03,  1)

    register_dry_grass_decoration(0.01, 0.1,  5)
    register_dry_grass_decoration(0.03, 0.06,  4)
    register_dry_grass_decoration(0.05, 0.02,  3)
    register_dry_grass_decoration(0.07, -0.01, 2)
    register_dry_grass_decoration(0.09, -0.03, 1)

    -- Small stone rocks
    local function register_small_stone_rocks(number)
        minetest.register_decoration({
            deco_type =   "simple",
            decoration =  "outback:small_stone_rocks"..number,
            sidelen =     80,
            place_on =    {"default:dirt_with_dry_grass"},
            fill_ratio =  0.001,
            y_min =       24,
            biomes =      {"murray_darling"},
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
