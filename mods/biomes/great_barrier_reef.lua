--[[
	Great Barrier Reef
--]]


-- great barrier reef
minetest.register_biome({
	name =             "great_barrier_reef",
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
	heat_point =       88,
	humidity_point =   73,
})


--[[
	Decorations
--]]

local function register_decorations()

    -- Coral reef
    minetest.register_decoration({
        name = "default:corals",
        deco_type = "schematic",
        place_on = {"default:sand"},
        noise_params = {
            offset = -0.15,
            scale = 0.1,
            spread = {x = 100, y = 100, z = 100},
            seed = 7013,
            octaves = 3,
            persist = 1,
        },
        biomes = {"great_barrier_reef"},
        y_max = -2,
        y_min = -8,
        schematic = minetest.get_modpath("default") .. "/schematics/corals.mts",
        flags = "place_center_x, place_center_z",
        rotation = "random",
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
        biomes = {"great_barrier_reef"},
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
