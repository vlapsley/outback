--[[
	Core climbable nodes
--]]

minetest.register_node("core:ladder_wood", {
	description = "Wooden Ladder",
	drawtype = "signlike",
	tiles = {"core_ladder_wood.png"},
	inventory_image = "core_ladder_wood.png",
	wield_image = "core_ladder_wood.png",
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
	sounds = core.node_sound_wood_defaults(),
})

minetest.register_node("core:ladder_steel", {
	description = "Steel Ladder",
	drawtype = "signlike",
	tiles = {"core_ladder_steel.png"},
	inventory_image = "core_ladder_steel.png",
	wield_image = "core_ladder_steel.png",
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
	sounds = core.node_sound_metal_defaults(),
})

