--[[
	Base plant nodes
--]]


minetest.register_node("base:tomato_bush", {
	description = "Bush Tomato plant",
	drawtype = "plantlike",
	waving = 0,
	tiles = {"base_tomato_bush.png"},
	inventory_image = "base_tomato_bush.png",
	wield_image = "base_tomato_bush.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 2, flora = 1, attached_node = 1,
		not_in_creative_inventory = 1},
	drop = {
		items = {
			{items = {"base:tomato_bush"}, rarity = 5},
			{items = {"base:bush_tomato 4"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

minetest.register_craftitem("base:bush_tomato", {
	description = "Bush Tomato",
	inventory_image = "base_bush_tomato.png",
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2},
	on_use = minetest.item_eat(1),
})

minetest.register_node("base:lavender_grevillea", {
	description = "Lavender Grevillea",
	drawtype = "allfaces_optional",
	tiles = {"base_lavender_grevillea.png"},
	inventory_image = {"base_lavender_grevillea.png"},
	wield_image = {"base_lavender_grevillea.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy = 3, flammable = 2, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("base:mangrove_fern", {
	description = "Mangrove Fern",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"base_mangrove_fern.png"},
	inventory_image = "base_mangrove_fern.png",
	wield_image = "base_mangrove_fern.png",
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

minetest.register_node("base:mitchell_grass", {
	description = "Mitchell Grass",
	drawtype = "plantlike",
	waving = 0,
	tiles = {"base_mitchell_grass.png"},
	inventory_image = "base_mitchell_grass.png",
	wield_image = "base_mitchell_grass.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {snappy = 3, flammable = 1, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Nipa Palm
minetest.register_node("base:mangrove_palm_trunk", {
	description = "Nipa Palm",
	tiles = {"base_mangrove_palm_trunk.png", "base_mangrove_mud.png",
		"base_mangrove_palm_trunk.png"},
	inventory_image = "base_mangrove_palm_trunk.png",
	wield_image = "base_mangrove_palm_trunk.png",
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

minetest.register_node("base:mangrove_palm_leaf_bot", {
	description = "Nipa Palm",
	tiles = {"base_mangrove_palm_leaf_bot.png", "base_mangrove_palm_leaf_bot.png",
		"base_mangrove_palm_leaf_bot.png"},
	inventory_image = "base_mangrove_palm_leaf_bot.png",
	wield_image = "base_mangrove_palm_leaf_bot.png",
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

minetest.register_node("base:mangrove_palm_leaf_top", {
	description = "Nipa Palm",
	tiles = {"base_mangrove_palm_leaf_top.png", "base_mangrove_palm_leaf_top.png",
		"base_mangrove_palm_leaf_top.png"},
	inventory_image = "base_mangrove_palm_leaf_top.png",
	wield_image = "base_mangrove_palm_leaf_top.png",
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

minetest.register_node("base:saltbush", {
	description = "Old Man Saltbush",
	drawtype = "plantlike",
	waving = 0,
	visual_scale = 1.4,
	tiles = {"base_saltbush.png"},
	inventory_image = "base_saltbush.png",
	wield_image = "base_saltbush.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 2, flammable = 1, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

minetest.register_node("base:spinifex", {
	description = "Spinifex",
	drawtype = "plantlike",
	waving = 0,
	visual_scale = 2,
	tiles = {"base_spinifex.png"},
	inventory_image = "base_spinifex.png",
	wield_image = "base_spinifex.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 2, flammable = 1, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

minetest.register_node("base:flame_grevillea_leaves", {
	description = "Flame Grevillea Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"base_flame_grevillea_leaves.png"},
	paramtype = "light",
	groups = {snappy = 3, leafdecay = 3, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:flame_grevillea_sapling"}, rarity = 10,},
			{items = {"base:flame_grevillea_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("base:flame_grevillea_sapling", {
	description = "Flame Grevillea Sapling",
	drawtype = "plantlike",
	tiles = {"default_acacia_sapling.png"},
	inventory_image = "default_acacia_sapling.png",
	wield_image = "default_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 6/16, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(1200, 2400))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"base:flame_grevillea_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 4, z = 3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

-- Red Bottlebrush
minetest.register_node("base:red_bottlebrush_leaves", {
	description = "Red Bottlebrush Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"base_red_bottlebrush_leaves.png"},
	paramtype = "light",
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:red_bottlebrush_sapling"}, rarity = 10,},
			{items = {"base:red_bottlebrush_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("base:red_bottlebrush_sapling", {
	description = "Red Bottlebrush Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_melaleuca_sapling.png"},
	inventory_image = "base_melaleuca_sapling.png",
	wield_image = "base_melaleuca_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 6/16, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(1200, 2400))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"base:red_bottlebrush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 4, z = 3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

-- Waratah
minetest.register_node("base:waratah_leaves", {
	description = "Waratah Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"base_waratah_leaves.png"},
	paramtype = "light",
	groups = {snappy = 3, leafdecay = 3, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:waratah_sapling"}, rarity = 10,},
			{items = {"base:waratah_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("base:waratah_sapling", {
	description = "Waratah Sapling",
	drawtype = "plantlike",
	tiles = {"default_acacia_sapling.png"},
	inventory_image = "default_acacia_sapling.png",
	wield_image = "default_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 6/16, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"base:waratah_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 3, z = 3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

