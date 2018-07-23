--[[
	Great Australian Bight
--]]


-- great australian bight
minetest.register_biome({
	name =             "great_australian_bight",
	node_top =         "outback:limestone",
	depth_top =        3,
	node_filler =      "outback:basalt",
	depth_filler =     3,
	node_stone =       "default:stone",
	node_river_water = "outback:muddy_water_source",
	node_riverbed =    "outback:limestone",
	depth_riverbed =   1,
    vertical_blend =   1,
	y_max =            3,
	y_min =            -31,
	heat_point =       55,
	humidity_point =   50,
})


--[[
	Decorations
--]]

local function register_decorations()

    -- Kelp
    minetest.register_decoration({
        name = "default:kelp",
        deco_type = "simple",
        place_on = {"outback:limestone"},
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
        biomes = {"great_australian_bight"},
        y_max = -5,
        y_min = -10,
        flags = "force_placement",
        decoration = "default:sand_with_kelp",
        param2 = 48,
        param2_max = 96,
    })
end

if outback.decorations then
    register_decorations()
end
