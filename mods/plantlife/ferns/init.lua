-----------------------------------------------------------------------------------------------
local title		= "Ferns" -- former "Archae Plantae"
local version	= "0.2.1"
local mname		= "ferns" -- former "archaeplantae"
-----------------------------------------------------------------------------------------------
-- (by Mossmanikin)
-- License (everything):	WTFPL
-----------------------------------------------------------------------------------------------

abstract_ferns = {}

-- support for i18n
local S = plantlife_i18n.gettext

dofile(minetest.get_modpath("ferns").."/treefern.lua")
dofile(minetest.get_modpath("ferns").."/gianttreefern.lua")
dofile(minetest.get_modpath("ferns").."/crafting.lua")

-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------
