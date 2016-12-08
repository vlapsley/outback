-- mods/australia_modpack/australia/mapgen.lua

minetest.clear_registered_biomes()
minetest.clear_registered_decorations()
minetest.clear_registered_ores()


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Clay
minetest.register_ore({
	ore_type		= "blob",
	ore				= "default:clay",
	wherein			= {"default:sand"},
	clust_scarcity	= 16 * 16 * 16,
	clust_size		= 5,
	y_min			= -15,
	y_max			= 2,
	noise_threshold	= 0.0,
	noise_params	= {
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
	ore_type		= "blob",
	ore				= "default:sand",
	wherein			= {"default:stone", "default:sandstone"},
	clust_scarcity	= 16 * 16 * 16,
	clust_size		= 5,
	y_min			= -31,
	y_max			= 4,
	noise_threshold	= 0.0,
	noise_params	= {
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
	ore_type		= "blob",
	ore				= "default:dirt",
	wherein			= {"default:stone"},
	clust_scarcity	= 16 * 16 * 16,
	clust_size		= 5,
	y_min			= -31,
	y_max			= 31000,
	noise_threshold	= 0.0,
	noise_params	= {
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
	ore_type		= "blob",
	ore				= "default:gravel",
	wherein			= {"default:stone"},
	clust_scarcity	= 16 * 16 * 16,
	clust_size		= 5,
	y_min			= -31000,
	y_max			= 31000,
	noise_threshold	= 0.0,
	noise_params	= {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 5, y = 5, z = 5},
		seed = 766,
		octaves = 1,
		persist = 0.0
	},
})

-- Coal
minetest.register_ore({
	ore_type		= "scatter",
	ore				= "default:stone_with_coal",
	wherein			= "default:stone",
	clust_scarcity	= 8 * 8 * 8,
	clust_num_ores	= 8,
	clust_size		= 3,
	y_min			= -31000,
	y_max			= 64,
})

minetest.register_ore({
	ore_type		= "scatter",
	ore				= "default:stone_with_coal",
	wherein			= "default:stone",
	clust_scarcity	= 24 * 24 * 24,
	clust_num_ores	= 27,
	clust_size		= 6,
	y_min			= -31000,
	y_max			= 0,
})

-- Iron
minetest.register_ore({
	ore_type		= "scatter",
	ore				= "default:stone_with_iron",
	wherein			= "default:stone",
	clust_scarcity	= 12 * 12 * 12,
	clust_num_ores	= 3,
	clust_size		= 2,
	y_min			= -15,
	y_max			= 2,
})

minetest.register_ore({
	ore_type		= "scatter",
	ore				= "default:stone_with_iron",
	wherein			= "default:stone",
	clust_scarcity	= 9 * 9 * 9,
	clust_num_ores	= 5,
	clust_size		= 3,
	y_min			= -192,
	y_max			= -16,
})

minetest.register_ore({
	ore_type		= "scatter",
	ore				= "default:stone_with_iron",
	wherein			= "default:stone",
	clust_scarcity	= 7 * 7 * 7,
	clust_num_ores	= 5,
	clust_size		= 3,
	y_min			= -31000,
	y_max			= -193,
})

minetest.register_ore({
	ore_type		= "scatter",
	ore				= "default:stone_with_iron",
	wherein			= "default:stone",
	clust_scarcity	= 24 * 24 * 24,
	clust_num_ores	= 27,
	clust_size		= 6,
	y_min			= -31000,
	y_max			= -193,
})

--Mese
minetest.register_ore({
	ore_type		= "scatter",
	ore				= "default:stone_with_mese",
	wherein			= "default:stone",
	clust_scarcity	= 18 * 18 * 18,
	clust_num_ores	= 3,
	clust_size		= 2,
	y_min			= -255,
	y_max			= -193,
})

minetest.register_ore({
	ore_type		= "scatter",
	ore				= "default:stone_with_mese",
	wherein			= "default:stone",
	clust_scarcity	= 14 * 14 * 14,
	clust_num_ores	= 5,
	clust_size		= 3,
	y_min			= -31000,
	y_max			= -256,
})

minetest.register_ore({
	ore_type		= "scatter",
	ore				= "default:mese",
	wherein			= "default:stone",
	clust_scarcity	= 36 * 36 * 36,
	clust_num_ores	= 3,
	clust_size		= 2,
	y_min			= -31000,
	y_max			= -1024,
})

-- Gold
minetest.register_ore({
	ore_type		= "scatter",
	ore				= "default:stone_with_gold",
	wherein			= "default:stone",
	clust_scarcity	= 15 * 15 * 15,
	clust_num_ores	= 3,
	clust_size		= 2,
	y_min			= -255,
	y_max			= -193,
})

minetest.register_ore({
	ore_type		= "scatter",
	ore				= "default:stone_with_gold",
	wherein			= "default:stone",
	clust_scarcity	= 13 * 13 * 13,
	clust_num_ores	= 5,
	clust_size		= 3,
	y_min			= -31000,
	y_max			= -256,
})

-- Diamond
minetest.register_ore({
	ore_type		= "scatter",
	ore				= "default:stone_with_diamond",
	wherein			= "default:stone",
	clust_scarcity	= 17 * 17 * 17,
	clust_num_ores	= 4,
	clust_size		= 3,
	y_min			= -512,
	y_max			= -256,
})

minetest.register_ore({
	ore_type		= "scatter",
	ore				= "default:stone_with_diamond",
	wherein			= "default:stone",
	clust_scarcity	= 15 * 15 * 15,
	clust_num_ores	= 4,
	clust_size		= 3,
	y_min			= -31000,
	y_max			= -513,
})

-- Copper
minetest.register_ore({
	ore_type		= "scatter",
	ore				= "default:stone_with_copper",
	wherein			= "default:stone",
	clust_scarcity	= 12 * 12 * 12,
	clust_num_ores	= 4,
	clust_size		= 3,
	y_min			= -192,
	y_max			= -16,
})

minetest.register_ore({
	ore_type		= "scatter",
	ore				= "default:stone_with_copper",
	wherein			= "default:stone",
	clust_scarcity	= 9 * 9 * 9,
	clust_num_ores	= 5,
	clust_size		= 3,
	y_min			= -31000,
	y_max			= -193,
})


--[[
	Biomes
--]]

-- Underground
if aus.biome_underground then
	dofile(aus.path .. "/biome_underground.lua")
end

-- Coast/Ocean
if aus.biome_mangroves then
	dofile(aus.path .. "/biome_mangroves.lua")
end
if aus.biome_tasman_sea then
	dofile(aus.path .. "/biome_tasman_sea.lua")
end
if aus.biome_great_australian_bight then
	dofile(aus.path .. "/biome_great_australian_bight.lua")
end
if aus.biome_indian_ocean then
	dofile(aus.path .. "/biome_indian_ocean.lua")
end
if aus.biome_great_barrier_reef then
	dofile(aus.path .. "/biome_great_barrier_reef.lua")
end
if aus.biome_timor_sea then
	dofile(aus.path .. "/biome_timor_sea.lua")
end

-- Mainland
if aus.biome_tasmania then
	dofile(aus.path .. "/biome_tasmania.lua")
end
if aus.biome_victorian_forests then
	dofile(aus.path .. "/biome_victorian_forests.lua")
end
if aus.biome_jarrah_karri_forests then
	dofile(aus.path .. "/biome_jarrah_karri_forests.lua")
end
if aus.biome_eastern_coasts then
	dofile(aus.path .. "/biome_eastern_coasts.lua")
end
if aus.biome_flinders_lofty then
	dofile(aus.path .. "/biome_flinders_lofty.lua")
end
if aus.biome_murray_darling_basin then
	dofile(aus.path .. "/biome_murray_darling_basin.lua")
end
if aus.biome_goldfields_esperence then
	dofile(aus.path .. "/biome_goldfields_esperence.lua")
end
if aus.biome_mulga_lands then
	dofile(aus.path .. "/biome_mulga_lands.lua")
end
if aus.biome_far_north_queensland then
	dofile(aus.path .. "/biome_far_north_queensland.lua")
end
if aus.biome_central_australia then
	dofile(aus.path .. "/biome_central_australia.lua")
end
if aus.biome_top_end then
	dofile(aus.path .. "/biome_top_end.lua")
end
if aus.biome_pilbara then
	dofile(aus.path .. "/biome_pilbara.lua")
end
if aus.biome_simpson_desert then
	dofile(aus.path .. "/biome_simpson_desert.lua")
end

-- Alpine
if aus.biome_australian_alps then
	dofile(aus.path .. "/biome_australian_alps.lua")
end
