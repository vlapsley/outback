--[[
	Simpson Desert
--]]


-- simpson desert
minetest.register_biome({
	name =             "simpson_desert",
	node_top =         "outback:red_sand",
	depth_top =        3,
	node_filler =      "outback:red_sandstone",
	depth_filler =     2,
	node_stone =       "technic:granite",
	node_river_water = "outback:muddy_water_source",
	node_riverbed =    "outback:red_gravel",
	depth_riverbed =   1,
	y_max =            31000,
	y_min =            4,
	heat_point =       90,
	humidity_point =   10,
})


--[[
	Decorations
--]]

local function register_decorations()

    -- Small red rocks
    local function register_small_red_rocks(number)
        minetest.register_decoration({
            deco_type =   "simple",
            decoration =  "outback:small_red_rocks"..number,
            sidelen =     80,
            place_on =    {"outback:red_sand"},
            fill_ratio =  0.001,
            y_min =       18,
            biomes =      {"simpson_desert"},
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
