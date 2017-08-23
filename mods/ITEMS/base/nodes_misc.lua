--[[
	Base miscellaneous nodes
--]]

minetest.register_node("base:cloud", {
	description = "Cloud",
	tiles = {"base_cloud.png"},
	is_ground_content = false,
	sounds = base.node_sound_defaults(),
	groups = {not_in_creative_inventory = 1},
})

minetest.register_node("base:salt", {
	description = "Salt",
	drawtype = "plantlike",
	visual_scale = 0.6,
	tiles = {"base_salt.png"},
	inventory_image = "base_salt.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy = 3, dig_immediate = 3, flammable = 1},
	on_use = minetest.item_eat(1),
	sounds = base.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-3/32, -8/16, -3/32, 3/32, -4/16, 3/32},
	},
	collision_box = {
		type = "fixed",
		fixed = {-3/32, -8/16, -3/32, 3/32, -4/16, 3/32},
	},
})

