--[[
	Base plant nodes
--]]


minetest.register_node("base:cactus", {
	description = "Cactus",
	tiles = {"base_cactus_top.png", "base_cactus_top.png",
		"base_cactus_side.png"},
	paramtype2 = "facedir",
	groups = {choppy = 3},
	sounds = base.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
})

minetest.register_node("base:papyrus", {
	description = "Papyrus",
	drawtype = "plantlike",
	tiles = {"base_papyrus.png"},
	inventory_image = "base_papyrus.png",
	wield_image = "base_papyrus.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
	groups = {snappy = 3, flammable = 2},
	sounds = base.node_sound_leaves_defaults(),

	after_dig_node = function(pos, node, metadata, digger)
		base.dig_up(pos, node, digger)
	end,
})

minetest.register_node("base:dry_shrub", {
	description = "Dry Shrub",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"base_dry_shrub.png"},
	inventory_image = "base_dry_shrub.png",
	wield_image = "base_dry_shrub.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 4 / 16, 5 / 16},
	},
})

minetest.register_node("base:junglegrass", {
	description = "Jungle Grass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.69,
	tiles = {"base_junglegrass.png"},
	inventory_image = "base_junglegrass.png",
	wield_image = "base_junglegrass.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 1},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 1.19, 7 / 16},
	},
})


minetest.register_node("base:grass_1", {
	description = "Grass",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"base_grass_1.png"},
	-- Use texture of a taller grass stage in inventory
	inventory_image = "base_grass_3.png",
	wield_image = "base_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("base:grass_" .. math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("base:grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("base:grass_" .. i, {
		description = "Grass",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"base_grass_" .. i .. ".png"},
		inventory_image = "base_grass_" .. i .. ".png",
		wield_image = "base_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "base:grass_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1, flammable = 1},
		sounds = base.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end


minetest.register_node("base:dry_grass_1", {
	description = "Dry Grass",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"base_dry_grass_1.png"},
	inventory_image = "base_dry_grass_3.png",
	wield_image = "base_dry_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, flora = 1,
		attached_node = 1, dry_grass = 1},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random dry grass node
		local stack = ItemStack("base:dry_grass_" .. math.random(1, 5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("base:dry_grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("base:dry_grass_" .. i, {
		description = "Dry Grass",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"base_dry_grass_" .. i .. ".png"},
		inventory_image = "base_dry_grass_" .. i .. ".png",
		wield_image = "base_dry_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory=1, dry_grass = 1},
		drop = "base:dry_grass_1",
		sounds = base.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -1 / 16, 6 / 16},
		},
	})
end


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
	sounds = base.node_sound_leaves_defaults(),
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
	sounds = base.node_sound_leaves_defaults(),
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
	sounds = base.node_sound_leaves_defaults(),
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
	sounds = base.node_sound_leaves_defaults(),
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
	sounds = base.node_sound_wood_defaults(),
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
	sounds = base.node_sound_leaves_defaults(),
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
	sounds = base.node_sound_leaves_defaults(),
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
	sounds = base.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})

minetest.register_node("base:spinifex", {
	description = "Spinifex",
	drawtype = "plantlike",
	waving = 0,
	visual_scale = 1.2,
	tiles = {"base_spinifex.png"},
	inventory_image = "base_spinifex.png",
	wield_image = "base_spinifex.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 2, flammable = 1, flora = 1, attached_node = 1},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-8/16, -8/16, -8/16, 8/16, -5/16, 8/16},
	},
})


minetest.register_node("base:bush_stem", {
	description = "Bush Stem",
	drawtype = "plantlike",
	visual_scale = 1.41,
	tiles = {"base_bush_stem.png"},
	inventory_image = "base_bush_stem.png",
	wield_image = "base_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
	},
})

minetest.register_node("base:bush_leaves", {
	description = "Bush Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"base_leaves_simple.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:bush_sapling"}, rarity = 5},
			{items = {"base:bush_leaves"}}
		}
	},
	sounds = base.node_sound_leaves_defaults(),

	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:bush_sapling", {
	description = "Bush Sapling",
	drawtype = "plantlike",
	tiles = {"base_bush_sapling.png"},
	inventory_image = "base_bush_sapling.png",
	wield_image = "base_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(1200, 2400))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

minetest.register_node("base:acacia_bush_stem", {
	description = "Acacia Bush Stem",
	drawtype = "plantlike",
	visual_scale = 1.41,
	tiles = {"base_acacia_bush_stem.png"},
	inventory_image = "base_acacia_bush_stem.png",
	wield_image = "base_acacia_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = base.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
	},
})

minetest.register_node("base:acacia_bush_leaves", {
	description = "Acacia Bush Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"base_acacia_leaves_simple.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"base:acacia_bush_sapling"}, rarity = 5},
			{items = {"base:acacia_bush_leaves"}}
		}
	},
	sounds = base.node_sound_leaves_defaults(),

	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:acacia_bush_sapling", {
	description = "Acacia Bush Sapling",
	drawtype = "plantlike",
	tiles = {"base_acacia_bush_sapling.png"},
	inventory_image = "base_acacia_bush_sapling.png",
	wield_image = "base_acacia_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 2 / 16, 3 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(1200, 2400))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
			"base:acacia_bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
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
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:flame_grevillea_sapling", {
	description = "Flame Grevillea Sapling",
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
		fixed = {-5/16, -8/16, -5/16, 5/16, 6/16, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(1200, 2400))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
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
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
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
	on_timer = base.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 6/16, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(1200, 2400))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
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
	sounds = base.node_sound_leaves_defaults(),
	after_place_node = base.after_place_leaves,
})

minetest.register_node("base:waratah_sapling", {
	description = "Waratah Sapling",
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
		fixed = {-5/16, -8/16, -5/16, 5/16, 6/16, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = base.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = base.sapling_on_place(itemstack, placer, pointed_thing,
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


minetest.register_alias("default:bush_stem", "base:bush_stem")
minetest.register_alias("default:bush_leaves", "base:bush_leaves")
minetest.register_alias("default:acacia_bush_stem", "base:acacia_bush_stem")
minetest.register_alias("default:acacia_bush_leaves", "base:acacia_bush_leaves")
minetest.register_alias("default:cactus", "base:cactus")
minetest.register_alias("default:papyrus", "base:papyrus")

