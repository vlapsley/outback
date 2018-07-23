--[[
	Outback: The Outback game base mod
--]]

outback = {}

-- Load files
local modpath = minetest.get_modpath("outback")
dofile(modpath.."/config.lua")  -- Outback game configuration
dofile(modpath.."/functions.lua")
dofile(modpath.."/nodes_base.lua")  -- Simple nodes with simple definitions
dofile(modpath.."/nodes_liquid.lua")  -- Liquids
dofile(modpath.."/nodes_plants.lua")  -- Plants
dofile(modpath.."/nodes_trees.lua")  -- Tree nodes: wood, planks, sapling, leaves
dofile(modpath.."/nodes_misc.lua")  -- Other and special nodes
dofile(modpath.."/craftitems.lua")
dofile(modpath.."/crafting.lua")
