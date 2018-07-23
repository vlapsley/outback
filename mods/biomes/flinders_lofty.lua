--[[
	Flinders / Lofty
--]]


-- flinders / lofty
minetest.register_biome({
	name =             "flinders_lofty",
	node_top =         "default:dirt_with_dry_grass",
	depth_top =        1,
	node_filler =      "outback:red_dirt",
	depth_filler =     2,
	node_stone =       "default:stone",
	node_river_water = "outback:muddy_water_source",
	node_riverbed =    "default:dirt",
	depth_riverbed =   1,
    vertical_blend =   3,
	y_max =            31000,
	y_min =            4,
	heat_point =       40,
	humidity_point =   20,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Slate (Adelaide Hills / Mintaro / Spalding)
minetest.register_ore({
	ore_type =       "blob",
	ore =            "outback:slate",
	wherein =        {"default:stone"},
	biomes =         {"flinders_lofty"},
	clust_scarcity = 8000,
	clust_num_ores = 10,
	clust_size =     4,
	y_max =          73,
	y_min =          -31,
})

-- Copper (Olympic Dam)
minetest.register_ore({
	ore_type =        "vein",
	ore =             "default:stone_with_copper",
	wherein =         "default:stone",
	biomes =          {"flinders_lofty"},
	y_max =           34,
	y_min =           -31,
	noise_threshold = 1.6,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x=211, y=211, z=211},
		seed =    4825,
		octaves = 3,
		persist = 0.6,
		flags =   "eased",
	},
})

-- Jade (Cowell)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_jade",
	wherein =        {"default:stone"},
	biomes =         {"flinders_lofty"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          2,
	y_min =          -31,
})

-- Marble (Penrice)
minetest.register_ore({
	ore_type =        "sheet",
	ore =             "outback:marble",
	wherein =         "default:stone",
	clust_scarcity =  1,
	clust_num_ores =  1,
	clust_size =      3,
	biomes =          {"flinders_lofty"},
	y_max =           34,
	y_min =           -31,
	noise_threshold = 0.4,
	noise_params =    {offset=0, scale=15, spread={x=150, y=150, z=150}, seed=23, octaves=3, persist=0.70}
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
            biomes =        {"flinders_lofty"},
            y_max =         240,
            y_min =         58,
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
            biomes =        {"flinders_lofty"},
            y_max =         73,
            y_min =         4,
            decoration =    "default:dry_grass_"..length,
        })
    end

    register_grass_decoration(0.015, 0.045, 2)
    register_grass_decoration(0.03, 0.03, 1)

    register_dry_grass_decoration(0.01, 0.05, 5)
    register_dry_grass_decoration(0.03, 0.03, 4)
    register_dry_grass_decoration(0.05, 0.01, 3)
    register_dry_grass_decoration(0.07, -0.01, 2)
    register_dry_grass_decoration(0.09, -0.03, 1)

    -- Small stone rocks
    local function register_small_stone_rocks(number)
        minetest.register_decoration({
            deco_type =   "simple",
            decoration =  "outback:small_stone_rocks"..number,
            sidelen =     80,
            place_on =    {"default:dirt_with_dry_grass"},
            fill_ratio =  0.002,
            y_min =       24,
            biomes =      {"flinders_lofty"},
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
