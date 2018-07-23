--[[
	Pilbara
--]]


-- pilbara
minetest.register_biome({
	name =             "pilbara",
	node_top =         "outback:red_gravel",
	depth_top =        1,
	node_filler =      "outback:red_sandstone",
	depth_filler =     2,
	node_stone =       "technic:granite",
	node_river_water = "outback:muddy_water_source",
	node_riverbed =    "outback:red_gravel",
	depth_riverbed =   1,
	y_max =            31000,
	y_min =            4,
	heat_point =       90,
	humidity_point =   39,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Iron (Newman / Pannawonica / Tom Price / Paraburdoo)
minetest.register_ore({
	ore_type =        "blob",
	ore =             "outback:granite_with_iron",
	wherein =         {"technic:granite"},
	clust_scarcity =  4096,
	clust_size =      6,
	biomes =          {"pilbara"},
	y_max =           54,
	y_min =           -31,
	noise_threshold = 1,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x = 16, y = 16, z = 16},
		seed =    895,
		octaves = 3,
		persist = 0.6
	},
})

-- Marble (Maroonah)
minetest.register_ore({
	ore_type =        "sheet",
	ore =             "outback:marble",
	wherein =         {"technic:granite"},
	clust_scarcity =  1,
	clust_num_ores =  1,
	clust_size =      3,
	biomes =          {"pilbara"},
	y_max =           24,
	y_min =           -31,
	noise_threshold = 0.4,
	noise_params =    {offset=0, scale=15, spread={x=150, y=150, z=150}, seed=23, octaves=3, persist=0.70}
})

-- Chromium (Coobina)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "technic:granite_mineral_chromium",
	wherein =        {"technic:granite"},
	biomes =         {"pilbara"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          55,
	y_min =          -31,
})

-- Amethyst (Ashburton River)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:granite_with_amethyst",
	wherein =        {"technic:granite"},
	biomes =         {"pilbara"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          50,
	y_min =          -31,
})

-- Emerald (Poona)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:granite_with_emerald",
	wherein =        {"technic:granite"},
	biomes =         {"pilbara"},
	clust_scarcity = 3375,
	clust_num_ores = 3,
	clust_size =     2,
	y_max =          47,
	y_min =          -31,
})


--[[
	Decorations
--]]

local function register_decorations()

    -- Grass
    local function register_dry_grass_decoration(offset, scale, length)
        minetest.register_decoration({
            deco_type =     "simple",
            place_on =      {"outback:red_gravel"},
            sidelen =       16,
            noise_params =  {
                offset =   offset,
                scale =    scale,
                spread =   {x = 200, y = 200, z = 200},
                seed =     329,
                octaves =  3,
                persist =  0.6
            },
            biomes =        {"pilbara"},
            y_max =         300,
            y_min =         4,
            decoration =    "default:dry_grass_"..length,
        })
    end

    register_dry_grass_decoration(0.07, -0.01, 2)
    register_dry_grass_decoration(0.09, -0.03, 1)

    -- Small red rocks
    local function register_small_red_rocks(number)
        minetest.register_decoration({
            deco_type =   "simple",
            decoration =  "outback:small_red_rocks"..number,
            sidelen =     80,
            place_on =    {"outback:red_gravel"},
            fill_ratio =  0.003,
            biomes =      {"pilbara"},
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
