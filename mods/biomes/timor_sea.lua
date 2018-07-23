--[[
	Timor Sea
--]]


-- timor sea
minetest.register_biome({
	name =             "timor_sea",
	node_top =         "default:sand",
	depth_top =        2,
	node_filler =      "default:sandstone",
	depth_filler =     2,
	node_stone =       "default:stone",
	node_river_water = "outback:muddy_water_source",
	node_water =       "default:water_source",
	node_riverbed =    "default:sand",
	depth_riverbed =   1,
    vertical_blend =   1,
	y_max =            3,
	y_min =            -31,
	heat_point =       70,
	humidity_point =   90,
})


--[[
	Decorations
--]]

local function register_decorations()

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
        biomes = {"timor_sea"},
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
