--[[
	Default
--]]

-- Definitions made by this mod that other mods can use too
default = {}

default.LIGHT_MAX = 14

-- Load files
local modpath = minetest.get_modpath("default")
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

-- Legacy
WATER_ALPHA = minetest.registered_nodes["default:water_source"].alpha
WATER_VISC = minetest.registered_nodes["default:water_source"].liquid_viscosity
LAVA_VISC = minetest.registered_nodes["default:lava_source"].liquid_viscosity
LIGHT_MAX = default.LIGHT_MAX

