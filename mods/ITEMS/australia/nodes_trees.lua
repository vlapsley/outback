--[[
	Tree nodes
--]]


aus.schematics = {}

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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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

-- Palm Tree
minetest.register_node("australia:palm_tree", {
	description = "Palm Tree",
	tiles = {
		"aus_palm_tree_top.png",
		"aus_palm_tree_top.png",
		"aus_palm_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("australia:palm_leaves", {
	description = "Palm Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_palm_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"australia:palm_sapling"}, rarity = 20,},
			{items = {"australia:palm_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("australia:palm_sapling", {
	description = "Palm Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"aus_palm_sapling.png"},
	inventory_image = "aus_palm_sapling.png",
	wield_image = "aus_palm_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
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
			"australia:palm_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 15, z = 5},
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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
	on_timer = default.grow_sapling,
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


-- Localize math routines for performance.
local math_abs = math.abs
local math_ceil = math.ceil
local math_floor = math.floor
local math_max = math.max
local math_random = math.random
local math_sqrt = math.sqrt

-- Create and initialize a table for a schematic.
function aus.schematic_array(width, height, depth)
	-- Dimensions of data array.
	local s = {size = {x = width, y = height, z = depth}}
	s.data = {}

	for z = 0, depth - 1 do
		for y = 0, height - 1 do
			for x = 0, width - 1 do
				local i = z * width * height + y * width + x + 1
				s.data[i] = {}
				s.data[i].name = "air"
				s.data[i].param1 = 000
			end
		end
	end

	s.yslice_prob = {}

	return s
end

-- Make a tree trunk 2-nodes wide.
local function make_treetrunk2(x0, y0, z0, data, area, height, trunk, air, base)
	local ystride = area.ystride
	local ybot = y0 - 1
	for x = x0, x0 + 1 do
		for y = 1,height do
			for z = z0, z0 + 1 do -- iterate in a 2x2 square around the trunk
				local iv = area:index(x, ybot, z)
				for i = 0, height + 1 do
					if data[iv] == air then -- find the ground level
						if math_random() < base then
							data[iv-ystride] = trunk -- make tree trunk below
							if math_random() < base then
								data[iv] = trunk -- make tree trunk at this air node
							end
						end
						break
					end
					iv = iv + ystride -- increment by one node up
				end
			end
		end
	end
end

-- Make a tree trunk 3-nodes wide.
local function make_treetrunk3(x0, y0, z0, data, area, height, trunk, air, base)
	local ystride = area.ystride
	local ybot = y0 - 1
	for x = x0 - 1, x0 + 1 do
		for y = 1, height do
			for z = z0 - 1, z0 + 1 do -- iterate in a 3x3 square around the trunk
				local iv = area:index(x, ybot, z)
				for i = 0, height + 1 do
					if data[iv] == air then -- find the ground level
						if math_random() < base then
							data[iv-ystride] = trunk -- make tree trunk below
							if math_random() < base then
								data[iv] = trunk -- make tree trunk at this air node
							end
						end
						break
					end
					iv = iv + ystride -- increment by one node up
				end
			end
		end
	end
end


-- Make leaves on a tree in a noise blob.
function aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore, radius, np, limbs, fruit_chance, fruit)
	limbs = limbs
	fruit_chance = fruit_chance or 0
	np.seed = math_random(0, 16777215) -- noise seed
	local minp = vector.subtract(pos, radius) -- minimal corner of the leavesblob
	local maxp = vector.add(pos, radius) -- maximal corner of the leavesblob
	 -- Same positions, but with integer coordinates
	local int_minp = {x = math_floor(minp.x), y = math_floor(minp.y), z = math_floor(minp.z)}
	local int_maxp = {x = math_ceil(maxp.x), y = math_ceil(maxp.y), z = math_ceil(maxp.z)}

	local length = vector.subtract(int_maxp, int_minp)
	local chulens = vector.add(length, 1)
	local obj = minetest.get_perlin_map(np, chulens)
	local pmap = obj:get3dMap_flat(minp)
	local i = 1
	-- iterate for every position
	-- calculate the distance from the center by the Pythagorean theorem: d = sqrt(x²+y²+z²)
	for x = int_minp.x, int_maxp.x do
		-- calculate x², y², z² separately, to avoid recalculating x² for every
		-- y or z iteration. Divided by the radius to scale it to 0…1
		local xval = ((x - pos.x) / radius.x) ^ 2
		for y = int_minp.y, int_maxp.y do
			local yval = ((y - pos.y) / radius.y) ^ 2
			for z = int_minp.z, int_maxp.z do
				local zval = ((z - pos.z) / radius.z) ^ 2
				local dist = math_sqrt(xval + yval + zval) -- Calculate the distance
				local nval = pmap[i] -- Get the noise value
				if nval > dist then -- if the noise is bigger than the distance, make leaves
					local iv = area:index(x, y, z)
					if data[iv] == air or data[iv] == ignore then
						 -- make some branches within the leaf structure
						if nval > dist * 1.5 and limbs and math_random(5) == 1 then
							data[iv] = trunk
						-- if a fruit tree add fruit
						elseif math_random() < fruit_chance then
							data[iv] = fruit
						else
							data[iv] = leaves
						end
					end
				end
				i = i + 1 -- increment noise index
			end
		end
	end
end


-- Generic bush function.
function aus.make_bush(pos, data, area, height, radius, stem, leaves, air,
		ignore)
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = stem
		iv = iv + ystride -- increment by one node up
	end
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, stem, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np)
end

-- Generic tree function.
function aus.make_tree(pos, data, area, height, radius, trunk, leaves, air,
		ignore, limbs, fruit_chance, fruit)
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height - 1
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np, limbs, fruit_chance, fruit)
end

function aus.make_black_box(pos, data, area, height, radius, trunk, leaves,
		air, ignore, limbs, fruit)
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk2(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.5)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height - 1
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius * 0.8, z = radius}, np, limbs)
end

function aus.make_black_wattle(pos, data, area, height, radius, trunk, leaves,
		air, ignore, limbs, fruit)
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height - 1
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius * 1.5, z = radius}, np, limbs)
end

function aus.make_tall_gum(pos, data, area, height, radius, trunk, leaves, air,
		ignore, limbs, fruit)
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk2(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.2)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height - 1
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius * 1.25, z = radius}, np, limbs)
end

function aus.make_boab(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	local ystride = area.ystride -- Useful to get the index above
	local width = 0.8
	local ybot = pos.y - 1
	for x = pos.x - 1, pos.x + 1 do
		for y = 1, height do
			for z = pos.z - 1, pos.z + 1 do -- iterate in a 3x3 square around the trunk
				local iv = area:index(x, ybot, z)
				for i = 0, height + 1 do
					if data[iv] == air then -- find the ground level
						if math_random() < width then
							data[iv-ystride] = trunk -- make tree trunk below
							if math_random() < width then
								data[iv] = trunk -- make tree trunk at this air node
							end
						end
						break
					end
					iv = iv + ystride -- increment by one node up
				end
			end
		end
	end
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height - 1
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius * 0.5, z = radius}, np, limbs)
end

function aus.make_conifer(pos, data, area, height, radius, trunk, leaves, air,
		ignore, limbs, fruit_chance, fruit)
	local x, y, z = pos.x, pos.y, pos.z
	fruit_chance = fruit_chance or 0
	-- Trunk
	for y_dist = 0, height - 1 do
		local iv = area:index(x, y + y_dist, z)
		if y_dist == 0 or data[iv] == air or data[iv] == leaves then
			data[iv] = trunk
		end
	end
	-- Add rings of leaves randomly
	local d = 0
	for yi = height + 1, 2 + math_random(0, 1), -1 do
		for xi = -d, d do
			for zi = -d, d do
				if math_abs(xi) + math_abs(zi) <= d or math_abs(zi) + math_abs(xi) <= d then
					local iv = area:index(x + xi, y + yi, z + zi)
					if data[iv] == air or data[iv] == ignore then
						if math_random() < fruit_chance then
							data[iv] = fruit
						else
							data[iv] = leaves
						end
					end
				end
			end
		end
	d = d + 1
	if d > math_random(2,4) then d = 1 end
	end
end

function aus.make_fan_palm(pos, data, area, height, radius, trunk, leaves, air, ignore)
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius * 0.5, z = radius}, np)
end

function aus.make_jarrah(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk2(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.8)
	make_treetrunk3(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.4)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np, limbs)
end

function aus.make_karri(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk3(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.8)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np, limbs)
end

function aus.make_mangrove(pos, data, area, height, radius, trunk, leaves, air, ignore)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius * 0.5, z = radius}, np)
	for z_dist = -1, 1 do
		local vi_1 = area:index(x - 1, y - 1, z + z_dist)
		local vi_2 = area:index(x - 1, y, z + z_dist)
		local vi_3 = area:index(x - 1, y + 1, z + z_dist)
		for x_dist = -1, 1 do
			if math_random(1, 3) >= 2 then
				if data[vi_1] == air or data[vi_1] == ignore then
					data[vi_1] = trunk
				elseif data[vi_2] == air or data[vi_2] == ignore then
					data[vi_2] = trunk
				elseif data[vi_3] == air or data[vi_3] == ignore then
					data[vi_3] = trunk
				end
			end
			vi_1 = vi_1 + 1
			vi_2 = vi_2 + 1
		end
	end
end

-- Mangrove trees use schematic placement because the vocelmanipulator cannot place nodes under sea level.
function aus.generate_mangrove_tree_schematic(trunk_height, trunk, leaf)
	local height = trunk_height * 2 + 1
	local radius = 2
	local width = 2 * radius + 1
	local trunk_top = height - 3
	local s = aus.schematic_array(width, height, width)

	-- roots, trunk, and extra leaves
	for z = -1, 1 do
		for y = 1, trunk_top do
			for x = -1, 1 do
				local i = (z + radius) * width * height + y * width + (x + radius) + 1
				if x == 0 and z == 0 then
					s.data[i].name = trunk
					s.data[i].param1 = 255
					s.data[i].force_place = true
				elseif (x == 0 or z == 0) and y < 3 then
					s.data[i].name = trunk
					s.data[i].param1 = 255
					s.data[i].force_place = true
				elseif y > 3 then
					s.data[i].name = leaf
					s.data[i].param1 = 50
				end
			end
		end
	end

	-- canopy
	for y = 1, trunk_top + 2 do
		if y > trunk_height and (y == trunk_top or math_random(1, height - y) == 1) then
			local x, z = 0, 0
			while x == 0 and z == 0 do
				x = math_random(-1, 1) * 2
				z = math_random(-1, 1) * 2
			end
			for j = -1, 1, 2 do
				aus.generate_canopy(s, leaf, {x = j * x, y = y, z = j * z})
			end
		end
	end
	return s
end

-- Create a canopy of leaves.
function aus.generate_canopy(s, leaf, pos)
	local height = s.size.y
	local width = s.size.x
	local rx = math_floor(s.size.x / 2)
	local rz = math_floor(s.size.z / 2)
	local r1 = 4  -- leaf decay radius
	local probs = {255, 200, 150, 100, 75}

	for z = -r1, r1 do
		for y = 0, 1 do
			for x = -r1, r1 do
				if x+pos.x >= -rx and x + pos.x <= rx and y + pos.y >= 0 and
						y + pos.y < height and z + pos.z >= -rz and z + pos.z <= rz then
					local i = (z + pos.z + rz) * width * height + (y + pos.y) * width + (x + pos.x + rx) + 1
					local dist1 = math_sqrt(x^2 + y^2 + z^2)
					local dist2 = math_sqrt((x+pos.x)^2 + (z+pos.z)^2)
					if dist1 <= r1 then
						local newprob = probs[math_max(1, math_ceil(dist1))]
						if s.data[i].name == "air" then
							s.data[i].name = leaf
							s.data[i].param1 = newprob
						elseif s.data[i].name == leaf then
							s.data[i].param1 = math_max(s.data[i].param1, newprob)
						end
					end
				end
			end
		end
	end
end

function aus.make_marri(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk2(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.6)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np, limbs)
end

function aus.make_merbau(pos, data, area, height, radius, trunk, leaves, air, ignore)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk3(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.2)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius * 0.5, z = radius}, np)
end

function aus.make_moreton_bay_fig(pos, data, area, height, radius, trunk,
		leaves, air, ignore, limbs, fruit_chance, fruit)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk2(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.7)
	make_treetrunk3(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.3)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np, limbs, fruit_chance, fruit)
end

function aus.make_river_red_gum(pos, data, area, height, radius, trunk, leaves,
		air, ignore, limbs)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk2(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.7)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np, limbs)
end

function aus.make_swamp_gum(pos, data, area, height, radius, trunk, leaves,
		air, ignore, limbs)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk2(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.8)
	make_treetrunk3(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.5)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8},
			octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius * 0.8, y = radius * 1.2, z = radius * 0.8}, np, limbs)
end

function aus.make_tasmanian_myrtle(pos, data, area, height, radius, trunk,
		leaves, air, ignore, limbs)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk2(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.6)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np, limbs)
end


function aus.grow_arnhem_cypress_pine(pos)
	-- individual parameters
	local height = math_random(8, 12)
	local radius = 4
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:arnhem_cypress_pine_tree")
	local leaves = minetest.get_content_id("australia:arnhem_cypress_pine_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 4, y = pos.y, z = pos.z - 4},
		{x = pos.x + 4, y = pos.y + height + 2, z = pos.z + 4}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_conifer(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_black_box(pos)
	-- individual parameters
	local height = math_random(5, 9)
	local radius = math_random(4, 6)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:black_box_tree")
	local leaves = minetest.get_content_id("australia:black_box_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 6, y = pos.y, z = pos.z - 6},
		{x = pos.x + 6, y = pos.y + height + 6, z = pos.z + 6}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_black_box(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_black_wattle(pos)
	-- individual parameters
	local height = math_random(5, 7)
	local radius = 3
	local limbs = false
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:black_wattle_tree")
	local leaves = minetest.get_content_id("australia:black_wattle_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 3, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_black_wattle(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_blue_gum(pos)
	-- individual parameters
	local height = math_random(10, 18)
	local radius = math_random(5, 6)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:blue_gum_tree")
	local leaves = minetest.get_content_id("australia:blue_gum_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 7, y = pos.y, z = pos.z - 7},
		{x = pos.x + 7, y = pos.y + height + 9, z = pos.z + 7}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tall_gum(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_boab(pos)
	-- individual parameters
	local height = math_random(5, 6)
	local radius = math_random(4, 5)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:boab_tree")
	local leaves = minetest.get_content_id("australia:boab_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 5, y = pos.y, z = pos.z - 5},
		{x = pos.x + 5, y = pos.y + height + 3, z = pos.z + 5}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_boab(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_bull_banksia(pos)
	-- individual parameters
	local height = math_random(3, 5)
	local radius = math_random(2, 3)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:bull_banksia_tree")
	local leaves = minetest.get_content_id("australia:bull_banksia_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 3, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_celery_top_pine(pos)
	-- individual parameters
	local height = math_random(7, 9)
	local radius = math_random(3, 4)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:celery_top_pine_tree")
	local leaves = minetest.get_content_id("australia:celery_top_pine_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 4, y = pos.y, z = pos.z - 4},
		{x = pos.x + 4, y = pos.y + height + 2, z = pos.z + 4}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_conifer(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_cherry(pos)
	-- individual parameters
	local height = math_random(3, 4)
	local radius = 3
	local limbs = nil
	local fruit_chance = 0.2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:cherry_tree")
	local leaves = minetest.get_content_id("australia:cherry_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local fruit = minetest.get_content_id("australia:cherry")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 2, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_conifer(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs, fruit_chance, fruit)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_coast_banksia(pos)
	-- individual parameters
	local height = math_random(7, 12)
	local radius = math_random(4, 5)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:coast_banksia_tree")
	local leaves = minetest.get_content_id("australia:coast_banksia_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 5, y = pos.y, z = pos.z - 5},
		{x = pos.x + 5, y = pos.y + height + 5, z = pos.z + 5}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_coolabah(pos)
	-- individual parameters
	local height = math_random(7, 9)
	local radius = math_random(4, 5)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:coolabah_tree")
	local leaves = minetest.get_content_id("australia:coolabah_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 5, y = pos.y, z = pos.z - 5},
		{x = pos.x + 5, y = pos.y + height + 5, z = pos.z + 5}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_daintree_stringybark(pos)
	-- individual parameters
	local height = math_random(12, 16)
	local radius = math_random(6, 8)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:daintree_stringybark_tree")
	local leaves = minetest.get_content_id("australia:daintree_stringybark_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 9, y = pos.y, z = pos.z - 9},
		{x = pos.x + 9, y = pos.y + height + 11, z = pos.z + 9}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tall_gum(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_darwin_woollybutt(pos)
	-- individual parameters
	local height = math_random(7, 12)
	local radius = math_random(4, 5)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:darwin_woollybutt_tree")
	local leaves = minetest.get_content_id("australia:darwin_woollybutt_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 5, y = pos.y, z = pos.z - 5},
		{x = pos.x + 5, y = pos.y + height + 5, z = pos.z + 5}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_desert_oak(pos)
	-- individual parameters
	local height = math_random(4, 8)
	local radius = math_random(2, 4)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:desert_oak_tree")
	local leaves = minetest.get_content_id("australia:desert_oak_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 4, y = pos.y, z = pos.z - 4},
		{x = pos.x + 4, y = pos.y + height + 4, z = pos.z + 4}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_fan_palm(pos)
	-- individual parameters
	local height = math_random(5, 7)
	local radius = 3
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:fan_palm_tree")
	local leaves = minetest.get_content_id("australia:fan_palm_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y - 1, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 2, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_fan_palm(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_flame_grevillea(pos)
	-- individual parameters
	local height = 1
	local radius = math_random(2, 3)
	-- voxelmanip stuff
	local stem = minetest.get_content_id("australia:acacia_bush_stem")
	local leaves = minetest.get_content_id("australia:flame_grevillea_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 3, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_bush(pos, data, area, height, radius, stem, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_golden_wattle(pos)
	-- individual parameters
	local height = math_random(3, 4)
	local radius = 2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:golden_wattle_tree")
	local leaves = minetest.get_content_id("australia:golden_wattle_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 2, z = pos.z + 2}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_grey_mangrove(pos)
	-- individual parameters
	local height = math_random(3, 4)
	local radius = 2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:grey_mangrove_tree")
	local leaves = minetest.get_content_id("australia:grey_mangrove_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 1, z = pos.z + 2}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_mangrove(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_huon_pine(pos)
	-- individual parameters
	local height = math_random(7, 12)
	local radius = math_random(5, 6)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:huon_pine_tree")
	local leaves = minetest.get_content_id("australia:huon_pine_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 6, y = pos.y, z = pos.z - 6},
		{x = pos.x + 6, y = pos.y + height + 6, z = pos.z + 6}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_illawarra_flame(pos)
	-- individual parameters
	local height = math_random(8, 10)
	local radius = math_random(5, 6)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:illawarra_flame_tree")
	local leaves = minetest.get_content_id("australia:illawarra_flame_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 7, y = pos.y, z = pos.z - 7},
		{x = pos.x + 7, y = pos.y + height + 7, z = pos.z + 7}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_jarrah(pos)
	-- individual parameters
	local height = math_random(12, 16)
	local radius = math_random(7, 8)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:jarrah_tree")
	local leaves = minetest.get_content_id("australia:jarrah_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 10, y = pos.y, z = pos.z - 10},
		{x = pos.x + 10, y = pos.y + height + 10, z = pos.z + 10}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_jarrah(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_karri(pos)
	-- individual parameters
	local height = math_random(15, 20)
	local radius = math_random(7, 8)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:karri_tree")
	local leaves = minetest.get_content_id("australia:karri_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 10, y = pos.y, z = pos.z - 10},
		{x = pos.x + 10, y = pos.y + height + 10, z = pos.z + 10}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_karri(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_lemon_eucalyptus(pos)
	-- individual parameters
	local height = math_random(10, 15)
	local radius = math_random(4, 5)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:lemon_eucalyptus_tree")
	local leaves = minetest.get_content_id("australia:lemon_eucalyptus_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 6, y = pos.y, z = pos.z - 6},
		{x = pos.x + 6, y = pos.y + height + 6, z = pos.z + 6}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_lemon_myrtle(pos)
	-- individual parameters
	local height = math_random(3, 5)
	local radius = math_random(2, 3)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:lemon_myrtle_tree")
	local leaves = minetest.get_content_id("australia:lemon_myrtle_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 3, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_lilly_pilly(pos)
	-- individual parameters
	local height = math_random(3, 5)
	local radius = math_random(3, 5)
	local limbs = nil
	local fruit_chance = 0.3
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:lilly_pilly_tree")
	local leaves = minetest.get_content_id("australia:lilly_pilly_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local fruit = minetest.get_content_id("australia:lilly_pilly_berries")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 6, y = pos.y, z = pos.z - 6},
		{x = pos.x + 6, y = pos.y + height + 6, z = pos.z + 6}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs, fruit_chance, fruit)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_macadamia(pos)
	-- individual parameters
	local height = math_random(5, 7)
	local radius = math_random(3, 4)
	local limbs = nil
	local fruit_chance = 0.3
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:macadamia_tree")
	local leaves = minetest.get_content_id("australia:macadamia_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local fruit = minetest.get_content_id("australia:macadamia")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 4, y = pos.y, z = pos.z - 4},
		{x = pos.x + 4, y = pos.y + height + 4, z = pos.z + 4}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs, fruit_chance, fruit)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_mangrove_apple(pos)
	-- individual parameters
	local height = math_random(6, 8)
	local radius = math_random(3, 4)
	local limbs = nil
	local fruit_chance = 0.2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:mangrove_apple_tree")
	local leaves = minetest.get_content_id("australia:mangrove_apple_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local fruit = minetest.get_content_id("australia:mangrove_apple")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 4, y = pos.y, z = pos.z - 4},
		{x = pos.x + 4, y = pos.y + height + 4, z = pos.z + 4}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs, fruit_chance, fruit)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_marri(pos)
	-- individual parameters
	local height = math_random(12, 16)
	local radius = math_random(6, 8)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:marri_tree")
	local leaves = minetest.get_content_id("australia:marri_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 10, y = pos.y, z = pos.z - 10},
		{x = pos.x + 10, y = pos.y + height + 10, z = pos.z + 10}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_marri(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_merbau(pos)
	-- individual parameters
	local height = math_random(12, 16)
	local radius = math_random(4, 5)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:merbau_tree")
	local leaves = minetest.get_content_id("australia:merbau_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 5, y = pos.y - 1, z = pos.z - 5},
		{x = pos.x + 5, y = pos.y + height + 3, z = pos.z + 5}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_merbau(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_moreton_bay_fig(pos)
	-- individual parameters
	local height = math_random(12, 16)
	local radius = math_random(10, 12)
	local limbs = true
	local fruit_chance = 0.2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:moreton_bay_fig_tree")
	local leaves = minetest.get_content_id("australia:moreton_bay_fig_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local fruit = minetest.get_content_id("australia:moreton_bay_fig")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 15, y = pos.y, z = pos.z - 15},
		{x = pos.x + 15, y = pos.y + height + 15, z = pos.z + 15}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_moreton_bay_fig(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs, fruit_chance, fruit)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_mulga(pos)
	-- individual parameters
	local height = math_random(4, 6)
	local radius = math_random(2, 3)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:mulga_tree")
	local leaves = minetest.get_content_id("australia:mulga_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 3, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_paperbark(pos)
	-- individual parameters
	local height = math_random(5, 8)
	local radius = math_random(3, 4)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:paperbark_tree")
	local leaves = minetest.get_content_id("australia:paperbark_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 5, y = pos.y, z = pos.z - 5},
		{x = pos.x + 5, y = pos.y + height + 5, z = pos.z + 5}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_quandong(pos)
	-- individual parameters
	local height = math_random(2, 3)
	local radius = 2
	local limbs = nil
	local fruit_chance = 0.2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:quandong_tree")
	local leaves = minetest.get_content_id("australia:quandong_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local fruit = minetest.get_content_id("australia:quandong")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 2, z = pos.z + 2}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs, fruit_chance, fruit)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_red_bottlebrush(pos)
	-- individual parameters
	local height = 1
	local radius = math_random(2, 3)
	-- voxelmanip stuff
	local stem = minetest.get_content_id("australia:bush_stem")
	local leaves = minetest.get_content_id("australia:red_bottlebrush_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 3, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_bush(pos, data, area, height, radius, stem, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_river_oak(pos)
	-- individual parameters
	local height = math_random(10, 12)
	local radius = math_random(3, 4)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:river_oak_tree")
	local leaves = minetest.get_content_id("australia:river_oak_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 5, y = pos.y, z = pos.z - 5},
		{x = pos.x + 5, y = pos.y + height + 5, z = pos.z + 5}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_river_red_gum(pos)
	-- individual parameters
	local height = math_random(10, 15)
	local radius = math_random(5, 7)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:river_red_gum_tree")
	local leaves = minetest.get_content_id("australia:river_red_gum_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 8, y = pos.y, z = pos.z - 8},
		{x = pos.x + 8, y = pos.y + height + 8, z = pos.z + 8}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_river_red_gum(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_rottnest_island_pine(pos)
	-- individual parameters
	local height = math_random(3, 4)
	local radius = 3
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:rottnest_island_pine_tree")
	local leaves = minetest.get_content_id("australia:rottnest_island_pine_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 2, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_conifer(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_scribbly_gum(pos)
	-- individual parameters
	local height = math_random(5, 7)
	local radius = math_random(3, 4)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:scribbly_gum_tree")
	local leaves = minetest.get_content_id("australia:scribbly_gum_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 5, y = pos.y, z = pos.z - 5},
		{x = pos.x + 5, y = pos.y + height + 5, z = pos.z + 5}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_shoestring_acacia(pos)
	-- individual parameters
	local height = math_random(3, 5)
	local radius = math_random(3, 4)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:shoestring_acacia_tree")
	local leaves = minetest.get_content_id("australia:shoestring_acacia_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 4, y = pos.y, z = pos.z - 4},
		{x = pos.x + 4, y = pos.y + height + 4, z = pos.z + 4}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_snow_gum(pos)
	-- individual parameters
	local height = math_random(2, 4)
	local radius = 2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:snow_gum_tree")
	local leaves = minetest.get_content_id("australia:snow_gum_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 4, z = pos.z + 2}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_southern_sassafras(pos)
	-- individual parameters
	local height = math_random(7, 12)
	local radius = math_random(5, 7)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:southern_sassafras_tree")
	local leaves = minetest.get_content_id("australia:southern_sassafras_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 4, y = pos.y, z = pos.z - 4},
		{x = pos.x + 4, y = pos.y + height + 2, z = pos.z + 4}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_conifer(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_stilted_mangrove(pos)
	-- individual parameters
	local height = math_random(4, 7)
	local radius = math_random(2, 3)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:stilted_mangrove_tree")
	local leaves = minetest.get_content_id("australia:stilted_mangrove_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y - 1, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 2, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_mangrove(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_sugar_gum(pos)
	-- individual parameters
	local height = math_random(7, 11)
	local radius = math_random(6, 8)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:sugar_gum_tree")
	local leaves = minetest.get_content_id("australia:sugar_gum_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 10, y = pos.y, z = pos.z - 10},
		{x = pos.x + 10, y = pos.y + height + 10, z = pos.z + 10}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_swamp_bloodwood(pos)
	-- individual parameters
	local height = math_random(5, 7)
	local radius = math_random(3, 4)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:swamp_bloodwood_tree")
	local leaves = minetest.get_content_id("australia:swamp_bloodwood_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 4, y = pos.y, z = pos.z - 4},
		{x = pos.x + 4, y = pos.y + height + 4, z = pos.z + 4}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_swamp_gum(pos)
	-- individual parameters
	local height = math_random(20, 30)
	local radius = math_random(7, 9)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:swamp_gum_tree")
	local leaves = minetest.get_content_id("australia:swamp_gum_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 10, y = pos.y, z = pos.z - 10},
		{x = pos.x + 10, y = pos.y + height + 12, z = pos.z + 10}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_swamp_gum(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_swamp_paperbark(pos)
	-- individual parameters
	local height = math_random(3, 4)
	local radius = 2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:swamp_paperbark_tree")
	local leaves = minetest.get_content_id("australia:swamp_paperbark_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 2, z = pos.z + 2}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_tasmanian_myrtle(pos)
	-- individual parameters
	local height = math_random(12, 15)
	local radius = math_random(5, 7)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:tasmanian_myrtle_tree")
	local leaves = minetest.get_content_id("australia:tasmanian_myrtle_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 9, y = pos.y - 1, z = pos.z - 9},
		{x = pos.x + 9, y = pos.y + height + 9, z = pos.z + 9}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tasmanian_myrtle(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_tea_tree(pos)
	-- individual parameters
	local height = math_random(3, 4)
	local radius = math_random(2, 3)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:tea_tree_tree")
	local leaves = minetest.get_content_id("australia:tea_tree_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 3, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_waratah(pos)
	-- individual parameters
	local height = 1
	local radius = math_random(1, 2)
	-- voxelmanip stuff
	local stem = minetest.get_content_id("australia:bush_stem")
	local leaves = minetest.get_content_id("australia:waratah_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 2, z = pos.z + 2}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_bush(pos, data, area, height, radius, stem, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_white_box(pos)
	-- individual parameters
	local height = math_random(6, 10)
	local radius = math_random(5, 7)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:white_box_tree")
	local leaves = minetest.get_content_id("australia:white_box_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 8, y = pos.y, z = pos.z - 8},
		{x = pos.x + 8, y = pos.y + height + 8, z = pos.z + 8}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

function aus.grow_wirewood(pos)
	-- individual parameters
	local height = math_random(5, 7)
	local radius = 2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:wirewood_tree")
	local leaves = minetest.get_content_id("australia:wirewood_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 2, z = pos.z + 2}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end


aus.palm_model={
	axiom="FFcccccc&FFFFFdddRA//A//A//A//A//A",
	rules_a="[&fb&bbb[++f--&ffff&ff][--f++&ffff&ff]&ffff&bbbb&b]",
	rules_b="f",
	rules_c="/",
	rules_d="F",
	trunk="australia:palm_tree",
	leaves="australia:palm_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="single",
	thin_branches=true,
	fruit="australia:palm_tree",
	fruit_chance=0
}

