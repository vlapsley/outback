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

-- Flora
minetest.register_alias("mapgen_tree", "base:tree")
minetest.register_alias("mapgen_leaves", "base:leaves")
minetest.register_alias("mapgen_apple", "base:apple")
minetest.register_alias("mapgen_jungletree", "base:jungletree")
minetest.register_alias("mapgen_jungleleaves", "base:jungleleaves")
minetest.register_alias("mapgen_junglegrass", "base:junglegrass")
minetest.register_alias("mapgen_pine_tree", "base:pine_tree")
minetest.register_alias("mapgen_pine_needles", "base:pine_needles")

-- Dungeons
minetest.register_alias("mapgen_cobble", "base:cobble")
minetest.register_alias("mapgen_stair_cobble", "stairs:stair_cobble")
minetest.register_alias("mapgen_mossycobble", "base:mossycobble")
minetest.register_alias("mapgen_stair_desert_stone", "stairs:stair_desert_stone")
minetest.register_alias("mapgen_sandstonebrick", "base:sandstonebrick")
minetest.register_alias("mapgen_stair_sandstone_block", "stairs:stair_sandstone_block")


-- Mapgen settings
minetest.set_mapgen_setting("mg_flags", "caves,nodungeons,decorations,light", true)


minetest.clear_registered_decorations()
minetest.clear_registered_ores()


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Clay
minetest.register_ore({
	ore_type         = "blob",
	ore              = "base:clay",
	wherein          = {"base:dirt"},
	clust_scarcity   = 16 * 16 * 16,
	clust_size       = 5,
	y_min            = -15,
	y_max            = 64,
	noise_threshold  = 0.0,
	noise_params     = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = -316,
		octaves = 1,
		persist = 0.0
	},
})

-- Sand
minetest.register_ore({
	ore_type         = "blob",
	ore              = "base:sand",
	wherein          = {"base:stone", "base:sandstone"},
	clust_scarcity   = 16 * 16 * 16,
	clust_size       = 5,
	y_min            = -31,
	y_max            = 12,
	noise_threshold  = 0.0,
	noise_params     = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = 2316,
		octaves = 1,
		persist = 0.0
	},
})

-- Dirt
minetest.register_ore({
	ore_type         = "blob",
	ore              = "base:dirt",
	wherein          = {"base:stone"},
	clust_scarcity   = 16 * 16 * 16,
	clust_size       = 5,
	y_min            = -31,
	y_max            = 31000,
	noise_threshold  = 0.0,
	noise_params     = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = 17676,
		octaves = 1,
		persist = 0.0
	},
})

-- Gravel
minetest.register_ore({
	ore_type         = "blob",
	ore              = "base:gravel",
	wherein          = {"base:stone"},
	clust_scarcity   = 16 * 16 * 16,
	clust_size       = 5,
	y_min            = -31000,
	y_max            = 31000,
	noise_threshold  = 0.0,
	noise_params     = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = 766,
		octaves = 1,
		persist = 0.0
	},
})

-- Diorite
minetest.register_ore({
	ore_type       = "blob",
	ore            = "base:diorite",
	wherein        = {"base:stone"},
	clust_scarcity = 15*15*15,
	clust_num_ores = 33,
	clust_size     = 5,
	y_min          = -31000,
	y_max          = 31000,
})

minetest.register_ore({
	ore_type       = "blob",
	ore            = "base:diorite",
	wherein        = {"base:stone"},
	clust_scarcity = 10*10*10,
	clust_num_ores = 58,
	clust_size     = 7,
	y_min          = -31000,
	y_max          = 31000,
})

-- Granite
minetest.register_ore({
	ore_type       = "blob",
	ore            = "base:granite",
	wherein        = {"base:stone"},
	clust_scarcity = 15*15*15,
	clust_num_ores = 33,
	clust_size     = 5,
	y_min          = -31000,
	y_max          = 31000,
})

minetest.register_ore({
	ore_type       = "blob",
	ore            = "base:granite",
	wherein        = {"base:stone"},
	clust_scarcity = 10*10*10,
	clust_num_ores = 58,
	clust_size     = 7,
	y_min          = -31000,
	y_max          = 31000,
})

-- Sulfur
local sulfur_buf = {}
local sulfur_noise= nil

minetest.register_on_generated(function(minp, maxp, seed)
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local a = VoxelArea:new{
		MinEdge = {x = emin.x, y = emin.y, z = emin.z},
		MaxEdge = {x = emax.x, y = emax.y, z = emax.z},
	}
	local data = vm:get_data(sulfur_buf)
	local pr = PseudoRandom(17 * minp.x + 42 * minp.y + 101 * minp.z)
	sulfur_noise = sulfur_noise or minetest.get_perlin(9876, 3, 0.5, 100)

	local c_lava = minetest.get_content_id("base:lava_source")
	local c_lava_flowing = minetest.get_content_id("base:lava_flowing")
	local c_stone = minetest.get_content_id("base:stone")
	local c_sulfur = minetest.get_content_id("technic:stone_with_sulfur")

	local grid_size = 5
	for x = minp.x + math.floor(grid_size / 2), maxp.x, grid_size do
	for y = minp.y + math.floor(grid_size / 2), maxp.y, grid_size do
	for z = minp.z + math.floor(grid_size / 2), maxp.z, grid_size do
		local c = data[a:index(x, y, z)]
		if (c == c_lava or c == c_lava_flowing) and sulfur_noise:get3d({x = x, y = z, z = z}) >= 0.4 then
			for xx = math.max(minp.x, x - grid_size), math.min(maxp.x, x + grid_size) do
			for yy = math.max(minp.y, y - grid_size), math.min(maxp.y, y + grid_size) do
			for zz = math.max(minp.z, z - grid_size), math.min(maxp.z, z + grid_size) do
				local i = a:index(xx, yy, zz)
				if data[i] == c_stone and pr:next(1, 10) <= 7 then
					data[i] = c_sulfur
				end
			end
			end
			end
		end
	end
	end
	end

	vm:set_data(data)
	vm:write_to_map(data)
end)



--[[
	Trees
--]]

--Palm trees on beaches in warmer biomes
biome_lib:register_generate_plant({
	surface = {"base:sand"},
	max_count = 4,
	rarity = 33,
	seed_diff = 330,
	min_elevation = -1,
    max_elevation = 3,
	near_nodes = {"base:water_source"},
	near_nodes_size = 15,
	near_nodes_count = 10,
	temp_min = -0.2,
	},
	base.palm_model
)

