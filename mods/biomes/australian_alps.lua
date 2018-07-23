--[[
	Australian Alps
--]]


-- australian alps
minetest.register_biome({
	name =             "australian_alps",
	node_top =         "default:snowblock",
	depth_top =        2,
	node_filler =      "default:dirt_with_snow",
	depth_filler =     1,
	node_stone =       "default:stone",
	node_river_water = "default:river_water_source",
	node_riverbed =    "outback:shale",
	depth_riverbed =   1,
	y_max =            31000,
	y_min =            150,
	heat_point =       10,
	humidity_point =   30,
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
	clust_scarcity = 3375,
	clust_num_ores = 33,
	clust_size =     5,
	biomes =         {"australian_alps"},
	y_max =          31000,
	y_min =          -31,
})

minetest.register_ore({
	ore_type =       "blob",
	ore =            "outback:basalt",
	wherein =        {"default:stone"},
	clust_scarcity = 1000,
	clust_num_ores = 58,
	clust_size =     7,
	biomes =         {"australian_alps"},
	y_max =          31000,
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
            place_on =      {"default:snowblock"},
            sidelen =       16,
            noise_params =  {
                offset =   offset,
                scale =    scale,
                spread =   {x = 200, y = 200, z = 200},
                seed =     329,
                octaves =  3,
                persist =  0.6
            },
            biomes =        {"australian_alps"},
            y_max =         210,
            y_min =         150,
            decoration =    "default:grass_"..length,
        })
    end

    register_grass_decoration(0.015,  0.045, 2)
    register_grass_decoration(0.03,   0.03,  1)

    -- Snow
    minetest.register_decoration({
        deco_type =   "simple",
        place_on =    {"default:snowblock"},
        sidelen =     80,
        fill_ratio =  0.3,
        biomes =      {"australian_alps"},
        y_max =       31000,
        y_min =       150,
        decoration =  "default:snow",
    })
end

if outback.decorations then
    register_decorations()
end
