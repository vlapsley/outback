-- mods/australia_modpack/australia/nodes_trees.lua


-- Arnhem Cypress Pine
minetest.register_node("australia:arnhem_cypress_pine_tree", {
	description = "Arnhem Cypress Pine Tree",
	tiles = {
		"aus_arnhem_cypress_pine_tree_top.png",
		"aus_arnhem_cypress_pine_tree_top.png",
		"aus_arnhem_cypress_pine_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:arnhem_cypress_pine_leaves", {
	description = "Arnhem Cypress Pine Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_arnhem_cypress_pine_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:arnhem_cypress_pine_sapling"}, rarity = 20,},
			{items = {"australia:arnhem_cypress_pine_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:arnhem_cypress_pine_sapling", {
	description = "Arnhem Cypress Pine Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_pine_sapling.png"},
	inventory_image = "default_pine_sapling.png",
	wield_image = "default_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:arnhem_cypress_pine_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 17, z = 4},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Black Box
minetest.register_node("australia:black_box_tree", {
	description = "Black Box Tree",
	tiles = {
		"aus_black_box_tree_top.png",
		"aus_black_box_tree_top.png",
		"aus_black_box_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:black_box_leaves", {
	description = "Black Box Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_black_box_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:black_box_sapling"}, rarity = 20,},
			{items = {"australia:black_box_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:black_box_sapling", {
	description = "Black Box Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_eucalyptus_sapling.png"},
	inventory_image = "aus_eucalyptus_sapling.png",
	wield_image = "aus_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:black_box_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -6, y = 1, z = -6},
			{x = 6, y = 16, z = 6},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Black Wattle
minetest.register_node("australia:black_wattle_tree", {
	description = "Black Wattle Tree",
	tiles = {
		"aus_black_wattle_tree_top.png",
		"aus_black_wattle_tree_top.png",
		"aus_black_wattle_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-6/16, -8/16, -6/16, 6/16, 8/16, 6/16},
	},
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -8/16, -6/16, 6/16, 8/16, 6/16},
	},
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:black_wattle_leaves", {
	description = "Black Wattle Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_black_wattle_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:black_wattle_sapling"}, rarity = 20,},
			{items = {"australia:black_wattle_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:black_wattle_sapling", {
	description = "Black Wattle Sapling",
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
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:black_wattle_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 17, z = 4},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Blue Gum
minetest.register_node("australia:blue_gum_tree", {
	description = "Blue Gum Tree",
	tiles = {
		"aus_blue_gum_tree_top.png",
		"aus_blue_gum_tree_top.png",
		"aus_blue_gum_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:blue_gum_leaves", {
	description = "Blue Gum Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_blue_gum_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:blue_gum_sapling"}, rarity = 20,},
			{items = {"australia:blue_gum_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:blue_gum_sapling", {
	description = "Blue Gum Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_eucalyptus_sapling.png"},
	inventory_image = "aus_eucalyptus_sapling.png",
	wield_image = "aus_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:blue_gum_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -7, y = 1, z = -7},
			{x = 7, y = 31, z = 7},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Boab
minetest.register_node("australia:boab_tree", {
	description = "Boab Tree",
	tiles = {
		"aus_boab_tree_top.png",
		"aus_boab_tree_top.png",
		"aus_boab_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:boab_leaves", {
	description = "Boab Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_boab_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:boab_sapling"}, rarity = 20,},
			{items = {"australia:boab_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:boab_sapling", {
	description = "Boab Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_boab_sapling.png"},
	inventory_image = "aus_boab_sapling.png",
	wield_image = "aus_boab_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:boab_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 9, z = 5},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Bull Banksia
minetest.register_node("australia:bull_banksia_tree", {
	description = "Bull Banksia Tree",
	tiles = {
		"aus_bull_banksia_tree_top.png",
		"aus_bull_banksia_tree_top.png",
		"aus_bull_banksia_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-5/32, -8/16, -5/32, 5/32, 8/16, 5/32},
	},
	selection_box = {
		type = "fixed",
		fixed = {-5/32, -8/16, -5/32, 5/32, 8/16, 5/32},
	},
	drop = 'default:stick 4',
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:bull_banksia_leaves", {
	description = "Bull Banksia Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_bull_banksia_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:bull_banksia_sapling"}, rarity = 20,},
			{items = {"australia:bull_banksia_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:bull_banksia_sapling", {
	description = "Bull Banksia Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_banksia_sapling.png"},
	inventory_image = "aus_banksia_sapling.png",
	wield_image = "aus_banksia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:bull_banksia_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 8, z = 3},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Celery-top Pine
minetest.register_node("australia:celery_top_pine_tree", {
	description = "Celery-top Pine Tree",
	tiles = {
		"aus_celery_top_pine_tree_top.png",
		"aus_celery_top_pine_tree_top.png",
		"aus_celery_top_pine_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-6/16, -8/16, -6/16, 6/16, 8/16, 6/16},
	},
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -8/16, -6/16, 6/16, 8/16, 6/16},
	},
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:celery_top_pine_leaves", {
	description = "Celery-top Pine Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_celery_top_pine_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:celery_top_pine_sapling"}, rarity = 20,},
			{items = {"australia:celery_top_pine_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:celery_top_pine_sapling", {
	description = "Celery-top Pine Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_pine_sapling.png"},
	inventory_image = "default_pine_sapling.png",
	wield_image = "default_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:celery_top_pine_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 12, z = 4},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Australian Cherry
minetest.register_node("australia:cherry_tree", {
	description = "Australian Cherry Tree",
	tiles = {
		"aus_cherry_tree_top.png",
		"aus_cherry_tree_top.png",
		"aus_cherry_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, 8/16, 4/16},
	},
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, 8/16, 4/16},
	},
	drop = 'default:stick 4',
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:cherry_leaves", {
	description = "Australian Cherry Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_cherry_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:cherry_sapling"}, rarity = 20,},
			{items = {"australia:cherry_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:cherry_sapling", {
	description = "Australian Cherry Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_berry_sapling.png"},
	inventory_image = "aus_berry_sapling.png",
	wield_image = "aus_berry_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:cherry_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 6, z = 3},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

minetest.register_node("australia:cherry", {
	description = "Australian Cherries",
	drawtype = "plantlike",
	visual_scale = 8/16,
	tiles = {"aus_cherry.png"},
	inventory_image = "aus_cherry.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3/32, -8/16, -3/32, 3/32, -4/16, 3/32},
	},
	groups = {fleshy = 3, dig_immediate = 2, flammable = 3, leafdecay = 5, leafdecay_drop = 1},
	on_use = minetest.item_eat(1),
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "australia:cherry", param2 = 1})
		end
	end,
})

-- Coast Banksia
minetest.register_node("australia:coast_banksia_tree", {
	description = "Coast Banksia Tree",
	tiles = {
		"aus_coast_banksia_tree_top.png",
		"aus_coast_banksia_tree_top.png",
		"aus_coast_banksia_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-6/16, -8/16, -6/16, 6/16, 8/16, 6/16},
	},
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -8/16, -6/16, 6/16, 8/16, 6/16},
	},
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:coast_banksia_leaves", {
	description = "Coast Banksia Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_coast_banksia_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:coast_banksia_sapling"}, rarity = 20,},
			{items = {"australia:coast_banksia_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:coast_banksia_sapling", {
	description = "Coast Banksia Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_banksia_sapling.png"},
	inventory_image = "aus_banksia_sapling.png",
	wield_image = "aus_banksia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:coast_banksia_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 18, z = 5},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Coolabah
minetest.register_node("australia:coolabah_tree", {
	description = "Coolabah Tree",
	tiles = {
		"aus_coolabah_tree_top.png",
		"aus_coolabah_tree_top.png",
		"aus_coolabah_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:coolabah_leaves", {
	description = "Coolabah Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_coolabah_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:coolabah_sapling"}, rarity = 20,},
			{items = {"australia:coolabah_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:coolabah_sapling", {
	description = "Coolabah Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_eucalyptus_sapling.png"},
	inventory_image = "aus_eucalyptus_sapling.png",
	wield_image = "aus_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:blue_gum_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 15, z = 5},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Daintree Stringybark
minetest.register_node("australia:daintree_stringybark_tree", {
	description = "Daintree Stringybark Tree",
	tiles = {
		"aus_daintree_stringybark_tree_top.png",
		"aus_daintree_stringybark_tree_top.png",
		"aus_daintree_stringybark_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:daintree_stringybark_leaves", {
	description = "Daintree Stringybark Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_daintree_stringybark_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:daintree_stringybark_sapling"}, rarity = 20,},
			{items = {"australia:daintree_stringybark_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:daintree_stringybark_sapling", {
	description = "Daintree Stringybark Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_eucalyptus_sapling.png"},
	inventory_image = "aus_eucalyptus_sapling.png",
	wield_image = "aus_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:blue_gum_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -9, y = 1, z = -9},
			{x = 9, y = 31, z = 9},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Darwin Woollybutt
minetest.register_node("australia:darwin_woollybutt_tree", {
	description = "Darwin Woollybutt Tree",
	tiles = {
		"aus_darwin_woollybutt_tree_top.png",
		"aus_darwin_woollybutt_tree_top.png",
		"aus_darwin_woollybutt_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:darwin_woollybutt_leaves", {
	description = "Darwin Woollybutt Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_darwin_woollybutt_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:darwin_woollybutt_sapling"}, rarity = 20,},
			{items = {"australia:darwin_woollybutt_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:darwin_woollybutt_sapling", {
	description = "Darwin Woollybutt Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_eucalyptus_sapling.png"},
	inventory_image = "aus_eucalyptus_sapling.png",
	wield_image = "aus_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:blue_gum_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 18, z = 5},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Desert Oak
minetest.register_node("australia:desert_oak_tree", {
	description = "Desert Oak Tree",
	tiles = {
		"aus_desert_oak_tree_top.png",
		"aus_desert_oak_tree_top.png",
		"aus_desert_oak_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:desert_oak_leaves", {
	description = "Desert Oak Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_desert_oak_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:desert_oak_sapling"}, rarity = 20,},
			{items = {"australia:desert_oak_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:desert_oak_sapling", {
	description = "Desert Oak Sapling",
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
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:desert_oak_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 12, z = 4},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Australian Fan Palm
minetest.register_node("australia:fan_palm_tree", {
	description = "Australian Fan Palm Tree",
	tiles = {
		"aus_fan_palm_tree_top.png",
		"aus_fan_palm_tree_top.png",
		"aus_fan_palm_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-5/32, -8/16, -5/32, 5/32, 8/16, 5/32},
	},
	selection_box = {
		type = "fixed",
		fixed = {-5/32, -8/16, -5/32, 5/32, 8/16, 5/32},
	},
	drop = 'default:stick 4',
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:fan_palm_leaves", {
	description = "Australian Fan Palm Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_fan_palm_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 2, leafdecay = 5, flammable = 1, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:fan_palm_sapling"}, rarity = 20,},
			{items = {"australia:fan_palm_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:fan_palm_sapling", {
	description = "Australian Fan Palm Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_palm_sapling.png"},
	inventory_image = "aus_palm_sapling.png",
	wield_image = "aus_palm_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 1, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:fan_palm_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 10, z = 3},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Flame Grevillea
minetest.register_node("australia:flame_grevillea_tree", {
	description = "Flame Grevillea Tree",
	tiles = {
		"aus_flame_grevillea_tree_top.png",
		"aus_flame_grevillea_tree_top.png",
		"aus_flame_grevillea_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-5/32, -8/16, -5/32, 5/32, 8/16, 5/32},
	},
	selection_box = {
		type = "fixed",
		fixed = {-5/32, -8/16, -5/32, 5/32, 8/16, 5/32},
	},
	drop = 'default:stick 4',
	groups = {tree = 1, snappy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:flame_grevillea_leaves", {
	description = "Flame Grevillea Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_flame_grevillea_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:flame_grevillea_sapling"}, rarity = 20,},
			{items = {"australia:flame_grevillea_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
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
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:flame_grevillea_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 6, z = 3},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Golden Wattle
minetest.register_node("australia:golden_wattle_tree", {
	description = "Golden Wattle Tree",
	tiles = {
		"aus_golden_wattle_tree_top.png",
		"aus_golden_wattle_tree_top.png",
		"aus_golden_wattle_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-5/32, -8/16, -5/32, 5/32, 8/16, 5/32},
	},
	selection_box = {
		type = "fixed",
		fixed = {-5/32, -8/16, -5/32, 5/32, 8/16, 5/32},
	},
	drop = 'default:stick 4',
	groups = {tree = 1, choppy = 3, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:golden_wattle_leaves", {
	description = "Golden Wattle Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_golden_wattle_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:golden_wattle_sapling"}, rarity = 20,},
			{items = {"australia:golden_wattle_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:golden_wattle_sapling", {
	description = "Golden Wattle Sapling",
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
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:golden_wattle_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 6, z = 2},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Grey Mangrove
minetest.register_node("australia:grey_mangrove_tree", {
	description = "Grey Mangrove Tree",
	tiles = {
		"aus_grey_mangrove_tree_top.png",
		"aus_grey_mangrove_tree_top.png",
		"aus_grey_mangrove_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-3/32, -8/16, -3/32, 3/32, 8/16, 3/32},
	},
	selection_box = {
		type = "fixed",
		fixed = {-3/32, -8/16, -3/32, 3/32, 8/16, 3/32},
	},
	drop = 'default:stick 4',
	groups = {tree = 1, choppy = 3, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:grey_mangrove_leaves", {
	description = "Grey Mangrove Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_grey_mangrove_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:grey_mangrove_sapling"}, rarity = 20,},
			{items = {"australia:grey_mangrove_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:grey_mangrove_sapling", {
	description = "Grey Mangrove Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_mangrove_sapling.png"},
	inventory_image = "aus_mangrove_sapling.png",
	wield_image = "aus_mangrove_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:grey_mangrove_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 5, z = 2},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Huon Pine
minetest.register_node("australia:huon_pine_tree", {
	description = "Huon Pine Tree",
	tiles = {
		"aus_huon_pine_tree_top.png",
		"aus_huon_pine_tree_top.png",
		"aus_huon_pine_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:huon_pine_leaves", {
	description = "Huon Pine Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_huon_pine_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:huon_pine_sapling"}, rarity = 20,},
			{items = {"australia:huon_pine_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:huon_pine_sapling", {
	description = "Huon Pine Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_pine_sapling.png"},
	inventory_image = "default_pine_sapling.png",
	wield_image = "default_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:huon_pine_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -6, y = 1, z = -6},
			{x = 6, y = 19, z = 6},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Illawarra Flame
minetest.register_node("australia:illawarra_flame_tree", {
	description = "Illawarra Flame Tree",
	tiles = {
		"aus_illawarra_flame_tree_top.png",
		"aus_illawarra_flame_tree_top.png",
		"aus_illawarra_flame_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:illawarra_flame_leaves", {
	description = "Illawarra Flame Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_illawarra_flame_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:illawarra_flame_sapling"}, rarity = 20,},
			{items = {"australia:illawarra_flame_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:illawarra_flame_sapling", {
	description = "Illawarra Flame Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_illawarra_flame_sapling.png"},
	inventory_image = "aus_illawarra_flame_sapling.png",
	wield_image = "aus_illawarra_flame_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:illawarra_flame_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -7, y = 1, z = -7},
			{x = 7, y = 18, z = 7},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Jarrah
minetest.register_node("australia:jarrah_tree", {
	description = "Jarrah Tree",
	tiles = {
		"aus_jarrah_tree_top.png",
		"aus_jarrah_tree_top.png",
		"aus_jarrah_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 1, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:jarrah_leaves", {
	description = "Jarrah Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_jarrah_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:jarrah_sapling"}, rarity = 20,},
			{items = {"australia:jarrah_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:jarrah_sapling", {
	description = "Jarrah Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_eucalyptus_sapling.png"},
	inventory_image = "aus_eucalyptus_sapling.png",
	wield_image = "aus_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:jarrah_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -10, y = 1, z = -10},
			{x = 10, y = 30, z = 10},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Karri
minetest.register_node("australia:karri_tree", {
	description = "Karri Tree",
	tiles = {
		"aus_karri_tree_top.png",
		"aus_karri_tree_top.png",
		"aus_karri_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 1, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:karri_leaves", {
	description = "Karri Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_karri_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:karri_sapling"}, rarity = 20,},
			{items = {"australia:karri_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:karri_sapling", {
	description = "Karri Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_eucalyptus_sapling.png"},
	inventory_image = "aus_eucalyptus_sapling.png",
	wield_image = "aus_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:karri_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -10, y = 1, z = -10},
			{x = 10, y = 40, z = 10},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Lemon Eucalyptus
minetest.register_node("australia:lemon_eucalyptus_tree", {
	description = "Lemon Eucalyptus Tree",
	tiles = {
		"aus_lemon_eucalyptus_tree_top.png",
		"aus_lemon_eucalyptus_tree_top.png",
		"aus_lemon_eucalyptus_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:lemon_eucalyptus_leaves", {
	description = "Lemon Eucalyptus Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_lemon_eucalyptus_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:lemon_eucalyptus_sapling"}, rarity = 20,},
			{items = {"australia:lemon_eucalyptus_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:lemon_eucalyptus_sapling", {
	description = "Lemon Eucalyptus Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_eucalyptus_sapling.png"},
	inventory_image = "aus_eucalyptus_sapling.png",
	wield_image = "aus_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:lemon_eucalyptus_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -6, y = 1, z = -6},
			{x = 6, y = 24, z = 6},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Lemon Myrtle
minetest.register_node("australia:lemon_myrtle_tree", {
	description = "Lemon Myrtle Tree",
	tiles = {
		"aus_lemon_myrtle_tree_top.png",
		"aus_lemon_myrtle_tree_top.png",
		"aus_lemon_myrtle_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, 8/16, 4/16},
	},
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, 8/16, 4/16},
	},
	drop = 'default:stick 4',
	groups = {tree = 1, choppy = 3, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:lemon_myrtle_leaves", {
	description = "Lemon Myrtle Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_lemon_myrtle_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:lemon_myrtle_sapling"}, rarity = 20,},
			{items = {"australia:lemon_myrtle_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:lemon_myrtle_sapling", {
	description = "Lemon Myrtle Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_myrtle_sapling.png"},
	inventory_image = "aus_myrtle_sapling.png",
	wield_image = "aus_myrtle_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:lemon_myrtle_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 8, z = 3},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Lilly Pilly
minetest.register_node("australia:lilly_pilly_tree", {
	description = "Lilly Pilly Tree",
	tiles = {
		"aus_lilly_pilly_tree_top.png",
		"aus_lilly_pilly_tree_top.png",
		"aus_lilly_pilly_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, 8/16, 4/16},
	},
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, 8/16, 4/16},
	},
	drop = 'default:stick 4',
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:lilly_pilly_leaves", {
	description = "Lilly Pilly Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_lilly_pilly_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:lilly_pilly_sapling"}, rarity = 20,},
			{items = {"australia:lilly_pilly_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:lilly_pilly_sapling", {
	description = "Lilly Pilly Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_berry_sapling.png"},
	inventory_image = "aus_berry_sapling.png",
	wield_image = "aus_berry_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:lilly_pilly_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -6, y = 1, z = -6},
			{x = 6, y = 12, z = 6},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

minetest.register_node("australia:lilly_pilly_berries", {
	description = "Lilly Pilly Berries",
	drawtype = "plantlike",
	visual_scale = 0.67,
	tiles = {"aus_lilly_pilly_berries.png"},
	inventory_image = "aus_lilly_pilly_berries.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3/32, -8/16, -3/32, 3/32, -4/16, 3/32},
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2, leafdecay = 5, leafdecay_drop = 1},
	on_use = minetest.item_eat(1),
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "australia:lilly_pilly_berries", param2 = 1})
		end
	end,
})

-- Macadamia
minetest.register_node("australia:macadamia_tree", {
	description = "Macadamia Tree",
	tiles = {
		"aus_macadamia_tree_top.png",
		"aus_macadamia_tree_top.png",
		"aus_macadamia_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-6/16, -8/16, -6/16, 6/16, 8/16, 6/16},
	},
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -8/16, -6/16, 6/16, 8/16, 6/16},
	},
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:macadamia_leaves", {
	description = "Prickly Macadamia Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_macadamia_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:macadamia_sapling"}, rarity = 20,},
			{items = {"australia:macadamia_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:macadamia_sapling", {
	description = "Prickly Macadamia Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_macadamia_sapling.png"},
	inventory_image = "aus_macadamia_sapling.png",
	wield_image = "aus_macadamia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:macadamia_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 12, z = 4},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

minetest.register_node("australia:macadamia", {
	description = "Macadamia Nuts",
	drawtype = "plantlike",
	visual_scale = 0.67,
	tiles = {"aus_macadamia.png"},
	inventory_image = "aus_macadamia.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3/32, -8/16, -3/32, 3/32, -4/16, 3/32},
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2, leafdecay = 5, leafdecay_drop = 1},
	on_use = minetest.item_eat(1),
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "australia:macadamia", param2 = 1})
		end
	end,
})

-- Mangrove Apple
minetest.register_node("australia:mangrove_apple_tree", {
	description = "Mangrove Apple Tree",
	tiles = {
		"aus_mangrove_apple_tree_top.png",
		"aus_mangrove_apple_tree_top.png",
		"aus_mangrove_apple_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, 8/16, 4/16},
	},
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, 8/16, 4/16},
	},
	drop = 'default:stick 4',
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:mangrove_apple_leaves", {
	description = "Mangrove Apple Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_mangrove_apple_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:mangrove_apple_sapling"}, rarity = 20,},
			{items = {"australia:mangrove_apple_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:mangrove_apple_sapling", {
	description = "Mangrove Apple Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_mangrove_apple_sapling.png"},
	inventory_image = "aus_mangrove_apple_sapling.png",
	wield_image = "aus_mangrove_apple_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:mangrove_apple_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 12, z = 4},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

minetest.register_node("australia:mangrove_apple", {
	description = "Mangrove Apple",
	drawtype = "plantlike",
	visual_scale = 0.67,
	tiles = {"aus_mangrove_apple.png"},
	inventory_image = "aus_mangrove_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3/32, -8/16, -3/32, 3/32, -4/16, 3/32},
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2, leafdecay = 5, leafdecay_drop = 1},
	on_use = minetest.item_eat(1),
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "australia:mangrove_apple", param2 = 1})
		end
	end,
})

-- Marri
minetest.register_node("australia:marri_tree", {
	description = "Marri Tree",
	tiles = {
		"aus_marri_tree_top.png",
		"aus_marri_tree_top.png",
		"aus_marri_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 1, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:marri_leaves", {
	description = "Marri Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_marri_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:marri_sapling"}, rarity = 20,},
			{items = {"australia:marri_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:marri_sapling", {
	description = "Marri Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_eucalyptus_sapling.png"},
	inventory_image = "aus_eucalyptus_sapling.png",
	wield_image = "aus_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:marri_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -10, y = 1, z = -10},
			{x = 10, y = 30, z = 10},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Merbau
minetest.register_node("australia:merbau_tree", {
	description = "Merbau Tree",
	tiles = {
		"aus_merbau_tree_top.png",
		"aus_merbau_tree_top.png",
		"aus_merbau_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:merbau_leaves", {
	description = "Merbau Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_merbau_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:merbau_sapling"}, rarity = 20,},
			{items = {"australia:merbau_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:merbau_sapling", {
	description = "Merbau Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_merbau_sapling.png"},
	inventory_image = "aus_merbau_sapling.png",
	wield_image = "aus_merbau_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:merbau_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 23, z = 5},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Moreton Bay Fig
minetest.register_node("australia:moreton_bay_fig_tree", {
	description = "Moreton Bay Fig Tree",
	tiles = {
		"aus_moreton_bay_fig_tree_top.png",
		"aus_moreton_bay_fig_tree_top.png",
		"aus_moreton_bay_fig_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:moreton_bay_fig_leaves", {
	description = "Moreton Bay Fig Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_moreton_bay_fig_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:moreton_bay_fig_sapling"}, rarity = 20,},
			{items = {"australia:moreton_bay_fig_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:moreton_bay_fig_sapling", {
	description = "Moreton Bay Fig Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_fig_sapling.png"},
	inventory_image = "aus_fig_sapling.png",
	wield_image = "aus_fig_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:mangrove_apple_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -15, y = 1, z = -15},
			{x = 15, y = 35, z = 15},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

minetest.register_node("australia:moreton_bay_fig", {
	description = "Moreton Bay Fig",
	drawtype = "plantlike",
	visual_scale = 0.67,
	tiles = {"aus_moreton_bay_fig.png"},
	inventory_image = "aus_moreton_bay_fig.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3/32, -8/16, -3/32, 3/32, -4/16, 3/32},
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2, leafdecay = 5, leafdecay_drop = 1},
	on_use = minetest.item_eat(1),
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "australia:moreton_bay_fig", param2 = 1})
		end
	end,
})

-- Mulga Tree
minetest.register_node("australia:mulga_tree", {
	description = "Mulga Tree",
	tiles = {
		"aus_mulga_tree_top.png",
		"aus_mulga_tree_top.png",
		"aus_mulga_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, 8/16, 4/16},
	},
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, 8/16, 4/16},
	},
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:mulga_leaves", {
	description = "Mulga Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_mulga_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:mulga_sapling"}, rarity = 20,},
			{items = {"australia:mulga_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:mulga_sapling", {
	description = "Mulga Sapling",
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
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:mulga_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 10, z = 3},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Paper Bark
minetest.register_node("australia:paperbark_tree", {
	description = "Paper Bark Tree",
	tiles = {
		"aus_paperbark_tree_top.png",
		"aus_paperbark_tree_top.png",
		"aus_paperbark_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:paperbark_leaves", {
	description = "Paper Bark Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_paperbark_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:paperbark_sapling"}, rarity = 20,},
			{items = {"australia:paperbark_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:paperbark_sapling", {
	description = "Paper Bark Sapling",
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
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:paperbark_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 15, z = 5},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Desert Quandong
minetest.register_node("australia:quandong_tree", {
	description = "Desert Quandong Tree",
	tiles = {
		"aus_quandong_tree_top.png",
		"aus_quandong_tree_top.png",
		"aus_quandong_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-5/32, -8/16, -5/32, 5/32, 8/16, 5/32},
	},
	selection_box = {
		type = "fixed",
		fixed = {-5/32, -8/16, -5/32, 5/32, 8/16, 5/32},
	},
	drop = 'default:stick 4',
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:quandong_leaves", {
	description = "Desert Quandong Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_quandong_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:quandong_sapling"}, rarity = 20,},
			{items = {"australia:quandong_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:quandong_sapling", {
	description = "Desert Quandong Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_quandong_sapling.png"},
	inventory_image = "aus_quandong_sapling.png",
	wield_image = "aus_quandong_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:quandong_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 5, z = 2},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

minetest.register_node("australia:quandong", {
	description = "Desert Quandong",
	drawtype = "plantlike",
	visual_scale = 8/16,
	tiles = {"aus_quandong.png"},
	inventory_image = "aus_quandong.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3/32, -8/16, -3/32, 3/32, -4/16, 3/32},
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2, leafdecay = 5, leafdecay_drop = 1},
	on_use = minetest.item_eat(1),
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "australia:quandong", param2 = 1})
		end
	end,
})

-- Red Bottlebrush
minetest.register_node("australia:red_bottlebrush_tree", {
	description = "Red Bottlebrush Tree",
	tiles = {
		"aus_red_bottlebrush_tree_top.png",
		"aus_red_bottlebrush_tree_top.png",
		"aus_red_bottlebrush_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-5/32, -8/16, -5/32, 5/32, 8/16, 5/32},
	},
	selection_box = {
		type = "fixed",
		fixed = {-5/32, -8/16, -5/32, 5/32, 8/16, 5/32},
	},
	drop = 'default:stick 4',
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:red_bottlebrush_leaves", {
	description = "Red Bottlebrush Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_red_bottlebrush_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:red_bottlebrush_sapling"}, rarity = 20,},
			{items = {"australia:red_bottlebrush_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
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
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:red_bottlebrush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 6, z = 3},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- River Oak
minetest.register_node("australia:river_oak_tree", {
	description = "River Oak Tree",
	tiles = {
		"aus_river_oak_tree_top.png",
		"aus_river_oak_tree_top.png",
		"aus_river_oak_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:river_oak_leaves", {
	description = "River Oak Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_river_oak_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:river_oak_sapling"}, rarity = 20,},
			{items = {"australia:river_oak_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:river_oak_sapling", {
	description = "River Oak Sapling",
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
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:river_oak_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 20, z = 5},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- River Red Gum
minetest.register_node("australia:river_red_gum_tree", {
	description = "River Red Gum Tree",
	tiles = {
		"aus_river_red_gum_tree_top.png",
		"aus_river_red_gum_tree_top.png",
		"aus_river_red_gum_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 1,flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:river_red_gum_leaves", {
	description = "River Red Gum Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_river_red_gum_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:river_red_gum_sapling"}, rarity = 20,},
			{items = {"australia:river_red_gum_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:river_red_gum_sapling", {
	description = "River Red Gum Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_eucalyptus_sapling.png"},
	inventory_image = "aus_eucalyptus_sapling.png",
	wield_image = "aus_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:river_red_gum_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -8, y = 1, z = -8},
			{x = 8, y = 26, z = 8},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Rottnest Island Pine
minetest.register_node("australia:rottnest_island_pine_tree", {
	description = "Rottnest Island Pine Tree",
	tiles = {
		"aus_rottnest_island_pine_tree_top.png",
		"aus_rottnest_island_pine_tree_top.png",
		"aus_rottnest_island_pine_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-6/16, -8/16, -6/16, 6/16, 8/16, 6/16},
	},
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -8/16, -6/16, 6/16, 8/16, 6/16},
	},
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:rottnest_island_pine_leaves", {
	description = "Rottnest Island Pine Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_rottnest_island_pine_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:rottnest_island_pine_sapling"}, rarity = 20,},
			{items = {"australia:rottnest_island_pine_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:rottnest_island_pine_sapling", {
	description = "Rottnest Island Pine Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_pine_sapling.png"},
	inventory_image = "default_pine_sapling.png",
	wield_image = "default_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:rottnest_island_pine_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 6, z = 3},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Scribbly Gum
minetest.register_node("australia:scribbly_gum_tree", {
	description = "Scribbly Gum Tree",
	tiles = {
		"aus_scribbly_gum_tree_top.png",
		"aus_scribbly_gum_tree_top.png",
		"aus_scribbly_gum_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:scribbly_gum_leaves", {
	description = "Scribbly Gum Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_scribbly_gum_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:scribbly_gum_sapling"}, rarity = 20,},
			{items = {"australia:scribbly_gum_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:scribbly_gum_sapling", {
	description = "Scribbly Gum Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_eucalyptus_sapling.png"},
	inventory_image = "aus_eucalyptus_sapling.png",
	wield_image = "aus_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:scribbly_gum_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 13, z = 5},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Shoestring Acacia
minetest.register_node("australia:shoestring_acacia_tree", {
	description = "Shoestring Acacia Tree",
	tiles = {
		"aus_shoestring_acacia_tree_top.png",
		"aus_shoestring_acacia_tree_top.png",
		"aus_shoestring_acacia_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:shoestring_acacia_leaves", {
	description = "Shoestring Acacia Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_shoestring_acacia_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:shoestring_acacia_sapling"}, rarity = 20,},
			{items = {"australia:shoestring_acacia_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:shoestring_acacia_sapling", {
	description = "Shoestring Acacia Sapling",
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
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:shoestring_acacia_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 9, z = 4},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Snow Gum
minetest.register_node("australia:snow_gum_tree", {
	description = "Snow Gum Tree",
	tiles = {
		"aus_snow_gum_tree_top.png",
		"aus_snow_gum_tree_top.png",
		"aus_snow_gum_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, 8/16, 4/16},
	},
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, 8/16, 4/16},
	},
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:snow_gum_leaves", {
	description = "Snow Gum Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_snow_gum_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:snow_gum_sapling"}, rarity = 20,},
			{items = {"australia:snow_gum_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:snow_gum_sapling", {
	description = "Snow Gum Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_eucalyptus_sapling.png"},
	inventory_image = "aus_eucalyptus_sapling.png",
	wield_image = "aus_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:snow_gum_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 8, z = 2},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Southern Sassafras
minetest.register_node("australia:southern_sassafras_tree", {
	description = "Southern Sassafras Tree",
	tiles = {
		"aus_southern_sassafras_tree_top.png",
		"aus_southern_sassafras_tree_top.png",
		"aus_southern_sassafras_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-6/16, -8/16, -6/16, 6/16, 8/16, 6/16},
	},
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -8/16, -6/16, 6/16, 8/16, 6/16},
	},
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:southern_sassafras_leaves", {
	description = "Southern Sassafras Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_southern_sassafras_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:southern_sassafras_sapling"}, rarity = 20,},
			{items = {"australia:southern_sassafras_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:southern_sassafras_sapling", {
	description = "Southern Sassafras Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_pine_sapling.png"},
	inventory_image = "default_pine_sapling.png",
	wield_image = "default_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:southern_sassafras_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 15, z = 4},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Stilted Mangrove
minetest.register_node("australia:stilted_mangrove_tree", {
	description = "Stilted Mangrove Tree",
	tiles = {
		"aus_stilted_mangrove_tree_top.png",
		"aus_stilted_mangrove_tree_top.png",
		"aus_stilted_mangrove_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-3/32, -8/16, -3/32, 3/32, 8/16, 3/32},
	},
	selection_box = {
		type = "fixed",
		fixed = {-3/32, -8/16, -3/32, 3/32, 8/16, 3/32},
	},
	drop = 'default:stick 4',
	groups = {tree = 1, choppy = 3, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:stilted_mangrove_leaves", {
	description = "Stilted Mangrove Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_stilted_mangrove_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:stilted_mangrove_sapling"}, rarity = 20,},
			{items = {"australia:stilted_mangrove_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:stilted_mangrove_sapling", {
	description = "Stilted Mangrove Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_mangrove_sapling.png"},
	inventory_image = "aus_mangrove_sapling.png",
	wield_image = "aus_mangrove_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:stilted_mangrove_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 9, z = 3},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Sugar Gum
minetest.register_node("australia:sugar_gum_tree", {
	description = "Sugar Gum Tree",
	tiles = {
		"aus_sugar_gum_tree_top.png",
		"aus_sugar_gum_tree_top.png",
		"aus_sugar_gum_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:sugar_gum_leaves", {
	description = "Sugar Gum Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_sugar_gum_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:sugar_gum_sapling"}, rarity = 20,},
			{items = {"australia:sugar_gum_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:sugar_gum_sapling", {
	description = "Sugar Gum Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_eucalyptus_sapling.png"},
	inventory_image = "aus_eucalyptus_sapling.png",
	wield_image = "aus_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:sugar_gum_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -10, y = 1, z = -10},
			{x = 10, y = 23, z = 10},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Swamp Bloodwood
minetest.register_node("australia:swamp_bloodwood_tree", {
	description = "Swamp Bloodwood Tree",
	tiles = {
		"aus_swamp_bloodwood_tree_top.png",
		"aus_swamp_bloodwood_tree_top.png",
		"aus_swamp_bloodwood_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:swamp_bloodwood_leaves", {
	description = "Swamp Bloodwood Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_swamp_bloodwood_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:swamp_bloodwood_sapling"}, rarity = 20,},
			{items = {"australia:swamp_bloodwood_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:swamp_bloodwood_sapling", {
	description = "Swamp Bloodwood Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_eucalyptus_sapling.png"},
	inventory_image = "aus_eucalyptus_sapling.png",
	wield_image = "aus_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:swamp_bloodwood_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 12, z = 4},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Swamp Gum
minetest.register_node("australia:swamp_gum_tree", {
	description = "Swamp Gum Tree",
	tiles = {
		"aus_swamp_gum_tree_top.png",
		"aus_swamp_gum_tree_top.png",
		"aus_swamp_gum_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 1, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:swamp_gum_leaves", {
	description = "Swamp Gum Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_swamp_gum_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:swamp_gum_sapling"}, rarity = 20,},
			{items = {"australia:swamp_gum_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:swamp_gum_sapling", {
	description = "Swamp Gum Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_eucalyptus_sapling.png"},
	inventory_image = "aus_eucalyptus_sapling.png",
	wield_image = "aus_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:swamp_gum_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -10, y = 1, z = -10},
			{x = 10, y = 52, z = 10},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Swamp Paperbark
minetest.register_node("australia:swamp_paperbark_tree", {
	description = "Swamp Paperbark Tree",
	tiles = {
		"aus_swamp_paperbark_tree_top.png",
		"aus_swamp_paperbark_tree_top.png",
		"aus_swamp_paperbark_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, 8/16, 4/16},
	},
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, 8/16, 4/16},
	},
	drop = 'default:stick 4',
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:swamp_paperbark_leaves", {
	description = "Swamp Paperbark Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_swamp_paperbark_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:swamp_paperbark_sapling"}, rarity = 20,},
			{items = {"australia:swamp_paperbark_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:swamp_paperbark_sapling", {
	description = "Swamp Paperbark Sapling",
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
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:swamp_paperbark_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 6, z = 2},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Tasmanian Myrtle
minetest.register_node("australia:tasmanian_myrtle_tree", {
	description = "Tasmanian Myrtle Tree",
	tiles = {
		"aus_tasmanian_myrtle_tree_top.png",
		"aus_tasmanian_myrtle_tree_top.png",
		"aus_tasmanian_myrtle_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:tasmanian_myrtle_leaves", {
	description = "Tasmanian Myrtle Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_tasmanian_myrtle_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:tasmanian_myrtle_sapling"}, rarity = 20,},
			{items = {"australia:tasmanian_myrtle_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:tasmanian_myrtle_sapling", {
	description = "Tasmanian Myrtle Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_myrtle_sapling.png"},
	inventory_image = "aus_myrtle_sapling.png",
	wield_image = "aus_myrtle_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:tasmanian_myrtle_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -9, y = 1, z = -9},
			{x = 9, y = 29, z = 9},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Tea Tree
minetest.register_node("australia:tea_tree_tree", {
	description = "Tea Tree",
	tiles = {
		"aus_tea_tree_tree_top.png",
		"aus_tea_tree_tree_top.png",
		"aus_tea_tree_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, 8/16, 4/16},
	},
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, 8/16, 4/16},
	},
	drop = 'default:stick 4',
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:tea_tree_leaves", {
	description = "Tea Tree Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_tea_tree_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:tea_tree_sapling"}, rarity = 20,},
			{items = {"australia:tea_tree_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:tea_tree_sapling", {
	description = "Tea Tree Sapling",
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
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:tea_tree_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 7, z = 3},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- White Box
minetest.register_node("australia:white_box_tree", {
	description = "White Box Tree",
	tiles = {
		"aus_white_box_tree_top.png",
		"aus_white_box_tree_top.png",
		"aus_white_box_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:white_box_leaves", {
	description = "White Box Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_white_box_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:white_box_sapling"}, rarity = 20,},
			{items = {"australia:white_box_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:white_box_sapling", {
	description = "White Box Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_eucalyptus_sapling.png"},
	inventory_image = "aus_eucalyptus_sapling.png",
	wield_image = "aus_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = aus.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:white_box_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -8, y = 1, z = -8},
			{x = 8, y = 20, z = 8},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

-- Wirewood
minetest.register_node("australia:wirewood_tree", {
	description = "Wirewood Tree",
	tiles = {
		"aus_wirewood_tree_top.png",
		"aus_wirewood_tree_top.png",
		"aus_wirewood_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-5/32, -8/16, -5/32, 5/32, 8/16, 5/32},
	},
	selection_box = {
		type = "fixed",
		fixed = {-5/32, -8/16, -5/32, 5/32, 8/16, 5/32},
	},
	drop = 'default:stick 4',
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:wirewood_leaves", {
	description = "Wirewood Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_wirewood_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:wirewood_sapling"}, rarity = 20,},
			{items = {"australia:wirewood_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:wirewood_sapling", {
	description = "Wirewood Sapling",
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
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"australia:wirewood_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 10, z = 2},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})


--[[
	Wood Planks
--]]

minetest.register_node("australia:eucalyptus_wood", {
	description = "Eucalyptus Wood Planks",
	tiles = {"aus_eucalyptus_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("australia:blackwood", {
	description = "Blackwood Planks",
	tiles = {"aus_blackwood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("australia:blue_gum", {
	description = "Blue Gum Planks",
	tiles = {"aus_blue_gum.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("australia:celery_top_pine", {
	description = "Celery-top Pine Planks",
	tiles = {"aus_celery_top_pine.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("australia:red_mahogany", {
	description = "Red Mahogany Planks",
	tiles = {"aus_red_mahogany.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("australia:huon_pine", {
	description = "Huon Pine Planks",
	tiles = {"aus_huon_pine.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("australia:jarrah", {
	description = "Jarrah Planks",
	tiles = {"aus_jarrah.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("australia:karri", {
	description = "Karri Planks",
	tiles = {"aus_karri.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("australia:marri", {
	description = "Marri Planks",
	tiles = {"aus_marri.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("australia:merbau", {
	description = "Merbau Planks",
	tiles = {"aus_merbau.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("australia:red_gum", {
	description = "Red Gum Planks",
	tiles = {"aus_red_gum.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("australia:southern_sassafras", {
	description = "Southern Sassafras Planks",
	tiles = {"aus_southern_sassafras.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("australia:tasmanian_oak", {
	description = "Tasmanian Oak Planks",
	tiles = {"aus_tasmanian_oak.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("australia:tasmanian_myrtle", {
	description = "Tasmanian Myrtle Planks",
	tiles = {"aus_tasmanian_myrtle.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})


--[[
	Fences
--]]

default.register_fence("australia:fence_eucalyptus_wood", {
	description = "Eucalyptus Wood Fence",
	texture = "aus_eucalyptus_wood.png",
	material = "australia:eucalyptus_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("australia:fence_blackwood", {
	description = "Blackwood Fence",
	texture = "aus_blackwood.png",
	material = "australia:blackwood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("australia:fence_blue_gum", {
	description = "Blue Gum Fence",
	texture = "aus_blue_gum.png",
	material = "australia:bluegum",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("australia:fence_celery_top_pine", {
	description = "Celery-top Pine Fence",
	texture = "aus_celery_top_pine.png",
	material = "australia:celery_top_pine",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("australia:fence_red_mahogany", {
	description = "Red Mahogany Fence",
	texture = "aus_red_mahogany.png",
	material = "australia:red_mahogany",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("australia:fence_huon_pine", {
	description = "Huon Pine Fence",
	texture = "aus_huon_pine.png",
	material = "australia:huon_pine",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("australia:fence_jarrah", {
	description = "Jarrah Fence",
	texture = "aus_jarrah.png",
	material = "australia:jarrah",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("australia:fence_karri", {
	description = "Karri Fence",
	texture = "aus_karri.png",
	material = "australia:karri",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("australia:fence_marri", {
	description = "Marri Fence",
	texture = "aus_marri.png",
	material = "australia:marri",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("australia:fence_merbau", {
	description = "Merbau Fence",
	texture = "aus_merbau.png",
	material = "australia:merbau",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("australia:fence_red_gum", {
	description = "Red Gum Fence",
	texture = "aus_red_gum.png",
	material = "australia:red_gum",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("australia:fence_southern_sassafras", {
	description = "Southern Sassafras Fence",
	texture = "aus_southern_sassafras.png",
	material = "australia:southern_sassafras",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("australia:fence_tasmanian_oak", {
	description = "Tasmanian Oak Fence",
	texture = "aus_tasmanian_oak.png",
	material = "australia:tasmanian_oak",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("australia:fence_tasmanian_myrtle", {
	description = "Tasmanian Myrtle Fence",
	texture = "aus_tasmanian_myrtle.png",
	material = "australia:tasmanian_myrtle",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})
