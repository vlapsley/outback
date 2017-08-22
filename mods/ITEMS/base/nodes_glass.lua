--[[
	Base glass nodes
--]]

minetest.register_node("base:glass", {
	description = "Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"base_glass.png", "base_glass_detail.png"},
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = base.node_sound_glass_defaults(),
})

minetest.register_node("base:obsidian_glass", {
	description = "Obsidian Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"base_obsidian_glass.png", "base_obsidian_glass_detail.png"},
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	is_ground_content = false,
	sunlight_propagates = true,
	sounds = base.node_sound_glass_defaults(),
	groups = {cracky = 3},
})

