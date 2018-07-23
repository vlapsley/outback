--[[
	Nullabor
--]]


-- nullabor
minetest.register_biome({
	name =             "nullabor",
	node_top =         "default:desert_sand",
	depth_top =        1,
	node_filler =      "default:sandstone",
	depth_filler =     3,
	node_stone =       "default:stone",
	node_river_water = "outback:muddy_river_source",
	node_riverbed =    "default:sandstone",
	depth_riverbed =   1,
	y_max =            31000,
	y_min =            4,
	heat_point =       65,
	humidity_point =   13,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Gold (Kalgoorlie / Boulder)
minetest.register_ore({
	ore_type =        "vein",
	ore =             "default:stone_with_gold",
	wherein =         {"default:stone"},
	biomes =          {"nullabor"},
	y_max =           38,
	y_min =           -31,
	random_factor =   0.23,
	noise_threshold = 0.97,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x = 73, y = 251, z = 73},
		seed =    891,
		octaves = 4,
		persist = 0.5,
	    flags =   "eased",
	},
})

-- Nickel (Mount Margaret / Ravensthorpe)
minetest.register_ore({
	ore_type =       "scatter",
	ore =            "outback:stone_with_nickel",
	wherein =        {"default:stone"},
	biomes =         {"nullabor"},
	clust_scarcity = 512,
	clust_num_ores = 5,
	clust_size =     3,
	y_max =          44,
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
            place_on =      {"default:desert_sand"},
            sidelen =       16,
            noise_params =  {
                offset =   offset,
                scale =    scale,
                spread =   {x = 200, y = 200, z = 200},
                seed =     329,
                octaves =  3,
                persist =  0.6
            },
            biomes =        {"nullabor"},
            y_max =         240,
            y_min =         4,
            decoration =    "default:dry_grass_"..length,
        })
    end

    register_dry_grass_decoration(0.01, 0.05,  5)
    register_dry_grass_decoration(0.03, 0.03,  4)
    register_dry_grass_decoration(0.05, 0.01,  3)
    register_dry_grass_decoration(0.07, -0.01, 2)
    register_dry_grass_decoration(0.09, -0.03, 1)

    -- Small sandstone rocks
    local function register_small_sandstone_rocks(number)
        minetest.register_decoration({
            deco_type =   "simple",
            decoration =  "outback:small_sandstone_rocks"..number,
            sidelen =     80,
            place_on =    {"default:desert_sand"},
            fill_ratio =  0.002,
            biomes =      {"nullabor"},
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
