--[[
	Plant nodes
--]]

minetest.register_node("outback:mangrove_fern", {
	description = "Mangrove Fern",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"ob_mangrove_fern.png"},
	inventory_image = "ob_mangrove_fern.png",
	wield_image = "ob_mangrove_fern.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Nipa Palm
minetest.register_node("outback:mangrove_palm_trunk", {
	description = "Nipa Palm",
	tiles = {"ob_mangrove_palm_trunk.png", "ob_mangrove_mud.png",
		"ob_mangrove_palm_trunk.png"},
	inventory_image = "ob_mangrove_palm_trunk.png",
	wield_image = "ob_mangrove_palm_trunk.png",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy = 2, flammable = 3, flora = 1, attached_node = 1, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, 8/16, 8/16},
	},
})

minetest.register_node("outback:mangrove_palm_leaf_bot", {
	description = "Nipa Palm",
	tiles = {"ob_mangrove_palm_leaf_bot.png", "ob_mangrove_palm_leaf_bot.png",
		"ob_mangrove_palm_leaf_bot.png"},
	inventory_image = "ob_mangrove_palm_leaf_bot.png",
	wield_image = "ob_mangrove_palm_leaf_bot.png",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	drawtype = "nodebox",
	nodebox = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, 8/16, 8/16},
	},
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, 8/16, 8/16},
	},
})

minetest.register_node("outback:mangrove_palm_leaf_top", {
	description = "Nipa Palm",
	tiles = {"ob_mangrove_palm_leaf_top.png", "ob_mangrove_palm_leaf_top.png",
		"ob_mangrove_palm_leaf_top.png"},
	inventory_image = "ob_mangrove_palm_leaf_top.png",
	wield_image = "ob_mangrove_palm_leaf_top.png",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	drawtype = "nodebox",
	nodebox = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, 8/16, 8/16},
	},
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, 8/16, 8/16},
	},
})
