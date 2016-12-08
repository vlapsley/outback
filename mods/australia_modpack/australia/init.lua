-- mods/australia_modpack/australia/init.lua

--[[
	MOD: Australia
	See README.md for licensing and other information.
	Designed for Minetest 0.4.14.
--]]

-- Check for necessary mod functions and abort if they aren't available.
if not minetest.get_biome_id then
	minetest.log()
	minetest.log("* Not loading MOD: Australia *")
	minetest.log("MOD: Australia requires mod functions which are")
	minetest.log("not exposed by your Minetest build.")
	minetest.log()
	return
end

-- Set mapgen parameters.
minetest.register_on_mapgen_init(function(mgparams)
	minetest.set_mapgen_params({
		mgname = "valleys",
		water_level = 0,
		flags = "caves,light,decorations,nodungeons",
		})
end)

-- Definitions made by this mod that other mods can use too.
aus = {}
aus.path = minetest.get_modpath("australia")
aus.schematics = {}


--[[
	Mapgen noise parameters
	If you change a value here also check and, if necessary,
	change the corresponding value in voxel.lua
--]]

-- Noise parameters for biome API temperature, humidity and biome blend.
aus.mg_biome_np_heat = {offset = 50, scale = 50, seed = 5349,
	spread = {x = 1024, y = 1024, z = 1024}, octaves = 3, persist = 0.5, lacunarity = 2,}

aus.mg_biome_np_heat_blend = {offset = 0, scale = 1.5, seed = 13,
	spread = {x = 8, y = 8, z = 8}, octaves = 2, persist = 1, lacunarity = 2,}

aus.mg_biome_np_humidity = {offset = 50, scale = 50, seed = 842,
	spread = {x = 1024, y = 1024, z = 1024}, octaves = 3, persist = 0.5, lacunarity = 2,}

aus.mg_biome_np_humidity_blend = {offset = 0, scale = 1.5, seed = 90003,
	spread = {x = 8, y = 8, z = 8}, octaves = 2, persist = 1, lacunarity = 2,}

-- Caves and tunnels form at the intersection of the two noises
aus.mgvalleys_np_cave1 = {offset = 0, scale = 12, seed = 52534,
	spread = {x = 61, y = 61, z = 61}, octaves = 3, persist = 0.5, lacunarity = 2,}

-- Caves and tunnels form at the intersection of the two noises
aus.mgvalleys_np_cave2 = {offset = 0, scale = 12, seed = 10325,
	spread = {x = 67, y = 67, z = 67}, octaves = 3, persist = 0.5, lacunarity = 2,}

-- The depth of dirt or other filler
aus.mgvalleys_np_filler_depth = {offset = 0, scale = 1.2, seed = 1605,
	spread = {x = 256, y = 256, z = 256}, octaves = 3, persist = 0.5, lacunarity = 2,}

-- Massive caves form here.
aus.mgvalleys_np_massive_caves = {offset = 0, scale = 1, seed = 59033,
	spread = {x = 768, y = 256, z = 768}, octaves = 6, persist = 0.63, lacunarity = 2,}

-- River noise -- rivers occur close to zero
aus.mgvalleys_np_rivers = {offset = 0, scale = 1, seed = -6050,
	spread = {x = 512, y = 512, z = 512}, octaves = 5, persist = 0.6, lacunarity = 2,}

-- Base terrain height
aus.mgvalleys_np_terrain_height = {offset = -10, scale = 100, seed = 5202,
	spread = {x = 1024, y = 1024, z = 1024}, octaves = 3, persist = 0.7, lacunarity = 2,}

-- Raises terrain to make valleys around the rivers
aus.mgvalleys_np_valley_depth = {offset = 3, scale = 2, seed = -1914,
	spread = {x = 512, y = 512, z = 512}, octaves = 1, persist = 1, lacunarity = 2,}

-- Slope and fill work together to modify the heights
aus.mgvalleys_np_inter_valley_fill = {offset = 0, scale = 1, seed = 1993,
	spread = {x = 512, y = 256, z = 512}, octaves = 6, persist = 0.8, lacunarity = 2,}

-- Amplifies the valleys
aus.mgvalleys_np_valley_profile = {offset = 0.6, scale = 0.5, seed = 777,
	spread = {x = 512, y = 512, z = 512}, octaves = 1, persist = 1, lacunarity = 2,}

-- Slope and fill work together to modify the heights
aus.mgvalleys_np_inter_valley_slope = {offset = 0, scale = 1, seed = 746,
	spread = {x = 256, y = 256, z = 256}, octaves = 3, persist = 0.5, lacunarity = 2,}

minetest.set_noiseparams("mg_biome_np_heat", aus.mg_biome_np_heat)
minetest.set_noiseparams("mg_biome_np_heat_blend", aus.mg_biome_np_heat_blend)
minetest.set_noiseparams("mg_biome_np_humidity", aus.mg_biome_np_humidity)
minetest.set_noiseparams("mg_biome_np_humidity_blend", aus.mg_biome_np_humidity_blend)
minetest.set_noiseparams("mgvalleys_np_cave1", aus.mgvalleys_np_cave1)
minetest.set_noiseparams("mgvalleys_np_cave2", aus.mgvalleys_np_cave2)
minetest.set_noiseparams("mgvalleys_np_filler_depth", aus.mgvalleys_np_filler_depth)
minetest.set_noiseparams("mgvalleys_np_massive_caves", aus.mgvalleys_np_massive_caves)
minetest.set_noiseparams("mgvalleys_np_rivers", aus.mgvalleys_np_rivers)
minetest.set_noiseparams("mgvalleys_np_terrain_height", aus.mgvalleys_np_terrain_height)
minetest.set_noiseparams("mgvalleys_np_valley_depth", aus.mgvalleys_np_valley_depth)
minetest.set_noiseparams("mgvalleys_np_inter_valley_fill", aus.mgvalleys_np_inter_valley_fill)
minetest.set_noiseparams("mgvalleys_np_valley_profile", aus.mgvalleys_np_valley_profile)
minetest.set_noiseparams("mgvalleys_np_inter_valley_slope", aus.mgvalleys_np_inter_valley_slope)


--[[
	Mapgen settings
--]]

-- How deep to make rivers
minetest.setting_set("mgvalleys_river_depth", 5)

-- How wide to make rivers
minetest.setting_set("mgvalleys_river_size", 4)


--[[
	Biomes
--]]

-- Set the following variables to true to enable each biome
aus.biome_underground				= true
aus.biome_mangroves					= true
aus.biome_tasman_sea				= true
aus.biome_great_australian_bight	= true
aus.biome_indian_ocean				= true
aus.biome_great_barrier_reef		= true
aus.biome_timor_sea					= true
aus.biome_tasmania					= true
aus.biome_victorian_forests			= true
aus.biome_jarrah_karri_forests		= true
aus.biome_eastern_coasts			= true
aus.biome_flinders_lofty			= true
aus.biome_murray_darling_basin		= true
aus.biome_goldfields_esperence		= true
aus.biome_mulga_lands				= true
aus.biome_far_north_queensland		= true
aus.biome_central_australia			= true
aus.biome_top_end					= true
aus.biome_pilbara					= true
aus.biome_simpson_desert			= true
aus.biome_australian_alps			= true


aus.registered_on_first_mapgen = {}

function aus.register_on_first_mapgen(func) -- Callback
	table.insert(aus.registered_on_first_mapgen, func)
end


-- Load files
dofile(aus.path .. "/functions.lua")
dofile(aus.path .. "/nodes.lua")
dofile(aus.path .. "/noairblocks.lua")
dofile(aus.path .. "/craftitems.lua")
dofile(aus.path .. "/crafting.lua")
dofile(aus.path .. "/trees.lua")
dofile(aus.path .. "/plants_api.lua")
dofile(aus.path .. "/mapgen.lua")
dofile(aus.path .. "/saplings.lua")
dofile(aus.path .. "/voxel.lua")

minetest.log("MOD: Australia 0.8 [australia] loaded...")
