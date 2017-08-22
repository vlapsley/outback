-- mods/australia_modpack/australia/nodes_plants.lua


-- Bottlebrush Orchid
minetest.register_node("australia:bottlebrush_orchid", {
	description = "Bottlebrush Orchid",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_bottlebrush_orchid.png"},
	inventory_image = "aus_bottlebrush_orchid.png",
	wield_image = "aus_bottlebrush_orchid.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {snappy = 3, flammable = 2, flora = 1, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Bush Tomato plant
minetest.register_node("australia:tomato_bush", {
	description = "Bush Tomato plant",
	drawtype = "plantlike",
	waving = 0,
	visual_scale = 1.0,
	tiles = {"aus_tomato_bush.png"},
	inventory_image = "aus_tomato_bush.png",
	wield_image = "aus_tomato_bush.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {snappy = 3, flammable = 1, flora = 1, attached_node = 1},
	drop = {
		items = {
			{items = {"australia:tomato_bush"}, rarity = 5},
			{items = {"australia:bush_tomato 4"}}
		}
	},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Bush Tomato
minetest.register_craftitem("australia:bush_tomato", {
	description = "Bush Tomato",
	inventory_image = "aus_bush_tomato.png",
	groups = {fleshy = 3, dig_immediate = 3, flammable = 1},
	on_use = minetest.item_eat(1),
})

-- Cooktown Orchid
minetest.register_node("australia:cooktown_orchid", {
	description = "Cooktown Orchid",
	drawtype = "plantlike",
	waving = 0,
	visual_scale = 1.0,
	tiles = {"aus_cooktown_orchid.png"},
	inventory_image = "aus_cooktown_orchid.png",
	wield_image = "aus_cooktown_orchid.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {snappy = 3, flammable = 1, flora = 1, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Couch Honeypot
minetest.register_node("australia:couch_honeypot", {
	description = "Couch Honeypot",
	drawtype = "plantlike",
	waving = 0,
	visual_scale = 1.0,
	tiles = {"aus_couch_honeypot.png"},
	inventory_image = "aus_couch_honeypot.png",
	wield_image = "aus_couch_honeypot.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {snappy = 3, flammable = 2, flora = 1, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Darling Lily
minetest.register_node("australia:darling_lily", {
	description = "Darling Lily",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_darling_lily.png"},
	inventory_image = "aus_darling_lily.png",
	wield_image = "aus_darling_lily.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {snappy = 3, flammable = 2, flora = 1, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Flame Grevillea
minetest.register_node("australia:flame_grevillea_leaves", {
	description = "Flame Grevillea Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"aus_flame_grevillea_leaves.png"},
	paramtype = "light",
	groups = {snappy = 3, leafdecay = 3, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:flame_grevillea_sapling"}, rarity = 10,},
			{items = {"australia:flame_grevillea_leaves"},}
		}
	},
	sounds = core.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:flame_grevillea_sapling", {
	description = "Flame Grevillea Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_acacia_sapling.png"},
	inventory_image = "default_acacia_sapling.png",
	wield_image = "default_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = core.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:flame_grevillea_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 4, z = 3},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Kangaroo Paw
minetest.register_node("australia:kangaroo_paw", {
	description = "Kangaroo Paw",
	drawtype = "plantlike",
	waving = 0,
	visual_scale = 1.0,
	tiles = {"aus_kangaroo_paw.png"},
	inventory_image = "aus_kangaroo_paw.png",
	wield_image = "aus_kangaroo_paw.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {snappy = 3, flammable = 2, flora = 1, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Lavender Grevillea
minetest.register_node("australia:lavender_grevillea", {
	description = "Lavender Grevillea",
	drawtype = "allfaces_optional",
	visual_scale = 1.0,
	tiles = {"aus_lavender_grevillea.png"},
	inventory_image = {"aus_lavender_grevillea.png"},
	wield_image = {"aus_lavender_grevillea.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {snappy = 3, flammable = 2, flora = 1, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
})

-- Mangrove Fern
minetest.register_node("australia:mangrove_fern", {
	description = "Mangrove Fern",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_mangrove_fern.png"},
	inventory_image = "aus_mangrove_fern.png",
	wield_image = "aus_mangrove_fern.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {snappy = 3, flammable = 1, flora = 1, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Mangrove Lily
minetest.register_node("australia:mangrove_lily", {
	description = "Mangrove Lily",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_mangrove_lily.png"},
	inventory_image = "aus_mangrove_lily.png",
	wield_image = "aus_mangrove_lily.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {snappy = 3, flammable = 1, flora = 1, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Mitchell Grass
minetest.register_node("australia:mitchell_grass", {
	description = "Mitchell Grass",
	drawtype = "plantlike",
	waving = 0,
	visual_scale = 1.0,
	tiles = {"aus_mitchell_grass.png"},
	inventory_image = "aus_mitchell_grass.png",
	wield_image = "aus_mitchell_grass.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Nipa Palm
minetest.register_node("australia:mangrove_palm_trunk", {
	description = "Nipa Palm",
	tiles = {"aus_mangrove_palm_trunk.png", "aus_mangrove_mud.png",
		"aus_mangrove_palm_trunk.png"},
	inventory_image = "aus_mangrove_palm_trunk.png",
	wield_image = "aus_mangrove_palm_trunk.png",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy = 2, flammable = 1, flora = 1, attached_node = 1, oddly_breakable_by_hand = 1},
	sounds = core.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, 8/16, 8/16},
	},
})

minetest.register_node("australia:mangrove_palm_leaf_bot", {
	description = "Nipa Palm",
	tiles = {"aus_mangrove_palm_leaf_bot.png", "aus_mangrove_palm_leaf_bot.png",
		"aus_mangrove_palm_leaf_bot.png"},
	inventory_image = "aus_mangrove_palm_leaf_bot.png",
	wield_image = "aus_mangrove_palm_leaf_bot.png",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3, flammable = 1, flora = 1, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
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

minetest.register_node("australia:mangrove_palm_leaf_top", {
	description = "Nipa Palm",
	tiles = {"aus_mangrove_palm_leaf_top.png", "aus_mangrove_palm_leaf_top.png",
		"aus_mangrove_palm_leaf_top.png"},
	inventory_image = "aus_mangrove_palm_leaf_top.png",
	wield_image = "aus_mangrove_palm_leaf_top.png",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3, flammable = 1, flora = 1, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
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

-- Old Man Saltbush
minetest.register_node("australia:saltbush", {
	description = "Old Man Saltbush",
	drawtype = "plantlike",
	waving = 0,
	visual_scale = 1.4,
	tiles = {"aus_saltbush.png"},
	inventory_image = "aus_saltbush.png",
	wield_image = "aus_saltbush.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Pink Mulla Mulla
minetest.register_node("australia:pink_mulla_mulla", {
	description = "Pink Mulla Mulla",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_pink_mulla_mulla.png"},
	inventory_image = "aus_pink_mulla_mulla.png",
	wield_image = "aus_pink_mulla_mulla.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Red Bottlebrush
minetest.register_node("australia:red_bottlebrush_leaves", {
	description = "Red Bottlebrush Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"aus_red_bottlebrush_leaves.png"},
	paramtype = "light",
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:red_bottlebrush_sapling"}, rarity = 10,},
			{items = {"australia:red_bottlebrush_leaves"},}
		}
	},
	sounds = core.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:red_bottlebrush_sapling", {
	description = "Red Bottlebrush Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_melaleuca_sapling.png"},
	inventory_image = "aus_melaleuca_sapling.png",
	wield_image = "aus_melaleuca_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = core.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:red_bottlebrush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 4, z = 3},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Silver Daisy
minetest.register_node("australia:silver_daisy", {
	description = "Silver Daisy",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_silver_daisy.png"},
	inventory_image = "aus_silver_daisy.png",
	wield_image = "aus_silver_daisy.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Spinifex
minetest.register_node("australia:spinifex", {
	description = "Spinifex",
	drawtype = "plantlike",
	waving = 0,
	visual_scale = 1.2,
	tiles = {"aus_spinifex.png"},
	inventory_image = "aus_spinifex.png",
	wield_image = "aus_spinifex.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Sturt's Desert Pea
minetest.register_node("australia:sturts_desert_pea", {
	description = "Sturt's Desert Pea",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_sturts_desert_pea.png"},
	inventory_image = "aus_sturts_desert_pea.png",
	wield_image = "aus_sturts_desert_pea.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = false,
	groups = {snappy = 3, flammable = 2, flora = 1, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

-- Waratah
minetest.register_node("australia:waratah_leaves", {
	description = "Waratah Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"aus_waratah_leaves.png"},
	paramtype = "light",
	groups = {snappy = 3, leafdecay = 3, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:waratah_sapling"}, rarity = 10,},
			{items = {"australia:waratah_leaves"},}
		}
	},
	sounds = core.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:waratah_sapling", {
	description = "Waratah Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_acacia_sapling.png"},
	inventory_image = "default_acacia_sapling.png",
	wield_image = "default_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = core.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:waratah_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 3, z = 3},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

