--[[
	Core sounds
--]]

function core.node_sound_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "", gain = 1.0}
	table.dug = table.dug or
			{name = "core_dug_node", gain = 0.25}
	table.place = table.place or
			{name = "core_place_node_hard", gain = 1.0}
	return table
end

function core.node_sound_stone_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "core_hard_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "core_hard_footstep", gain = 1.0}
	core.node_sound_defaults(table)
	return table
end

function core.node_sound_dirt_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "core_dirt_footstep", gain = 0.4}
	table.dug = table.dug or
			{name = "core_dirt_footstep", gain = 1.0}
	table.place = table.place or
			{name = "core_place_node", gain = 1.0}
	core.node_sound_defaults(table)
	return table
end

function core.node_sound_sand_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "core_sand_footstep", gain = 0.12}
	table.dug = table.dug or
			{name = "core_sand_footstep", gain = 0.24}
	table.place = table.place or
			{name = "core_place_node", gain = 1.0}
	core.node_sound_defaults(table)
	return table
end

function core.node_sound_gravel_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "core_gravel_footstep", gain = 0.4}
	table.dug = table.dug or
			{name = "core_gravel_footstep", gain = 1.0}
	table.place = table.place or
			{name = "core_place_node", gain = 1.0}
	core.node_sound_defaults(table)
	return table
end

function core.node_sound_wood_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "core_wood_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "core_wood_footstep", gain = 1.0}
	core.node_sound_defaults(table)
	return table
end

function core.node_sound_leaves_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "core_grass_footstep", gain = 0.45}
	table.dug = table.dug or
			{name = "core_grass_footstep", gain = 0.7}
	table.place = table.place or
			{name = "core_place_node", gain = 1.0}
	core.node_sound_defaults(table)
	return table
end

function core.node_sound_glass_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "core_glass_footstep", gain = 0.3}
	table.dig = table.dig or
			{name = "core_glass_footstep", gain = 0.5}
	table.dug = table.dug or
			{name = "core_break_glass", gain = 1.0}
	core.node_sound_defaults(table)
	return table
end

function core.node_sound_metal_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "core_metal_footstep", gain = 0.4}
	table.dig = table.dig or
			{name = "core_dig_metal", gain = 0.5}
	table.dug = table.dug or
			{name = "core_dug_metal", gain = 0.5}
	table.place = table.place or
			{name = "core_place_node_metal", gain = 0.5}
	core.node_sound_defaults(table)
	return table
end

function core.node_sound_water_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "core_water_footstep", gain = 0.2}
	core.node_sound_defaults(table)
	return table
end

