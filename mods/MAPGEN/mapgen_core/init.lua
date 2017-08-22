--[[
	Mapgen Core
--]]


--
-- Aliases for map generator outputs
--

minetest.register_alias("mapgen_stone", "core:stone")
minetest.register_alias("mapgen_dirt", "core:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "core:dirt_with_grass")
minetest.register_alias("mapgen_sand", "core:sand")
minetest.register_alias("mapgen_water_source", "core:water_source")
minetest.register_alias("mapgen_river_water_source", "core:river_water_source")
minetest.register_alias("mapgen_lava_source", "core:lava_source")
minetest.register_alias("mapgen_gravel", "core:gravel")
minetest.register_alias("mapgen_desert_stone", "core:desert_stone")
minetest.register_alias("mapgen_desert_sand", "core:desert_sand")
minetest.register_alias("mapgen_dirt_with_snow", "core:dirt_with_snow")
minetest.register_alias("mapgen_snowblock", "core:snowblock")
minetest.register_alias("mapgen_snow", "core:snow")
minetest.register_alias("mapgen_ice", "core:ice")
minetest.register_alias("mapgen_sandstone", "core:sandstone")

minetest.register_alias("mapgen_tree", "core:tree")
minetest.register_alias("mapgen_leaves", "core:leaves")
minetest.register_alias("mapgen_apple", "core:apple")
minetest.register_alias("mapgen_jungletree", "core:jungletree")
minetest.register_alias("mapgen_jungleleaves", "core:jungleleaves")
minetest.register_alias("mapgen_junglegrass", "core:junglegrass")
minetest.register_alias("mapgen_pine_tree", "core:pine_tree")
minetest.register_alias("mapgen_pine_needles", "core:pine_needles")

minetest.register_alias("mapgen_cobble", "core:cobble")
minetest.register_alias("mapgen_stair_cobble", "stairs:stair_cobble")
minetest.register_alias("mapgen_mossycobble", "core:mossycobble")
minetest.register_alias("mapgen_sandstonebrick", "core:sandstonebrick")
minetest.register_alias("mapgen_stair_sandstonebrick", "stairs:stair_sandstonebrick")

-- Mapgen settings
minetest.set_mapgen_setting("mg_flags", "caves,nodungeons,decorations,light", true)

