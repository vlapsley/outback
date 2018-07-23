--[[
	Mangroves
--]]


-- mangroves
minetest.register_biome({
	name =             "mangroves",
	node_top =         "outback:mangrove_mud",
	depth_top =        3,
	node_filler =      "default:clay",
	depth_filler =     1,
	node_stone =       "default:stone",
	node_river_water = "outback:muddy_water_source",
	node_riverbed =    "default:dirt",
	depth_riverbed =   1,
    vertical_blend =   1,
	y_max =            3,
	y_min =            -2,
	heat_point =       80,
	humidity_point =   80,
})


--[[
	Decorations
--]]

local function register_decorations()

    -- Mangrove Fern
    minetest.register_decoration({
        name = "outback:mangrove_fern",
        deco_type = "simple",
        place_on = {"outback:mangrove_mud"},
        sidelen = 16,
        fill_ratio = 0.2,
        biomes = {"mangroves"},
        y_max = 3,
        y_min = 2,
        decoration = "outback:mangrove_fern",
    })

    -- Mangrove Lily
    minetest.register_decoration({
        name = "outback:mangrove_lily",
        deco_type = "simple",
        place_on = {"outback:mangrove_mud"},
        sidelen = 16,
        fill_ratio = 0.1,
        biomes = {"mangroves"},
        y_max = 3,
        y_min = 2,
        decoration = "flowers:mangrove_lily",
    })

    -- Nipa Palm
    minetest.register_decoration({
        name = "outback:mangrove_palm",
        deco_type = "schematic",
        place_on = {"outback:mangrove_mud"},
        sidelen = 16,
        fill_ratio = 0.3,
        biomes = {"mangroves"},
        y_max = 3,
        y_min = 1,
        schematic = {
            size = {x = 1, y = 4, z = 1},
            data = {
                {name = "ignore", param1 = 0, param2 = 0},
                {name = "outback:mangrove_palm_trunk", param1 = 255, param2 = 0},
                {name = "outback:mangrove_palm_leaf_bot", param1 = 255, param2 = 0},
                {name = "outback:mangrove_palm_leaf_top", param1 = 255, param2 = 0},
            },
        },
        flags = "force_placement",
    })

    -- Waterlily
    minetest.register_decoration({
        name = "default:waterlily",
        deco_type = "simple",
        place_on = {"outback:mangrove_mud"},
        sidelen = 16,
        noise_params = {
            offset = -0.12,
            scale = 0.3,
            spread = {x = 200, y = 200, z = 200},
            seed = 33,
            octaves = 3,
            persist = 0.7
        },
        biomes = {"mangroves"},
        y_max = 0,
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



--[[
	Trees
--]]

local function register_trees()

    -- Grey Mangrove
    outback.schematics.grey_mangrove = {}
    local max_ht =  6
    local tree =    "outback:grey_mangrove_tree"
    local leaves =  "outback:grey_mangrove_leaves"
    for h = 4, max_ht do
        local schem = outback.generate_mangrove_tree_schematic(3, tree, leaves)
        outback.push(outback.schematics.grey_mangrove, schem)
        minetest.register_decoration({
            deco_type =   "schematic",
            sidelen =     80,
            place_on =    {"outback:mangrove_mud"},
            fill_ratio =  0.005,
            biomes =      {"mangroves"},
            y_max =       3,
            y_min =       -1,
            schematic =   schem,
            flags =       "place_center_x, place_center_z",
            rotation =    "random",
        })
    end
end

if outback.trees then
    register_trees()
end
