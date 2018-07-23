--[[
	Mulga Lands
--]]


-- mulga lands
minetest.register_biome({
	name =             "mulga_lands",
	node_top =         "default:dirt_with_dry_grass",
	depth_top =        1,
	node_filler =      "outback:red_dirt",
	depth_filler =     2,
	node_stone =       "default:stone",
	node_river_water = "outback:muddy_water_source",
	node_riverbed =    "default:dirt",
	depth_riverbed =   1,
	y_max =            31000,
	y_min =            4,
	heat_point =       62,
	humidity_point =   75,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Copper (Mount Isa)
minetest.register_ore({
	ore_type =        "blob",
	ore =             "default:stone_with_copper",
	wherein =         {"default:stone"},
	clust_scarcity =  85184,
	clust_size =      8,
	biomes =          {"mulga_lands"},
	y_max =           36,
	y_min =           -31,
	noise_threshold = 1.3,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x = 16, y = 16, z = 16},
		seed =    555,
		octaves = 3,
		persist = 0.6
	},
})

-- Lead (Mount Isa)
minetest.register_ore({
	ore_type =        "blob",
	ore =             "technic:mineral_lead",
	wherein =         {"default:stone"},
	clust_scarcity =  85184,
	clust_size =      8,
	biomes =          {"mulga_lands"},
	y_max =           36,
	y_min =           -31,
	noise_threshold = 1,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x = 16, y = 16, z = 16},
		seed =    556,
		octaves = 3,
		persist = 0.6
	},
})

-- Silver (Mount Isa)
minetest.register_ore({
	ore_type =        "blob",
	ore =             "outback:stone_with_silver",
	wherein =         {"default:stone"},
	clust_scarcity =  85184,
	clust_size =      8,
	biomes =          {"mulga_lands"},
	y_max =           36,
	y_min =           -31,
	noise_threshold = 1,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x = 16, y = 16, z = 16},
		seed =    557,
		octaves = 3,
		persist = 0.6
	},
})

-- Zinc (Mount Isa)
minetest.register_ore({
	ore_type =        "blob",
	ore =             "technic:mineral_zinc",
	wherein =         {"default:stone"},
	clust_scarcity =  85184,
	clust_size =      8,
	biomes =          {"mulga_lands"},
	y_max =           36,
	y_min =           -31,
	noise_threshold = 1,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x = 16, y = 16, z = 16},
		seed =    558,
		octaves = 3,
		persist = 0.6
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
            biomes =        {"mulga_lands"},
            y_max =         240,
            y_min =         4,
            decoration =    "default:dry_grass_"..length,
        })
    end

    register_dry_grass_decoration(0.01, 0.2,  5)
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
            biomes =      {"mulga_lands"},
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
