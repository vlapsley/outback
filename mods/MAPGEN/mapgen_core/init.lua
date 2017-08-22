--[[
	Mapgen base
--]]


--
-- Aliases for map generator outputs
--

minetest.register_alias("mapgen_stone", "base:stone")
minetest.register_alias("mapgen_dirt", "base:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "base:dirt_with_grass")
minetest.register_alias("mapgen_sand", "base:sand")
minetest.register_alias("mapgen_water_source", "base:water_source")
minetest.register_alias("mapgen_river_water_source", "base:river_water_source")
minetest.register_alias("mapgen_lava_source", "base:lava_source")
minetest.register_alias("mapgen_gravel", "base:gravel")
minetest.register_alias("mapgen_desert_stone", "base:desert_stone")
minetest.register_alias("mapgen_desert_sand", "base:desert_sand")
minetest.register_alias("mapgen_dirt_with_snow", "base:dirt_with_snow")
minetest.register_alias("mapgen_snowblock", "base:snowblock")
minetest.register_alias("mapgen_snow", "base:snow")
minetest.register_alias("mapgen_ice", "base:ice")
minetest.register_alias("mapgen_sandstone", "base:sandstone")

minetest.register_alias("mapgen_tree", "base:tree")
minetest.register_alias("mapgen_leaves", "base:leaves")
minetest.register_alias("mapgen_apple", "base:apple")
minetest.register_alias("mapgen_jungletree", "base:jungletree")
minetest.register_alias("mapgen_jungleleaves", "base:jungleleaves")
minetest.register_alias("mapgen_junglegrass", "base:junglegrass")
minetest.register_alias("mapgen_pine_tree", "base:pine_tree")
minetest.register_alias("mapgen_pine_needles", "base:pine_needles")

minetest.register_alias("mapgen_cobble", "base:cobble")
minetest.register_alias("mapgen_stair_cobble", "stairs:stair_cobble")
minetest.register_alias("mapgen_mossycobble", "base:mossycobble")
minetest.register_alias("mapgen_sandstonebrick", "base:sandstonebrick")
minetest.register_alias("mapgen_stair_sandstonebrick", "stairs:stair_sandstonebrick")

-- Mapgen settings
minetest.set_mapgen_setting("mg_flags", "caves,nodungeons,decorations,light", true)

