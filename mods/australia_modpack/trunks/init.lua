-----------------------------------------------------------------------------------------------
local title		= "Trunks"
local version 	= "0.1.5"
local mname		= "trunks"
-----------------------------------------------------------------------------------------------
-- Original code by Mossmanikin & Neuromancer
-- Updated by demon_boy. Added mushrooms.

abstract_trunks = {}

dofile(minetest.get_modpath("trunks").."/trunks_settings.txt")
dofile(minetest.get_modpath("trunks").."/generating.lua")
dofile(minetest.get_modpath("trunks").."/nodes.lua")
dofile(minetest.get_modpath("trunks").."/crafting.lua")

-----------------------------------------------------------------------------------------------
minetest.log("MOD: "..title.." ["..version.."] ["..mname.."] loaded...")
-----------------------------------------------------------------------------------------------
