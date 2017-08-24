--[[
	Base tree nodes
--]]


minetest.register_node("base:tree", {
	description = "Tree",
	tiles = {"base_tree_top.png", "base_tree_top.png", "base_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = base.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("base:wood", {
	description = "Wooden Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"base_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:sapling", {
	description = "Sapling",
	drawtype = "plantlike",
	tiles = {"base_sapling.png"},
	inventory_image = "base_sapling.png",
	wield_image = "base_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 6, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

minetest.register_node("base:leaves", {
	description = "Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"base_leaves.png"},
	special_tiles = {"base_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {'base:sapling'},
				rarity = 20,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'base:leaves'},
			}
		}
	},
	sounds = base.node_sound_leaves_defaults(),

	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:apple", {
	description = "Apple",
	drawtype = "plantlike",
	tiles = {"base_apple.png"},
	inventory_image = "base_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = base.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "base:apple", param2 = 1})
		end
	end,
})


minetest.register_node("base:jungletree", {
	description = "Jungle Tree",
	tiles = {"base_jungletree_top.png", "base_jungletree_top.png",
		"base_jungletree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = base.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("base:junglewood", {
	description = "Jungle Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"base_junglewood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:jungleleaves", {
	description = "Jungle Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"base_jungleleaves.png"},
	special_tiles = {"base_jungleleaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {'base:junglesapling'}, rarity = 20},
			{items = {'base:jungleleaves'}}
		}
	},
	sounds = base.node_sound_leaves_defaults(),

	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:junglesapling", {
	description = "Jungle Sapling",
	drawtype = "plantlike",
	tiles = {"base_junglesapling.png"},
	inventory_image = "base_junglesapling.png",
	wield_image = "base_junglesapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:junglesapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 15, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})


minetest.register_node("base:pine_tree", {
	description = "Pine Tree",
	tiles = {"base_pine_tree_top.png", "base_pine_tree_top.png",
		"base_pine_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = base.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("base:pine_wood", {
	description = "Pine Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"base_pine_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:pine_needles",{
	description = "Pine Needles",
	drawtype = "allfaces_optional",
	tiles = {"base_pine_needles.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:pine_sapling"}, rarity = 20},
			{items = {"base:pine_needles"}}
		}
	},
	sounds = base.node_sound_leaves_defaults(),

	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:pine_sapling", {
	description = "Pine Sapling",
	drawtype = "plantlike",
	tiles = {"base_pine_sapling.png"},
	inventory_image = "base_pine_sapling.png",
	wield_image = "base_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:pine_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 12, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})


minetest.register_node("base:acacia_tree", {
	description = "Acacia Tree",
	tiles = {"base_acacia_tree_top.png", "base_acacia_tree_top.png",
		"base_acacia_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = base.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("base:acacia_wood", {
	description = "Acacia Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"base_acacia_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:acacia_leaves", {
	description = "Acacia Leaves",
	drawtype = "allfaces_optional",
	tiles = {"base_acacia_leaves.png"},
	special_tiles = {"base_acacia_leaves_simple.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:acacia_sapling"}, rarity = 20},
			{items = {"base:acacia_leaves"}}
		}
	},
	sounds = base.node_sound_leaves_defaults(),

	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:acacia_sapling", {
	description = "Acacia Tree Sapling",
	drawtype = "plantlike",
	tiles = {"base_acacia_sapling.png"},
	inventory_image = "base_acacia_sapling.png",
	wield_image = "base_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:acacia_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 6, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

minetest.register_node("base:aspen_tree", {
	description = "Aspen Tree",
	tiles = {"base_aspen_tree_top.png", "base_aspen_tree_top.png",
		"base_aspen_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = base.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("base:aspen_wood", {
	description = "Aspen Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"base_aspen_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:aspen_leaves", {
	description = "Aspen Leaves",
	drawtype = "allfaces_optional",
	tiles = {"base_aspen_leaves.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:aspen_sapling"}, rarity = 20},
			{items = {"base:aspen_leaves"}}
		}
	},
	sounds = base.node_sound_leaves_defaults(),

	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:aspen_sapling", {
	description = "Aspen Tree Sapling",
	drawtype = "plantlike",
	tiles = {"base_aspen_sapling.png"},
	inventory_image = "base_aspen_sapling.png",
	wield_image = "base_aspen_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 0.5, 3 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:aspen_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 12, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})


-- Arnhem Cypress Pine
minetest.register_node("base:arnhem_cypress_pine_tree", {
	description = "Arnhem Cypress Pine Tree",
	tiles = {
		"base_arnhem_cypress_pine_tree_top.png",
		"base_arnhem_cypress_pine_tree_top.png",
		"base_arnhem_cypress_pine_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:arnhem_cypress_pine_leaves", {
	description = "Arnhem Cypress Pine Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_arnhem_cypress_pine_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:arnhem_cypress_pine_sapling"}, rarity = 20,},
			{items = {"base:arnhem_cypress_pine_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:arnhem_cypress_pine_sapling", {
	description = "Arnhem Cypress Pine Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_pine_sapling.png"},
	inventory_image = "base_pine_sapling.png",
	wield_image = "base_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:arnhem_cypress_pine_sapling",
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
minetest.register_node("base:black_box_tree", {
	description = "Black Box Tree",
	tiles = {
		"base_black_box_tree_top.png",
		"base_black_box_tree_top.png",
		"base_black_box_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:black_box_leaves", {
	description = "Black Box Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_black_box_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:black_box_sapling"}, rarity = 20,},
			{items = {"base:black_box_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:black_box_sapling", {
	description = "Black Box Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_eucalyptus_sapling.png"},
	inventory_image = "base_eucalyptus_sapling.png",
	wield_image = "base_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:black_box_sapling",
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
minetest.register_node("base:black_wattle_tree", {
	description = "Black Wattle Tree",
	tiles = {
		"base_black_wattle_tree_top.png",
		"base_black_wattle_tree_top.png",
		"base_black_wattle_tree.png"
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
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:black_wattle_leaves", {
	description = "Black Wattle Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_black_wattle_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:black_wattle_sapling"}, rarity = 20,},
			{items = {"base:black_wattle_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:black_wattle_sapling", {
	description = "Black Wattle Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_acacia_sapling.png"},
	inventory_image = "base_acacia_sapling.png",
	wield_image = "base_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:black_wattle_sapling",
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
minetest.register_node("base:blue_gum_tree", {
	description = "Blue Gum Tree",
	tiles = {
		"base_blue_gum_tree_top.png",
		"base_blue_gum_tree_top.png",
		"base_blue_gum_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:blue_gum_leaves", {
	description = "Blue Gum Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_blue_gum_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:blue_gum_sapling"}, rarity = 20,},
			{items = {"base:blue_gum_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:blue_gum_sapling", {
	description = "Blue Gum Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_eucalyptus_sapling.png"},
	inventory_image = "base_eucalyptus_sapling.png",
	wield_image = "base_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:blue_gum_sapling",
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
minetest.register_node("base:boab_tree", {
	description = "Boab Tree",
	tiles = {
		"base_boab_tree_top.png",
		"base_boab_tree_top.png",
		"base_boab_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:boab_leaves", {
	description = "Boab Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_boab_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:boab_sapling"}, rarity = 20,},
			{items = {"base:boab_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:boab_sapling", {
	description = "Boab Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_boab_sapling.png"},
	inventory_image = "base_boab_sapling.png",
	wield_image = "base_boab_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:boab_sapling",
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
minetest.register_node("base:bull_banksia_tree", {
	description = "Bull Banksia Tree",
	tiles = {
		"base_bull_banksia_tree_top.png",
		"base_bull_banksia_tree_top.png",
		"base_bull_banksia_tree.png"
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
	drop = 'base:stick 4',
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:bull_banksia_leaves", {
	description = "Bull Banksia Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_bull_banksia_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:bull_banksia_sapling"}, rarity = 20,},
			{items = {"base:bull_banksia_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:bull_banksia_sapling", {
	description = "Bull Banksia Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_banksia_sapling.png"},
	inventory_image = "base_banksia_sapling.png",
	wield_image = "base_banksia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:bull_banksia_sapling",
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
minetest.register_node("base:celery_top_pine_tree", {
	description = "Celery-top Pine Tree",
	tiles = {
		"base_celery_top_pine_tree_top.png",
		"base_celery_top_pine_tree_top.png",
		"base_celery_top_pine_tree.png"
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
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:celery_top_pine_leaves", {
	description = "Celery-top Pine Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_celery_top_pine_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:celery_top_pine_sapling"}, rarity = 20,},
			{items = {"base:celery_top_pine_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:celery_top_pine_sapling", {
	description = "Celery-top Pine Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_pine_sapling.png"},
	inventory_image = "base_pine_sapling.png",
	wield_image = "base_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:celery_top_pine_sapling",
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
minetest.register_node("base:cherry_tree", {
	description = "Australian Cherry Tree",
	tiles = {
		"base_cherry_tree_top.png",
		"base_cherry_tree_top.png",
		"base_cherry_tree.png"
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
	drop = 'base:stick 4',
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:cherry_leaves", {
	description = "Australian Cherry Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_cherry_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:cherry_sapling"}, rarity = 20,},
			{items = {"base:cherry_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:cherry_sapling", {
	description = "Australian Cherry Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_berry_sapling.png"},
	inventory_image = "base_berry_sapling.png",
	wield_image = "base_berry_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:cherry_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 6, z = 3},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

minetest.register_node("base:cherry", {
	description = "Australian Cherries",
	drawtype = "plantlike",
	visual_scale = 8/16,
	tiles = {"base_cherry.png"},
	inventory_image = "base_cherry.png",
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
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "base:cherry", param2 = 1})
		end
	end,
})

-- Coast Banksia
minetest.register_node("base:coast_banksia_tree", {
	description = "Coast Banksia Tree",
	tiles = {
		"base_coast_banksia_tree_top.png",
		"base_coast_banksia_tree_top.png",
		"base_coast_banksia_tree.png"
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
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:coast_banksia_leaves", {
	description = "Coast Banksia Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_coast_banksia_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:coast_banksia_sapling"}, rarity = 20,},
			{items = {"base:coast_banksia_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:coast_banksia_sapling", {
	description = "Coast Banksia Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_banksia_sapling.png"},
	inventory_image = "base_banksia_sapling.png",
	wield_image = "base_banksia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:coast_banksia_sapling",
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
minetest.register_node("base:coolabah_tree", {
	description = "Coolabah Tree",
	tiles = {
		"base_coolabah_tree_top.png",
		"base_coolabah_tree_top.png",
		"base_coolabah_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:coolabah_leaves", {
	description = "Coolabah Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_coolabah_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:coolabah_sapling"}, rarity = 20,},
			{items = {"base:coolabah_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:coolabah_sapling", {
	description = "Coolabah Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_eucalyptus_sapling.png"},
	inventory_image = "base_eucalyptus_sapling.png",
	wield_image = "base_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:blue_gum_sapling",
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
minetest.register_node("base:daintree_stringybark_tree", {
	description = "Daintree Stringybark Tree",
	tiles = {
		"base_daintree_stringybark_tree_top.png",
		"base_daintree_stringybark_tree_top.png",
		"base_daintree_stringybark_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:daintree_stringybark_leaves", {
	description = "Daintree Stringybark Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_daintree_stringybark_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:daintree_stringybark_sapling"}, rarity = 20,},
			{items = {"base:daintree_stringybark_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:daintree_stringybark_sapling", {
	description = "Daintree Stringybark Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_eucalyptus_sapling.png"},
	inventory_image = "base_eucalyptus_sapling.png",
	wield_image = "base_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:blue_gum_sapling",
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
minetest.register_node("base:darwin_woollybutt_tree", {
	description = "Darwin Woollybutt Tree",
	tiles = {
		"base_darwin_woollybutt_tree_top.png",
		"base_darwin_woollybutt_tree_top.png",
		"base_darwin_woollybutt_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:darwin_woollybutt_leaves", {
	description = "Darwin Woollybutt Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_darwin_woollybutt_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:darwin_woollybutt_sapling"}, rarity = 20,},
			{items = {"base:darwin_woollybutt_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:darwin_woollybutt_sapling", {
	description = "Darwin Woollybutt Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_eucalyptus_sapling.png"},
	inventory_image = "base_eucalyptus_sapling.png",
	wield_image = "base_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:blue_gum_sapling",
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
minetest.register_node("base:desert_oak_tree", {
	description = "Desert Oak Tree",
	tiles = {
		"base_desert_oak_tree_top.png",
		"base_desert_oak_tree_top.png",
		"base_desert_oak_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:desert_oak_leaves", {
	description = "Desert Oak Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_desert_oak_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:desert_oak_sapling"}, rarity = 20,},
			{items = {"base:desert_oak_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:desert_oak_sapling", {
	description = "Desert Oak Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_acacia_sapling.png"},
	inventory_image = "base_acacia_sapling.png",
	wield_image = "base_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:desert_oak_sapling",
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
minetest.register_node("base:fan_palm_tree", {
	description = "Australian Fan Palm Tree",
	tiles = {
		"base_fan_palm_tree_top.png",
		"base_fan_palm_tree_top.png",
		"base_fan_palm_tree.png"
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
	drop = 'base:stick 4',
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:fan_palm_leaves", {
	description = "Australian Fan Palm Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_fan_palm_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 2, leafdecay = 5, flammable = 1, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:fan_palm_sapling"}, rarity = 20,},
			{items = {"base:fan_palm_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:fan_palm_sapling", {
	description = "Australian Fan Palm Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_palm_sapling.png"},
	inventory_image = "base_palm_sapling.png",
	wield_image = "base_palm_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 1, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:fan_palm_sapling",
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
minetest.register_node("base:golden_wattle_tree", {
	description = "Golden Wattle Tree",
	tiles = {
		"base_golden_wattle_tree_top.png",
		"base_golden_wattle_tree_top.png",
		"base_golden_wattle_tree.png"
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
	drop = 'base:stick 4',
	groups = {tree = 1, choppy = 3, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:golden_wattle_leaves", {
	description = "Golden Wattle Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_golden_wattle_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:golden_wattle_sapling"}, rarity = 20,},
			{items = {"base:golden_wattle_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:golden_wattle_sapling", {
	description = "Golden Wattle Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_acacia_sapling.png"},
	inventory_image = "base_acacia_sapling.png",
	wield_image = "base_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:golden_wattle_sapling",
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
minetest.register_node("base:grey_mangrove_tree", {
	description = "Grey Mangrove Tree",
	tiles = {
		"base_grey_mangrove_tree_top.png",
		"base_grey_mangrove_tree_top.png",
		"base_grey_mangrove_tree.png"
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
	drop = 'base:stick 4',
	groups = {tree = 1, choppy = 3, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:grey_mangrove_leaves", {
	description = "Grey Mangrove Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_grey_mangrove_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:grey_mangrove_sapling"}, rarity = 20,},
			{items = {"base:grey_mangrove_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:grey_mangrove_sapling", {
	description = "Grey Mangrove Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_mangrove_sapling.png"},
	inventory_image = "base_mangrove_sapling.png",
	wield_image = "base_mangrove_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:grey_mangrove_sapling",
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
minetest.register_node("base:huon_pine_tree", {
	description = "Huon Pine Tree",
	tiles = {
		"base_huon_pine_tree_top.png",
		"base_huon_pine_tree_top.png",
		"base_huon_pine_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:huon_pine_leaves", {
	description = "Huon Pine Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_huon_pine_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:huon_pine_sapling"}, rarity = 20,},
			{items = {"base:huon_pine_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:huon_pine_sapling", {
	description = "Huon Pine Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_pine_sapling.png"},
	inventory_image = "base_pine_sapling.png",
	wield_image = "base_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:huon_pine_sapling",
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
minetest.register_node("base:illawarra_flame_tree", {
	description = "Illawarra Flame Tree",
	tiles = {
		"base_illawarra_flame_tree_top.png",
		"base_illawarra_flame_tree_top.png",
		"base_illawarra_flame_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:illawarra_flame_leaves", {
	description = "Illawarra Flame Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_illawarra_flame_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:illawarra_flame_sapling"}, rarity = 20,},
			{items = {"base:illawarra_flame_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:illawarra_flame_sapling", {
	description = "Illawarra Flame Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_illawarra_flame_sapling.png"},
	inventory_image = "base_illawarra_flame_sapling.png",
	wield_image = "base_illawarra_flame_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:illawarra_flame_sapling",
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
minetest.register_node("base:jarrah_tree", {
	description = "Jarrah Tree",
	tiles = {
		"base_jarrah_tree_top.png",
		"base_jarrah_tree_top.png",
		"base_jarrah_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 1, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:jarrah_leaves", {
	description = "Jarrah Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_jarrah_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:jarrah_sapling"}, rarity = 20,},
			{items = {"base:jarrah_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:jarrah_sapling", {
	description = "Jarrah Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_eucalyptus_sapling.png"},
	inventory_image = "base_eucalyptus_sapling.png",
	wield_image = "base_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:jarrah_sapling",
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
minetest.register_node("base:karri_tree", {
	description = "Karri Tree",
	tiles = {
		"base_karri_tree_top.png",
		"base_karri_tree_top.png",
		"base_karri_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 1, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:karri_leaves", {
	description = "Karri Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_karri_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:karri_sapling"}, rarity = 20,},
			{items = {"base:karri_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:karri_sapling", {
	description = "Karri Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_eucalyptus_sapling.png"},
	inventory_image = "base_eucalyptus_sapling.png",
	wield_image = "base_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:karri_sapling",
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
minetest.register_node("base:lemon_eucalyptus_tree", {
	description = "Lemon Eucalyptus Tree",
	tiles = {
		"base_lemon_eucalyptus_tree_top.png",
		"base_lemon_eucalyptus_tree_top.png",
		"base_lemon_eucalyptus_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:lemon_eucalyptus_leaves", {
	description = "Lemon Eucalyptus Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_lemon_eucalyptus_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:lemon_eucalyptus_sapling"}, rarity = 20,},
			{items = {"base:lemon_eucalyptus_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:lemon_eucalyptus_sapling", {
	description = "Lemon Eucalyptus Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_eucalyptus_sapling.png"},
	inventory_image = "base_eucalyptus_sapling.png",
	wield_image = "base_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:lemon_eucalyptus_sapling",
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
minetest.register_node("base:lemon_myrtle_tree", {
	description = "Lemon Myrtle Tree",
	tiles = {
		"base_lemon_myrtle_tree_top.png",
		"base_lemon_myrtle_tree_top.png",
		"base_lemon_myrtle_tree.png"
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
	drop = 'base:stick 4',
	groups = {tree = 1, choppy = 3, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:lemon_myrtle_leaves", {
	description = "Lemon Myrtle Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_lemon_myrtle_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:lemon_myrtle_sapling"}, rarity = 20,},
			{items = {"base:lemon_myrtle_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:lemon_myrtle_sapling", {
	description = "Lemon Myrtle Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_myrtle_sapling.png"},
	inventory_image = "base_myrtle_sapling.png",
	wield_image = "base_myrtle_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:lemon_myrtle_sapling",
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
minetest.register_node("base:lilly_pilly_tree", {
	description = "Lilly Pilly Tree",
	tiles = {
		"base_lilly_pilly_tree_top.png",
		"base_lilly_pilly_tree_top.png",
		"base_lilly_pilly_tree.png"
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
	drop = 'base:stick 4',
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:lilly_pilly_leaves", {
	description = "Lilly Pilly Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_lilly_pilly_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:lilly_pilly_sapling"}, rarity = 20,},
			{items = {"base:lilly_pilly_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:lilly_pilly_sapling", {
	description = "Lilly Pilly Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_berry_sapling.png"},
	inventory_image = "base_berry_sapling.png",
	wield_image = "base_berry_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:lilly_pilly_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -6, y = 1, z = -6},
			{x = 6, y = 12, z = 6},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

minetest.register_node("base:lilly_pilly_berries", {
	description = "Lilly Pilly Berries",
	drawtype = "plantlike",
	visual_scale = 0.67,
	tiles = {"base_lilly_pilly_berries.png"},
	inventory_image = "base_lilly_pilly_berries.png",
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
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "base:lilly_pilly_berries", param2 = 1})
		end
	end,
})

-- Macadamia
minetest.register_node("base:macadamia_tree", {
	description = "Macadamia Tree",
	tiles = {
		"base_macadamia_tree_top.png",
		"base_macadamia_tree_top.png",
		"base_macadamia_tree.png"
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
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:macadamia_leaves", {
	description = "Prickly Macadamia Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_macadamia_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:macadamia_sapling"}, rarity = 20,},
			{items = {"base:macadamia_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:macadamia_sapling", {
	description = "Prickly Macadamia Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_macadamia_sapling.png"},
	inventory_image = "base_macadamia_sapling.png",
	wield_image = "base_macadamia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:macadamia_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 12, z = 4},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

minetest.register_node("base:macadamia", {
	description = "Macadamia Nuts",
	drawtype = "plantlike",
	visual_scale = 0.67,
	tiles = {"base_macadamia.png"},
	inventory_image = "base_macadamia.png",
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
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "base:macadamia", param2 = 1})
		end
	end,
})

-- Mangrove Apple
minetest.register_node("base:mangrove_apple_tree", {
	description = "Mangrove Apple Tree",
	tiles = {
		"base_mangrove_apple_tree_top.png",
		"base_mangrove_apple_tree_top.png",
		"base_mangrove_apple_tree.png"
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
	drop = 'base:stick 4',
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:mangrove_apple_leaves", {
	description = "Mangrove Apple Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_mangrove_apple_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:mangrove_apple_sapling"}, rarity = 20,},
			{items = {"base:mangrove_apple_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:mangrove_apple_sapling", {
	description = "Mangrove Apple Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_mangrove_apple_sapling.png"},
	inventory_image = "base_mangrove_apple_sapling.png",
	wield_image = "base_mangrove_apple_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:mangrove_apple_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 12, z = 4},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

minetest.register_node("base:mangrove_apple", {
	description = "Mangrove Apple",
	drawtype = "plantlike",
	visual_scale = 0.67,
	tiles = {"base_mangrove_apple.png"},
	inventory_image = "base_mangrove_apple.png",
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
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "base:mangrove_apple", param2 = 1})
		end
	end,
})

-- Marri
minetest.register_node("base:marri_tree", {
	description = "Marri Tree",
	tiles = {
		"base_marri_tree_top.png",
		"base_marri_tree_top.png",
		"base_marri_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 1, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:marri_leaves", {
	description = "Marri Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_marri_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:marri_sapling"}, rarity = 20,},
			{items = {"base:marri_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:marri_sapling", {
	description = "Marri Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_eucalyptus_sapling.png"},
	inventory_image = "base_eucalyptus_sapling.png",
	wield_image = "base_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:marri_sapling",
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
minetest.register_node("base:merbau_tree", {
	description = "Merbau Tree",
	tiles = {
		"base_merbau_tree_top.png",
		"base_merbau_tree_top.png",
		"base_merbau_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:merbau_leaves", {
	description = "Merbau Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_merbau_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:merbau_sapling"}, rarity = 20,},
			{items = {"base:merbau_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:merbau_sapling", {
	description = "Merbau Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_merbau_sapling.png"},
	inventory_image = "base_merbau_sapling.png",
	wield_image = "base_merbau_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:merbau_sapling",
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
minetest.register_node("base:moreton_bay_fig_tree", {
	description = "Moreton Bay Fig Tree",
	tiles = {
		"base_moreton_bay_fig_tree_top.png",
		"base_moreton_bay_fig_tree_top.png",
		"base_moreton_bay_fig_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 1, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:moreton_bay_fig_leaves", {
	description = "Moreton Bay Fig Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_moreton_bay_fig_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:moreton_bay_fig_sapling"}, rarity = 20,},
			{items = {"base:moreton_bay_fig_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:moreton_bay_fig_sapling", {
	description = "Moreton Bay Fig Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_fig_sapling.png"},
	inventory_image = "base_fig_sapling.png",
	wield_image = "base_fig_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:mangrove_apple_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -15, y = 1, z = -15},
			{x = 15, y = 35, z = 15},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

minetest.register_node("base:moreton_bay_fig", {
	description = "Moreton Bay Fig",
	drawtype = "plantlike",
	visual_scale = 0.67,
	tiles = {"base_moreton_bay_fig.png"},
	inventory_image = "base_moreton_bay_fig.png",
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
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "base:moreton_bay_fig", param2 = 1})
		end
	end,
})

-- Mulga Tree
minetest.register_node("base:mulga_tree", {
	description = "Mulga Tree",
	tiles = {
		"base_mulga_tree_top.png",
		"base_mulga_tree_top.png",
		"base_mulga_tree.png"
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
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:mulga_leaves", {
	description = "Mulga Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_mulga_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:mulga_sapling"}, rarity = 20,},
			{items = {"base:mulga_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:mulga_sapling", {
	description = "Mulga Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_acacia_sapling.png"},
	inventory_image = "base_acacia_sapling.png",
	wield_image = "base_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:mulga_sapling",
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
minetest.register_node("base:paperbark_tree", {
	description = "Paper Bark Tree",
	tiles = {
		"base_paperbark_tree_top.png",
		"base_paperbark_tree_top.png",
		"base_paperbark_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:paperbark_leaves", {
	description = "Paper Bark Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_paperbark_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:paperbark_sapling"}, rarity = 20,},
			{items = {"base:paperbark_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:paperbark_sapling", {
	description = "Paper Bark Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_melaleuca_sapling.png"},
	inventory_image = "base_melaleuca_sapling.png",
	wield_image = "base_melaleuca_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:paperbark_sapling",
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
minetest.register_node("base:quandong_tree", {
	description = "Desert Quandong Tree",
	tiles = {
		"base_quandong_tree_top.png",
		"base_quandong_tree_top.png",
		"base_quandong_tree.png"
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
	drop = 'base:stick 4',
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:quandong_leaves", {
	description = "Desert Quandong Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_quandong_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:quandong_sapling"}, rarity = 20,},
			{items = {"base:quandong_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:quandong_sapling", {
	description = "Desert Quandong Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_quandong_sapling.png"},
	inventory_image = "base_quandong_sapling.png",
	wield_image = "base_quandong_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:quandong_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 5, z = 2},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

minetest.register_node("base:quandong", {
	description = "Desert Quandong",
	drawtype = "plantlike",
	visual_scale = 8/16,
	tiles = {"base_quandong.png"},
	inventory_image = "base_quandong.png",
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
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "base:quandong", param2 = 1})
		end
	end,
})

-- River Oak
minetest.register_node("base:river_oak_tree", {
	description = "River Oak Tree",
	tiles = {
		"base_river_oak_tree_top.png",
		"base_river_oak_tree_top.png",
		"base_river_oak_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:river_oak_leaves", {
	description = "River Oak Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_river_oak_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:river_oak_sapling"}, rarity = 20,},
			{items = {"base:river_oak_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:river_oak_sapling", {
	description = "River Oak Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_acacia_sapling.png"},
	inventory_image = "base_acacia_sapling.png",
	wield_image = "base_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:river_oak_sapling",
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
minetest.register_node("base:river_red_gum_tree", {
	description = "River Red Gum Tree",
	tiles = {
		"base_river_red_gum_tree_top.png",
		"base_river_red_gum_tree_top.png",
		"base_river_red_gum_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 1,flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:river_red_gum_leaves", {
	description = "River Red Gum Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_river_red_gum_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:river_red_gum_sapling"}, rarity = 20,},
			{items = {"base:river_red_gum_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:river_red_gum_sapling", {
	description = "River Red Gum Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_eucalyptus_sapling.png"},
	inventory_image = "base_eucalyptus_sapling.png",
	wield_image = "base_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:river_red_gum_sapling",
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
minetest.register_node("base:rottnest_island_pine_tree", {
	description = "Rottnest Island Pine Tree",
	tiles = {
		"base_rottnest_island_pine_tree_top.png",
		"base_rottnest_island_pine_tree_top.png",
		"base_rottnest_island_pine_tree.png"
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
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:rottnest_island_pine_leaves", {
	description = "Rottnest Island Pine Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_rottnest_island_pine_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:rottnest_island_pine_sapling"}, rarity = 20,},
			{items = {"base:rottnest_island_pine_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:rottnest_island_pine_sapling", {
	description = "Rottnest Island Pine Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_pine_sapling.png"},
	inventory_image = "base_pine_sapling.png",
	wield_image = "base_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:rottnest_island_pine_sapling",
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
minetest.register_node("base:scribbly_gum_tree", {
	description = "Scribbly Gum Tree",
	tiles = {
		"base_scribbly_gum_tree_top.png",
		"base_scribbly_gum_tree_top.png",
		"base_scribbly_gum_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:scribbly_gum_leaves", {
	description = "Scribbly Gum Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_scribbly_gum_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:scribbly_gum_sapling"}, rarity = 20,},
			{items = {"base:scribbly_gum_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:scribbly_gum_sapling", {
	description = "Scribbly Gum Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_eucalyptus_sapling.png"},
	inventory_image = "base_eucalyptus_sapling.png",
	wield_image = "base_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:scribbly_gum_sapling",
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
minetest.register_node("base:shoestring_acacia_tree", {
	description = "Shoestring Acacia Tree",
	tiles = {
		"base_shoestring_acacia_tree_top.png",
		"base_shoestring_acacia_tree_top.png",
		"base_shoestring_acacia_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:shoestring_acacia_leaves", {
	description = "Shoestring Acacia Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_shoestring_acacia_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:shoestring_acacia_sapling"}, rarity = 20,},
			{items = {"base:shoestring_acacia_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:shoestring_acacia_sapling", {
	description = "Shoestring Acacia Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_acacia_sapling.png"},
	inventory_image = "base_acacia_sapling.png",
	wield_image = "base_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:shoestring_acacia_sapling",
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
minetest.register_node("base:snow_gum_tree", {
	description = "Snow Gum Tree",
	tiles = {
		"base_snow_gum_tree_top.png",
		"base_snow_gum_tree_top.png",
		"base_snow_gum_tree.png"
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
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:snow_gum_leaves", {
	description = "Snow Gum Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_snow_gum_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:snow_gum_sapling"}, rarity = 20,},
			{items = {"base:snow_gum_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:snow_gum_sapling", {
	description = "Snow Gum Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_eucalyptus_sapling.png"},
	inventory_image = "base_eucalyptus_sapling.png",
	wield_image = "base_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:snow_gum_sapling",
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
minetest.register_node("base:southern_sassafras_tree", {
	description = "Southern Sassafras Tree",
	tiles = {
		"base_southern_sassafras_tree_top.png",
		"base_southern_sassafras_tree_top.png",
		"base_southern_sassafras_tree.png"
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
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:southern_sassafras_leaves", {
	description = "Southern Sassafras Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_southern_sassafras_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:southern_sassafras_sapling"}, rarity = 20,},
			{items = {"base:southern_sassafras_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:southern_sassafras_sapling", {
	description = "Southern Sassafras Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_pine_sapling.png"},
	inventory_image = "base_pine_sapling.png",
	wield_image = "base_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:southern_sassafras_sapling",
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
minetest.register_node("base:stilted_mangrove_tree", {
	description = "Stilted Mangrove Tree",
	tiles = {
		"base_stilted_mangrove_tree_top.png",
		"base_stilted_mangrove_tree_top.png",
		"base_stilted_mangrove_tree.png"
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
	drop = 'base:stick 4',
	groups = {tree = 1, choppy = 3, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:stilted_mangrove_leaves", {
	description = "Stilted Mangrove Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_stilted_mangrove_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:stilted_mangrove_sapling"}, rarity = 20,},
			{items = {"base:stilted_mangrove_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:stilted_mangrove_sapling", {
	description = "Stilted Mangrove Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_mangrove_sapling.png"},
	inventory_image = "base_mangrove_sapling.png",
	wield_image = "base_mangrove_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:stilted_mangrove_sapling",
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
minetest.register_node("base:sugar_gum_tree", {
	description = "Sugar Gum Tree",
	tiles = {
		"base_sugar_gum_tree_top.png",
		"base_sugar_gum_tree_top.png",
		"base_sugar_gum_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:sugar_gum_leaves", {
	description = "Sugar Gum Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_sugar_gum_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:sugar_gum_sapling"}, rarity = 20,},
			{items = {"base:sugar_gum_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:sugar_gum_sapling", {
	description = "Sugar Gum Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_eucalyptus_sapling.png"},
	inventory_image = "base_eucalyptus_sapling.png",
	wield_image = "base_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:sugar_gum_sapling",
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
minetest.register_node("base:swamp_bloodwood_tree", {
	description = "Swamp Bloodwood Tree",
	tiles = {
		"base_swamp_bloodwood_tree_top.png",
		"base_swamp_bloodwood_tree_top.png",
		"base_swamp_bloodwood_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:swamp_bloodwood_leaves", {
	description = "Swamp Bloodwood Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_swamp_bloodwood_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:swamp_bloodwood_sapling"}, rarity = 20,},
			{items = {"base:swamp_bloodwood_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:swamp_bloodwood_sapling", {
	description = "Swamp Bloodwood Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_eucalyptus_sapling.png"},
	inventory_image = "base_eucalyptus_sapling.png",
	wield_image = "base_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:swamp_bloodwood_sapling",
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
minetest.register_node("base:swamp_gum_tree", {
	description = "Swamp Gum Tree",
	tiles = {
		"base_swamp_gum_tree_top.png",
		"base_swamp_gum_tree_top.png",
		"base_swamp_gum_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 1, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:swamp_gum_leaves", {
	description = "Swamp Gum Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_swamp_gum_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:swamp_gum_sapling"}, rarity = 20,},
			{items = {"base:swamp_gum_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:swamp_gum_sapling", {
	description = "Swamp Gum Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_eucalyptus_sapling.png"},
	inventory_image = "base_eucalyptus_sapling.png",
	wield_image = "base_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:swamp_gum_sapling",
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
minetest.register_node("base:swamp_paperbark_tree", {
	description = "Swamp Paperbark Tree",
	tiles = {
		"base_swamp_paperbark_tree_top.png",
		"base_swamp_paperbark_tree_top.png",
		"base_swamp_paperbark_tree.png"
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
	drop = 'base:stick 4',
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:swamp_paperbark_leaves", {
	description = "Swamp Paperbark Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_swamp_paperbark_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:swamp_paperbark_sapling"}, rarity = 20,},
			{items = {"base:swamp_paperbark_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:swamp_paperbark_sapling", {
	description = "Swamp Paperbark Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_melaleuca_sapling.png"},
	inventory_image = "base_melaleuca_sapling.png",
	wield_image = "base_melaleuca_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:swamp_paperbark_sapling",
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
minetest.register_node("base:tasmanian_myrtle_tree", {
	description = "Tasmanian Myrtle Tree",
	tiles = {
		"base_tasmanian_myrtle_tree_top.png",
		"base_tasmanian_myrtle_tree_top.png",
		"base_tasmanian_myrtle_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 1, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:tasmanian_myrtle_leaves", {
	description = "Tasmanian Myrtle Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_tasmanian_myrtle_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:tasmanian_myrtle_sapling"}, rarity = 20,},
			{items = {"base:tasmanian_myrtle_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:tasmanian_myrtle_sapling", {
	description = "Tasmanian Myrtle Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_myrtle_sapling.png"},
	inventory_image = "base_myrtle_sapling.png",
	wield_image = "base_myrtle_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:tasmanian_myrtle_sapling",
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
minetest.register_node("base:tea_tree_tree", {
	description = "Tea Tree",
	tiles = {
		"base_tea_tree_tree_top.png",
		"base_tea_tree_tree_top.png",
		"base_tea_tree_tree.png"
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
	drop = 'base:stick 4',
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:tea_tree_leaves", {
	description = "Tea Tree Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_tea_tree_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:tea_tree_sapling"}, rarity = 20,},
			{items = {"base:tea_tree_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:tea_tree_sapling", {
	description = "Tea Tree Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_melaleuca_sapling.png"},
	inventory_image = "base_melaleuca_sapling.png",
	wield_image = "base_melaleuca_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:tea_tree_sapling",
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
minetest.register_node("base:white_box_tree", {
	description = "White Box Tree",
	tiles = {
		"base_white_box_tree_top.png",
		"base_white_box_tree_top.png",
		"base_white_box_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 1},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:white_box_leaves", {
	description = "White Box Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_white_box_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:white_box_sapling"}, rarity = 20,},
			{items = {"base:white_box_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:white_box_sapling", {
	description = "White Box Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_eucalyptus_sapling.png"},
	inventory_image = "base_eucalyptus_sapling.png",
	wield_image = "base_eucalyptus_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:white_box_sapling",
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
minetest.register_node("base:wirewood_tree", {
	description = "Wirewood Tree",
	tiles = {
		"base_wirewood_tree_top.png",
		"base_wirewood_tree_top.png",
		"base_wirewood_tree.png"
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
	drop = 'base:stick 4',
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("base:wirewood_leaves", {
	description = "Wirewood Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"base_wirewood_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 3, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:wirewood_sapling"}, rarity = 20,},
			{items = {"base:wirewood_leaves"},}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:wirewood_sapling", {
	description = "Wirewood Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"base_acacia_sapling.png"},
	inventory_image = "base_acacia_sapling.png",
	wield_image = "base_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 3, attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:wirewood_sapling",
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

minetest.register_node("base:eucalyptus_wood", {
	description = "Eucalyptus Wood Planks",
	tiles = {"base_eucalyptus_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:blackwood", {
	description = "Blackwood Planks",
	tiles = {"base_blackwood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:blue_gum", {
	description = "Blue Gum Planks",
	tiles = {"base_blue_gum.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:celery_top_pine", {
	description = "Celery-top Pine Planks",
	tiles = {"base_celery_top_pine.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:red_mahogany", {
	description = "Red Mahogany Planks",
	tiles = {"base_red_mahogany.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:huon_pine", {
	description = "Huon Pine Planks",
	tiles = {"base_huon_pine.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:jarrah", {
	description = "Jarrah Planks",
	tiles = {"base_jarrah.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:karri", {
	description = "Karri Planks",
	tiles = {"base_karri.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:marri", {
	description = "Marri Planks",
	tiles = {"base_marri.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:merbau", {
	description = "Merbau Planks",
	tiles = {"base_merbau.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:red_gum", {
	description = "Red Gum Planks",
	tiles = {"base_red_gum.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:southern_sassafras", {
	description = "Southern Sassafras Planks",
	tiles = {"base_southern_sassafras.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:tasmanian_oak", {
	description = "Tasmanian Oak Planks",
	tiles = {"base_tasmanian_oak.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})

minetest.register_node("base:tasmanian_myrtle", {
	description = "Tasmanian Myrtle Planks",
	tiles = {"base_tasmanian_myrtle.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = base.node_sound_wood_defaults(),
})


local random = math.random

--
-- Grow trees from saplings
--

-- 'can grow' function

function base.can_grow(pos)
	local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not node_under then
		return false
	end
	local name_under = node_under.name
	local is_soil = minetest.get_item_group(name_under, "soil")
	if is_soil == 0 then
		return false
	end
	local light_level = minetest.get_node_light(pos)
	if not light_level or light_level < 13 then
		return false
	end
	return true
end


-- 'is snow nearby' function

local function is_snow_nearby(pos)
	return minetest.find_node_near(pos, 1, {"group:snowy"})
end


-- Sapling ABM

function base.grow_sapling(pos)
	if not base.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(240, 600))
		return
	end

	local mg_name = minetest.get_mapgen_setting("mg_name")
	local node = minetest.get_node(pos)
	if node.name == "base:sapling" then
		minetest.log("action", "A sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		if mg_name == "v6" then
			base.grow_tree(pos, random(1, 4) == 1)
		else
			base.grow_new_apple_tree(pos)
		end
	elseif node.name == "base:junglesapling" then
		minetest.log("action", "A jungle sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		if mg_name == "v6" then
			base.grow_jungle_tree(pos)
		else
			base.grow_new_jungle_tree(pos)
		end
	elseif node.name == "base:pine_sapling" then
		minetest.log("action", "A pine sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		local snow = is_snow_nearby(pos)
		if mg_name == "v6" then
			base.grow_pine_tree(pos, snow)
		elseif snow then
			base.grow_new_snowy_pine_tree(pos)
		else
			base.grow_new_pine_tree(pos)
		end
	elseif node.name == "base:acacia_sapling" then
		minetest.log("action", "An acacia sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		base.grow_new_acacia_tree(pos)
	elseif node.name == "base:aspen_sapling" then
		minetest.log("action", "An aspen sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		base.grow_new_aspen_tree(pos)
	elseif node.name == "base:bush_sapling" then
		minetest.log("action", "A bush sapling grows into a bush at "..
			minetest.pos_to_string(pos))
		base.grow_bush(pos)
	elseif node.name == "base:acacia_bush_sapling" then
		minetest.log("action", "An acacia bush sapling grows into a bush at "..
			minetest.pos_to_string(pos))
		base.grow_acacia_bush(pos)
	elseif node.name == "australia:arnhem_cypress_pine_sapling" then
		minetest.log("action", "An Arnhem Cypress Pine sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_arnhem_cypress_pine(pos)
	elseif node.name == "australia:black_box_sapling" then
		minetest.log("action", "A Black Box sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_black_box(pos)
	elseif node.name == "australia:black_wattle_sapling" then
		minetest.log("action", "A Black Wattle sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_black_wattle(pos)
	elseif node.name == "australia:blue_gum_sapling" then
		minetest.log("action", "A Blue Gum sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_blue_gum(pos)
	elseif node.name == "australia:boab_sapling" then
		minetest.log("action", "A Boab sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_boab(pos)
	elseif node.name == "australia:bull_banksia_sapling" then
		minetest.log("action", "A Bull Banksia sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_bull_banksia(pos)
	elseif node.name == "australia:celery_top_pine_sapling" then
		minetest.log("action", "A Celery-top Pine sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_celery_top_pine(pos)
	elseif node.name == "australia:cherry_sapling" then
		minetest.log("action", "A Cherry sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_cherry(pos)
	elseif node.name == "australia:coast_banksia_sapling" then
		minetest.log("action", "A Coast Banksia sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_coast_banksia(pos)
	elseif node.name == "australia:coolabah_sapling" then
		minetest.log("action", "A Coolabah sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_coolabah(pos)
	elseif node.name == "australia:daintree_stringybark_sapling" then
		minetest.log("action", "A Daintree Stringybark sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_daintree_stringybark(pos)
	elseif node.name == "australia:darwin_woollybutt_sapling" then
		minetest.log("action", "A Darwin Woollybutt sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_darwin_woollybutt(pos)
	elseif node.name == "australia:desert_oak_sapling" then
		minetest.log("action", "A Desert Oak sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_desert_oak(pos)
	elseif node.name == "australia:fan_palm_sapling" then
		minetest.log("action", "A Fan Palm sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_fan_palm(pos)
	elseif node.name == "australia:flame_grevillea_sapling" then
		minetest.log("action", "A Flame Grevillea sapling grows into a bush at "..
			minetest.pos_to_string(pos))
		aus.grow_flame_grevillea(pos)
	elseif node.name == "australia:golden_wattle_sapling" then
		minetest.log("action", "A Golden Wattle sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_golden_wattle(pos)
	elseif node.name == "australia:grey_mangrove_sapling" then
		minetest.log("action", "A Grey Mangrove sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_grey_mangrove(pos)
	elseif node.name == "australia:huon_pine_sapling" then
		minetest.log("action", "A Huon Pine sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_huon_pine(pos)
	elseif node.name == "australia:illawarra_flame_sapling" then
		minetest.log("action", "A Illawarra Flame Tree sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_illawarra_flame(pos)
	elseif node.name == "australia:jarrah_sapling" then
		minetest.log("action", "A Jarrah sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_jarrah(pos)
	elseif node.name == "australia:karri_sapling" then
		minetest.log("action", "A Karri sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_karri(pos)
	elseif node.name == "australia:lemon_eucalyptus_sapling" then
		minetest.log("action", "A Lemon Eucalyptus sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_lemon_eucalyptus(pos)
	elseif node.name == "australia:lemon_myrtle_sapling" then
		minetest.log("action", "A Lemon Myrtle sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_lemon_myrtle(pos)
	elseif node.name == "australia:lilly_pilly_sapling" then
		minetest.log("action", "A Lilly Pilly sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_lilly_pilly(pos)
	elseif node.name == "australia:macadamia_sapling" then
		minetest.log("action", "A Macadamia sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_macadamia(pos)
	elseif node.name == "australia:mangrove_apple_sapling" then
		minetest.log("action", "A Mangrove Apple sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_mangrove_apple(pos)
	elseif node.name == "australia:marri_sapling" then
		minetest.log("action", "A Marri sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_marri(pos)
	elseif node.name == "australia:merbau_sapling" then
		minetest.log("action", "A Merbau sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_merbau(pos)
	elseif node.name == "australia:moreton_bay_fig_sapling" then
		minetest.log("action", "A Moreton Bay Fig sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_moreton_bay_fig(pos)
	elseif node.name == "australia:mulga_sapling" then
		minetest.log("action", "A Mulga sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_mulga(pos)
	elseif node.name == "australia:paperbark_sapling" then
		minetest.log("action", "A Paperbark sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_paperbark(pos)
	elseif node.name == "australia:quandong_sapling" then
		minetest.log("action", "A Quandong sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_quandong(pos)
	elseif node.name == "australia:red_bottlebrush_sapling" then
		minetest.log("action", "A Red Bottlebrush sapling grows into a bush at "..
			minetest.pos_to_string(pos))
		aus.grow_red_bottlebrush(pos)
	elseif node.name == "australia:river_oak_sapling" then
		minetest.log("action", "A River Oak sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_river_oak(pos)
	elseif node.name == "australia:river_red_gum_sapling" then
		minetest.log("action", "A River Red Gum sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_river_red_gum(pos)
	elseif node.name == "australia:rottnest_island_pine_sapling" then
		minetest.log("action", "A Rottnest Island Pine sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_rottnest_island_pine(pos)
	elseif node.name == "australia:scribbly_gum_sapling" then
		minetest.log("action", "A Scribbly Gum sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_scribbly_gum(pos)
	elseif node.name == "australia:shoestring_acacia_sapling" then
		minetest.log("action", "A Shoestring Acacia sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_shoestring_acacia(pos)
	elseif node.name == "australia:snow_gum_sapling" then
		minetest.log("action", "A Snow Gum sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_snow_gum(pos)
	elseif node.name == "australia:southern_sassafras_sapling" then
		minetest.log("action", "A Southern Sassafras sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_southern_sassafras(pos)
	elseif node.name == "australia:stilted_mangrove_sapling" then
		minetest.log("action", "A Stilted Mangrove sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_stilted_mangrove(pos)
	elseif node.name == "australia:sugar_gum_sapling" then
		minetest.log("action", "A Sugar Gum sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_sugar_gum(pos)
	elseif node.name == "australia:swamp_bloodwood_sapling" then
		minetest.log("action", "A Swamp Bloodwood sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_swamp_bloodwood(pos)
	elseif node.name == "australia:swamp_gum_sapling" then
		minetest.log("action", "A Swamp Gum sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_swamp_gum(pos)
	elseif node.name == "australia:swamp_paperbark_sapling" then
		minetest.log("action", "A Swamp Paperbark sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_swamp_paperbark(pos)
	elseif node.name == "australia:tasmanian_myrtle_sapling" then
		minetest.log("action", "A Tasmanian Myrtle sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_tasmanian_myrtle(pos)
	elseif node.name == "australia:tea_tree_sapling" then
		minetest.log("action", "A Tea Tree sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_tea_tree(pos)
	elseif node.name == "australia:waratah_sapling" then
		minetest.log("action", "A Waratah sapling grows into a bush at "..
			minetest.pos_to_string(pos))
		aus.grow_waratah(pos)
	elseif node.name == "australia:white_box_sapling" then
		minetest.log("action", "A White Box sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_white_box(pos)
	elseif node.name == "australia:wirewood_sapling" then
		minetest.log("action", "A Wirewood sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		aus.grow_wirewood(pos)
	end
end

minetest.register_lbm({
	name = "base:convert_saplings_to_node_timer",
	nodenames = {
			"base:sapling",
			"base:junglesapling",
			"base:pine_sapling",
			"base:acacia_sapling",
			"base:aspen_sapling",
			"australia:arnhem_cypress_pine_sapling",
			"australia:black_box_sapling",
			"australia:black_wattle_sapling",
			"australia:blue_gum_sapling",
			"australia:boab_sapling",
			"australia:bull_banksia_sapling",
			"australia:celery_top_pine_sapling",
			"australia:cherry_sapling",
			"australia:coast_banksia_sapling",
			"australia:coolabah_sapling",
			"australia:daintree_stringybark_sapling",
			"australia:darwin_woollybutt_sapling",
			"australia:desert_oak_sapling",
			"australia:fan_palm_sapling",
			"australia:flame_grevillea_sapling",
			"australia:golden_wattle_sapling",
			"australia:grey_mangrove_sapling",
			"australia:huon_pine_sapling",
			"australia:illawarra_flame_sapling",
			"australia:jarrah_sapling",
			"australia:karri_sapling",
			"australia:lemon_eucalyptus_sapling",
			"australia:lemon_myrtle_sapling",
			"australia:lilly_pilly_sapling",
			"australia:macadamia_sapling",
			"australia:mangrove_apple_sapling",
			"australia:marri_sapling",
			"australia:merbau_sapling",
			"australia:moreton_bay_fig_sapling",
			"australia:mulga_sapling",
			"australia:paperbark_sapling",
			"australia:quandong_sapling",
			"australia:red_bottlebrush_sapling",
			"australia:river_oak_sapling",
			"australia:river_red_gum_sapling",
			"australia:rottnest_island_pine_sapling",
			"australia:scribbly_gum_sapling",
			"australia:shoestring_acacia_sapling",
			"australia:snow_gum_sapling",
			"australia:southern_sassafras_sapling",
			"australia:stilted_mangrove_sapling",
			"australia:sugar_gum_sapling",
			"australia:swamp_bloodwood_sapling",
			"australia:swamp_gum_sapling",
			"australia:swamp_paperbark_sapling",
			"australia:tasmanian_myrtle_sapling",
			"australia:tea_tree_sapling",
			"australia:waratah_sapling",
			"australia:white_box_sapling",
			"australia:wirewood_sapling"
	},
	action = function(pos)
		minetest.get_node_timer(pos):start(math.random(1200, 2400))
	end
})

--
-- Tree generation
--

-- Apple tree and jungle tree trunk and leaves function

local function add_trunk_and_leaves(data, a, pos, tree_cid, leaves_cid,
		height, size, iters, is_apple_tree)
	local x, y, z = pos.x, pos.y, pos.z
	local c_air = minetest.get_content_id("air")
	local c_ignore = minetest.get_content_id("ignore")
	local c_apple = minetest.get_content_id("base:apple")

	-- Trunk
	data[a:index(x, y, z)] = tree_cid -- Force-place lowest trunk node to replace sapling
	for yy = y + 1, y + height - 1 do
		local vi = a:index(x, yy, z)
		local node_id = data[vi]
		if node_id == c_air or node_id == c_ignore or node_id == leaves_cid then
			data[vi] = tree_cid
		end
	end

	-- Force leaves near the trunk
	for z_dist = -1, 1 do
	for y_dist = -size, 1 do
		local vi = a:index(x - 1, y + height + y_dist, z + z_dist)
		for x_dist = -1, 1 do
			if data[vi] == c_air or data[vi] == c_ignore then
				if is_apple_tree and random(1, 8) == 1 then
					data[vi] = c_apple
				else
					data[vi] = leaves_cid
				end
			end
			vi = vi + 1
		end
	end
	end

	-- Randomly add leaves in 2x2x2 clusters.
	for i = 1, iters do
		local clust_x = x + random(-size, size - 1)
		local clust_y = y + height + random(-size, 0)
		local clust_z = z + random(-size, size - 1)

		for xi = 0, 1 do
		for yi = 0, 1 do
		for zi = 0, 1 do
			local vi = a:index(clust_x + xi, clust_y + yi, clust_z + zi)
			if data[vi] == c_air or data[vi] == c_ignore then
				if is_apple_tree and random(1, 8) == 1 then
					data[vi] = c_apple
				else
					data[vi] = leaves_cid
				end
			end
		end
		end
		end
	end
end


-- Apple tree

function base.grow_tree(pos, is_apple_tree, bad)
	--[[
		NOTE: Tree-placing code is currently duplicated in the engine
		and in games that have saplings; both are deprecated but not
		replaced yet
	--]]
	if bad then
		error("Deprecated use of base.grow_tree")
	end

	local x, y, z = pos.x, pos.y, pos.z
	local height = random(4, 5)
	local c_tree = minetest.get_content_id("base:tree")
	local c_leaves = minetest.get_content_id("base:leaves")

	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = x - 2, y = y, z = z - 2},
		{x = x + 2, y = y + height + 1, z = z + 2}
	)
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()

	add_trunk_and_leaves(data, a, pos, c_tree, c_leaves, height, 2, 8, is_apple_tree)

	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end


-- Jungle tree

function base.grow_jungle_tree(pos, bad)
	--[[
		NOTE: Jungletree-placing code is currently duplicated in the engine
		and in games that have saplings; both are deprecated but not
		replaced yet
	--]]
	if bad then
		error("Deprecated use of base.grow_jungle_tree")
	end

	local x, y, z = pos.x, pos.y, pos.z
	local height = random(8, 12)
	local c_air = minetest.get_content_id("air")
	local c_ignore = minetest.get_content_id("ignore")
	local c_jungletree = minetest.get_content_id("base:jungletree")
	local c_jungleleaves = minetest.get_content_id("base:jungleleaves")

	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = x - 3, y = y - 1, z = z - 3},
		{x = x + 3, y = y + height + 1, z = z + 3}
	)
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()

	add_trunk_and_leaves(data, a, pos, c_jungletree, c_jungleleaves,
		height, 3, 30, false)

	-- Roots
	for z_dist = -1, 1 do
		local vi_1 = a:index(x - 1, y - 1, z + z_dist)
		local vi_2 = a:index(x - 1, y, z + z_dist)
		for x_dist = -1, 1 do
			if random(1, 3) >= 2 then
				if data[vi_1] == c_air or data[vi_1] == c_ignore then
					data[vi_1] = c_jungletree
				elseif data[vi_2] == c_air or data[vi_2] == c_ignore then
					data[vi_2] = c_jungletree
				end
			end
			vi_1 = vi_1 + 1
			vi_2 = vi_2 + 1
		end
	end

	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end


-- Pine tree from mg mapgen mod, design by sfan5, pointy top added by paramat

local function add_pine_needles(data, vi, c_air, c_ignore, c_snow, c_pine_needles)
	local node_id = data[vi]
	if node_id == c_air or node_id == c_ignore or node_id == c_snow then
		data[vi] = c_pine_needles
	end
end

local function add_snow(data, vi, c_air, c_ignore, c_snow)
	local node_id = data[vi]
	if node_id == c_air or node_id == c_ignore then
		data[vi] = c_snow
	end
end

function base.grow_pine_tree(pos, snow)
	local x, y, z = pos.x, pos.y, pos.z
	local maxy = y + random(9, 13) -- Trunk top

	local c_air = minetest.get_content_id("air")
	local c_ignore = minetest.get_content_id("ignore")
	local c_pine_tree = minetest.get_content_id("base:pine_tree")
	local c_pine_needles  = minetest.get_content_id("base:pine_needles")
	local c_snow = minetest.get_content_id("base:snow")

	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = x - 3, y = y, z = z - 3},
		{x = x + 3, y = maxy + 3, z = z + 3}
	)
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()

	-- Upper branches layer
	local dev = 3
	for yy = maxy - 1, maxy + 1 do
		for zz = z - dev, z + dev do
			local vi = a:index(x - dev, yy, zz)
			local via = a:index(x - dev, yy + 1, zz)
			for xx = x - dev, x + dev do
				if random() < 0.95 - dev * 0.05 then
					add_pine_needles(data, vi, c_air, c_ignore, c_snow,
						c_pine_needles)
					if snow then
						add_snow(data, via, c_air, c_ignore, c_snow)
					end
				end
				vi  = vi + 1
				via = via + 1
			end
		end
		dev = dev - 1
	end

	-- Centre top nodes
	add_pine_needles(data, a:index(x, maxy + 1, z), c_air, c_ignore, c_snow,
		c_pine_needles)
	add_pine_needles(data, a:index(x, maxy + 2, z), c_air, c_ignore, c_snow,
		c_pine_needles) -- Paramat added a pointy top node
	if snow then
		add_snow(data, a:index(x, maxy + 3, z), c_air, c_ignore, c_snow)
	end

	-- Lower branches layer
	local my = 0
	for i = 1, 20 do -- Random 2x2 squares of needles
		local xi = x + random(-3, 2)
		local yy = maxy + random(-6, -5)
		local zi = z + random(-3, 2)
		if yy > my then
			my = yy
		end
		for zz = zi, zi+1 do
			local vi = a:index(xi, yy, zz)
			local via = a:index(xi, yy + 1, zz)
			for xx = xi, xi + 1 do
				add_pine_needles(data, vi, c_air, c_ignore, c_snow,
					c_pine_needles)
				if snow then
					add_snow(data, via, c_air, c_ignore, c_snow)
				end
				vi  = vi + 1
				via = via + 1
			end
		end
	end

	dev = 2
	for yy = my + 1, my + 2 do
		for zz = z - dev, z + dev do
			local vi = a:index(x - dev, yy, zz)
			local via = a:index(x - dev, yy + 1, zz)
			for xx = x - dev, x + dev do
				if random() < 0.95 - dev * 0.05 then
					add_pine_needles(data, vi, c_air, c_ignore, c_snow,
						c_pine_needles)
					if snow then
						add_snow(data, via, c_air, c_ignore, c_snow)
					end
				end
				vi  = vi + 1
				via = via + 1
			end
		end
		dev = dev - 1
	end

	-- Trunk
	-- Force-place lowest trunk node to replace sapling
	data[a:index(x, y, z)] = c_pine_tree
	for yy = y + 1, maxy do
		local vi = a:index(x, yy, z)
		local node_id = data[vi]
		if node_id == c_air or node_id == c_ignore or
				node_id == c_pine_needles or node_id == c_snow then
			data[vi] = c_pine_tree
		end
	end

	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end


-- Aliases for schematic nodes
minetest.register_alias("default:tree", "base:tree")
minetest.register_alias("default:leaves", "base:leaves")
minetest.register_alias("default:apple", "base:apple")
minetest.register_alias("default:jungletree", "base:jungletree")
minetest.register_alias("default:jungleleaves", "base:jungleleaves")
minetest.register_alias("default:pine_tree", "base:pine_tree")
minetest.register_alias("default:pine_leaves", "base:pine_leaves")
minetest.register_alias("default:acacia_tree", "base:acacia_tree")
minetest.register_alias("default:acacia_leaves", "base:acacia_leaves")
minetest.register_alias("default:aspen_tree", "base:aspen_tree")
minetest.register_alias("default:aspen_leaves", "base:aspen_leaves")


-- New apple tree

function base.grow_new_apple_tree(pos)
	local path = minetest.get_modpath("core") ..
		"/schematics/apple_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end


-- New jungle tree

function base.grow_new_jungle_tree(pos)
	local path = minetest.get_modpath("core") ..
		"/schematics/jungle_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end


-- New pine tree

function base.grow_new_pine_tree(pos)
	local path = minetest.get_modpath("core") ..
		"/schematics/pine_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "0", nil, false)
end


-- New snowy pine tree

function base.grow_new_snowy_pine_tree(pos)
	local path = minetest.get_modpath("core") ..
		"/schematics/snowy_pine_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end


-- New acacia tree

function base.grow_new_acacia_tree(pos)
	local path = minetest.get_modpath("core") ..
		"/schematics/acacia_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 4, y = pos.y - 1, z = pos.z - 4},
		path, "random", nil, false)
end


-- New aspen tree

function base.grow_new_aspen_tree(pos)
	local path = minetest.get_modpath("core") ..
		"/schematics/aspen_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "0", nil, false)
end


-- Bushes do not need 'from sapling' schematic variants because
-- only the stem node is force-placed in the schematic.

-- Bush

function base.grow_bush(pos)
	local path = minetest.get_modpath("core") ..
		"/schematics/bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, false)
end


-- Acacia bush

function base.grow_acacia_bush(pos)
	local path = minetest.get_modpath("core") ..
		"/schematics/acacia_bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, false)
end


--
-- Sapling 'on place' function to check protection of node and resulting tree volume
--

function base.sapling_on_place(itemstack, placer, pointed_thing,
		sapling_name, minp_relative, maxp_relative, interval)
	-- Position of sapling
	local pos = pointed_thing.under
	local node = minetest.get_node_or_nil(pos)
	local pdef = node and minetest.registered_nodes[node.name]

	if pdef and pdef.on_rightclick and not placer:get_player_control().sneak then
		return pdef.on_rightclick(pos, node, placer, itemstack, pointed_thing)
	end

	if not pdef or not pdef.buildable_to then
		pos = pointed_thing.above
		node = minetest.get_node_or_nil(pos)
		pdef = node and minetest.registered_nodes[node.name]
		if not pdef or not pdef.buildable_to then
			return itemstack
		end
	end

	local player_name = placer:get_player_name()
	-- Check sapling position for protection
	if minetest.is_protected(pos, player_name) then
		minetest.record_protection_violation(pos, player_name)
		return itemstack
	end
	-- Check tree volume for protection
	if base.intersects_protection(
			vector.add(pos, minp_relative),
			vector.add(pos, maxp_relative),
			player_name,
			interval) then
		minetest.record_protection_violation(pos, player_name)
		-- Print extra information to explain
		minetest.chat_send_player(player_name, "Tree will intersect protection")
		return itemstack
	end

	minetest.log("action", player_name .. " places node "
			.. sapling_name .. " at " .. minetest.pos_to_string(pos))

	local take_item = not (creative and creative.is_enabled_for
		and creative.is_enabled_for(player_name))
	local newnode = {name = sapling_name}
	local ndef = minetest.registered_nodes[sapling_name]
	minetest.set_node(pos, newnode)

	-- Run callback
	if ndef and ndef.after_place_node then
		-- Deepcopy place_to and pointed_thing because callback can modify it
		if ndef.after_place_node(table.copy(pos), placer,
				itemstack, table.copy(pointed_thing)) then
			take_item = false
		end
	end

	-- Run script hook
	for _, callback in ipairs(minetest.registered_on_placenodes) do
		-- Deepcopy pos, node and pointed_thing because callback can modify them
		if callback(table.copy(pos), table.copy(newnode),
				placer, table.copy(node or {}),
				itemstack, table.copy(pointed_thing)) then
			take_item = false
		end
	end

	if take_item then
		itemstack:take_item()
	end

	return itemstack
end


--
-- register trees for leafdecay
--

base.register_leafdecay({
	trunks = {"base:tree"},
	leaves = {"base:apple", "base:leaves"},
	radius = 3,
})

base.register_leafdecay({
	trunks = {"base:jungletree"},
	leaves = {"base:jungleleaves"},
	radius = 2,
})

base.register_leafdecay({
	trunks = {"base:pine_tree"},
	leaves = {"base:pine_needles"},
	radius = 2,
})

base.register_leafdecay({
	trunks = {"base:acacia_tree"},
	leaves = {"base:acacia_leaves"},
	radius = 2,
})

base.register_leafdecay({
	trunks = {"base:aspen_tree"},
	leaves = {"base:aspen_leaves"},
	radius = 3,
})

base.register_leafdecay({
	trunks = {"base:bush_stem"},
	leaves = {"base:bush_leaves"},
	radius = 1,
})

base.register_leafdecay({
	trunks = {"base:acacia_bush_stem"},
	leaves = {"base:acacia_bush_leaves"},
	radius = 1,
})
