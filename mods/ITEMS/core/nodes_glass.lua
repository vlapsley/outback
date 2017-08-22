--[[
	Core glass nodes
--]]

minetest.register_node("core:glass", {
	description = "Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"core_glass.png", "core_glass_detail.png"},
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = core.node_sound_glass_defaults(),
})

minetest.register_node("core:obsidian_glass", {
	description = "Obsidian Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"core_obsidian_glass.png", "core_obsidian_glass_detail.png"},
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	is_ground_content = false,
	sunlight_propagates = true,
	sounds = core.node_sound_glass_defaults(),
	groups = {cracky = 3},
})

