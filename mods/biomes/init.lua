--[[
	Outback Biomes
--]]


biomes = {}

biomes.path = minetest.get_modpath("biomes")

minetest.clear_registered_biomes()


-- Underground
if outback.deep_underground then dofile(biomes.path.."/deep_underground.lua") end
if outback.underground then dofile(biomes.path.."/underground.lua") end

-- Coast/Ocean
if outback.mangroves then dofile(biomes.path.."/mangroves.lua") end
if outback.tasman_sea then dofile(biomes.path.."/tasman_sea.lua") end
if outback.great_australian_bight then dofile(biomes.path.."/great_australian_bight.lua") end
if outback.indian_ocean then dofile(biomes.path.."/indian_ocean.lua") end
if outback.great_barrier_reef then dofile(biomes.path.."/great_barrier_reef.lua") end
if outback.timor_sea then dofile(biomes.path.."/timor_sea.lua") end

-- Mainland
if outback.tasmania then dofile(biomes.path.."/tasmania.lua") end
if outback.victoria then dofile(biomes.path.."/victoria.lua") end
if outback.jarrah_karri_forests then dofile(biomes.path.."/jarrah_karri_forests.lua") end
if outback.eastern_coasts then dofile(biomes.path.."/eastern_coasts.lua") end
if outback.flinders_lofty then dofile(biomes.path.."/flinders_lofty.lua") end
if outback.murray_darling then dofile(biomes.path.."/murray_darling.lua") end
if outback.nullabor then dofile(biomes.path.."/nullabor.lua") end
if outback.mulga_lands then dofile(biomes.path.."/mulga_lands.lua") end
if outback.far_north_queensland then dofile(biomes.path.."/far_north_queensland.lua") end
if outback.central_australia then dofile(biomes.path.."/central_australia.lua") end
if outback.top_end then dofile(biomes.path.."/top_end.lua") end
if outback.pilbara then dofile(biomes.path.."/pilbara.lua") end
if outback.simpson_desert then dofile(biomes.path.."/simpson_desert.lua") end

-- Alpine
if outback.australian_alps then dofile(biomes.path.."/australian_alps.lua") end