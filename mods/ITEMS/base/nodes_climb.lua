--[[
	Base climbable nodes
--]]

minetest.register_node("base:ladder_wood", {
	description = "Wooden Ladder",
	drawtype = "signlike",
	tiles = {"base_ladder_wood.png"},
	inventory_image = "base_ladder_wood.png",
	wield_image = "base_ladder_wood.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	legacy_wallmounted = true,
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:ladder_steel", {
	description = "Steel Ladder",
	drawtype = "signlike",
	tiles = {"base_ladder_steel.png"},
	inventory_image = "base_ladder_steel.png",
	wield_image = "base_ladder_steel.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {cracky = 2},
	sounds = base.node_sound_metal_defaults(),
})

