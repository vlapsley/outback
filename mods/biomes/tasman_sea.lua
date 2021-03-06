--[[
	Tasman Sea
--]]


-- tasman sea
minetest.register_biome({
	name =             "tasman_sea",
	node_top =         "default:sand",
	depth_top =        2,
	node_filler =      "outback:basalt",
	depth_filler =     3,
	node_stone =       "default:stone",
	node_river_water = "outback:muddy_water_source",
	node_riverbed =    "default:sand",
	depth_riverbed =   1,
    vertical_blend =   1,
	y_max =            3,
	y_min =            -31,
	heat_point =       10,
	humidity_point =   10,
})


--[[
	Decorations
--]]

local function register_decorations()

    -- Marram grass
    minetest.register_decoration({
        name = "default:marram_grass",
        deco_type = "simple",
        place_on = {"default:sand"},
        sidelen = 4,
        noise_params = {
            offset = -0.4,
            scale = 3.0,
            spread = {x = 16, y = 16, z = 16},
            seed = 513337,
            octaves = 1,
            persist = 0.5,
            flags = "absvalue"
        },
        biomes = {"tasman_sea"},
        y_max = 3,
        y_min = 3,
        decoration = {
            "default:marram_grass_1",
            "default:marram_grass_2",
            "default:marram_grass_3",
        },
    })

    -- Kelp
    minetest.register_decoration({
        name = "default:kelp",
        deco_type = "simple",
        place_on = {"default:sand"},
        place_offset_y = -1,
        sidelen = 16,
        noise_params = {
            offset = -0.04,
            scale = 0.1,
            spread = {x = 200, y = 200, z = 200},
            seed = 87112,
            octaves = 3,
            persist = 0.7
        },
        biomes = {"tasman_sea"},
        y_max = -5,
        y_min = -10,
        flags = "force_placement",
        decoration = "default:sand_with_kelp",
        param2 = 48,
        param2_max = 96,
    })

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
        biomes = {"tasman_sea"},
        y_max = 3,
        y_min = 0,
        decoration = "flowers:waterlily",
        param2 = 0,
        param2_max = 3,
        place_offset_y = 1,
    })
end

if outback.decorations then
    register_decorations()
end
