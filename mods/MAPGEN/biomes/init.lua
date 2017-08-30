--[[
	Biomes
--]]


biomes = {}

biomes.path = minetest.get_modpath("biomes")

minetest.clear_registered_biomes()


-- Set the following variables to true to enable each biome
biomes.underground            = true
biomes.mangroves              = true
biomes.tasman_sea             = true
biomes.great_australian_bight = true
biomes.indian_ocean           = true
biomes.great_barrier_reef     = true
biomes.timor_sea              = true
biomes.tasmania               = true
biomes.victoria               = true
biomes.jarrah_karri_forests   = true
biomes.eastern_coasts         = true
biomes.flinders_lofty         = true
biomes.murray_darling_basin   = true
biomes.nullabor_plains        = true
biomes.mulga_lands            = true
biomes.far_north_queensland   = true
biomes.central_australia      = true
biomes.top_end                = true
biomes.pilbara                = true
biomes.simpson_desert         = true
biomes.australian_alps        = true


-- Underground
if biomes.underground then dofile(biomes.path.."/underground.lua") end

-- Coast/Ocean
if biomes.mangroves then dofile(biomes.path.."/mangroves.lua") end
if biomes.tasman_sea then dofile(biomes.path.."/tasman_sea.lua") end
if biomes.great_australian_bight then dofile(biomes.path.."/great_australian_bight.lua") end
if biomes.indian_ocean then dofile(biomes.path.."/indian_ocean.lua") end
if biomes.great_barrier_reef then dofile(biomes.path.."/great_barrier_reef.lua") end
if biomes.timor_sea then dofile(biomes.path.."/timor_sea.lua") end

-- Mainland
if biomes.tasmania then dofile(biomes.path.."/tasmania.lua") end
if biomes.victoria then dofile(biomes.path.."/victoria.lua") end
if biomes.jarrah_karri_forests then dofile(biomes.path.."/jarrah_karri_forests.lua") end
if biomes.eastern_coasts then dofile(biomes.path.."/eastern_coasts.lua") end
if biomes.flinders_lofty then dofile(biomes.path.."/flinders_lofty.lua") end
if biomes.murray_darling_basin then dofile(biomes.path.."/murray_darling_basin.lua") end
if biomes.nullabor_plains then dofile(biomes.path.."/nullabor_plains.lua") end
if biomes.mulga_lands then dofile(biomes.path.."/mulga_lands.lua") end
if biomes.far_north_queensland then dofile(biomes.path.."/far_north_queensland.lua") end
if biomes.central_australia then dofile(biomes.path.."/central_australia.lua") end
if biomes.top_end then dofile(biomes.path.."/top_end.lua") end
if biomes.pilbara then dofile(biomes.path.."/pilbara.lua") end
if biomes.simpson_desert then dofile(biomes.path.."/simpson_desert.lua") end

-- Alpine
if biomes.australian_alps then dofile(biomes.path.."/australian_alps.lua") end


