--[[
	Base
--]]

base = {}

-- Load files
local modpath = minetest.get_modpath("base")
dofile(modpath.."/sounds.lua")
dofile(modpath.."/functions.lua")
dofile(modpath.."/nodes_base.lua") -- Simple solid cubic nodes with simple definitions
dofile(modpath.."/nodes_liquid.lua") -- Liquids
dofile(modpath.."/nodes_plants.lua") -- Plants
dofile(modpath.."/nodes_trees.lua") -- Tree nodes: wood, planks, sapling, leaves
dofile(modpath.."/nodes_glass.lua") -- Glass
dofile(modpath.."/nodes_climb.lua") -- Climbable nodes
dofile(modpath.."/nodes_misc.lua") -- Other and special nodes
dofile(modpath.."/craftitems.lua")
dofile(modpath.."/crafting.lua")
