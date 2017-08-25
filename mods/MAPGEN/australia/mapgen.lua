-- mods/australia_modpack/australia/mapgen.lua

minetest.clear_registered_biomes()
minetest.clear_registered_decorations()


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
