--[[
	Core plant nodes
--]]


minetest.register_node("core:cactus", {
	description = "Cactus",
	tiles = {"core_cactus_top.png", "core_cactus_top.png",
		"core_cactus_side.png"},
	paramtype2 = "facedir",
	groups = {choppy = 3},
	sounds = core.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
})

minetest.register_node("core:papyrus", {
	description = "Papyrus",
	drawtype = "plantlike",
	tiles = {"core_papyrus.png"},
	inventory_image = "core_papyrus.png",
	wield_image = "core_papyrus.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
	groups = {snappy = 3, flammable = 2},
	sounds = core.node_sound_leaves_defaults(),

	after_dig_node = function(pos, node, metadata, digger)
		core.dig_up(pos, node, digger)
	end,
})

minetest.register_node("core:dry_shrub", {
	description = "Dry Shrub",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"core_dry_shrub.png"},
	inventory_image = "core_dry_shrub.png",
	wield_image = "core_dry_shrub.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 4 / 16, 5 / 16},
	},
})

minetest.register_node("core:junglegrass", {
	description = "Jungle Grass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.69,
	tiles = {"core_junglegrass.png"},
	inventory_image = "core_junglegrass.png",
	wield_image = "core_junglegrass.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 1.19, 7 / 16},
	},
})


minetest.register_node("core:grass_1", {
	description = "Grass",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"core_grass_1.png"},
	-- Use texture of a taller grass stage in inventory
	inventory_image = "core_grass_3.png",
	wield_image = "core_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("core:grass_" .. math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("core:grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("core:grass_" .. i, {
		description = "Grass",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"core_grass_" .. i .. ".png"},
		inventory_image = "core_grass_" .. i .. ".png",
		wield_image = "core_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "core:grass_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1, flammable = 1},
		sounds = core.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end


minetest.register_node("core:dry_grass_1", {
	description = "Dry Grass",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"core_dry_grass_1.png"},
	inventory_image = "core_dry_grass_3.png",
	wield_image = "core_dry_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, flora = 1,
		attached_node = 1, dry_grass = 1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random dry grass node
		local stack = ItemStack("core:dry_grass_" .. math.random(1, 5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("core:dry_grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("core:dry_grass_" .. i, {
		description = "Dry Grass",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"core_dry_grass_" .. i .. ".png"},
		inventory_image = "core_dry_grass_" .. i .. ".png",
		wield_image = "core_dry_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory=1, dry_grass = 1},
		drop = "core:dry_grass_1",
		sounds = core.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -1 / 16, 6 / 16},
		},
	})
end


minetest.register_node("core:bush_stem", {
	description = "Bush Stem",
	drawtype = "plantlike",
	visual_scale = 1.41,
	tiles = {"core_bush_stem.png"},
	inventory_image = "core_bush_stem.png",
	wield_image = "core_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = core.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
	},
})

minetest.register_node("core:bush_leaves", {
	description = "Bush Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"core_leaves_simple.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"core:bush_sapling"}, rarity = 5},
			{items = {"core:bush_leaves"}}
		}
	},
	sounds = core.node_sound_leaves_defaults(),

	after_place_node = core.after_place_leaves,
})

minetest.register_node("core:bush_sapling", {
	description = "Bush Sapling",
	drawtype = "plantlike",
	tiles = {"core_bush_sapling.png"},
	inventory_image = "core_bush_sapling.png",
	wield_image = "core_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = core.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = core.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(1200, 2400))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = core.sapling_on_place(itemstack, placer, pointed_thing,
			"core:bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

minetest.register_node("core:acacia_bush_stem", {
	description = "Acacia Bush Stem",
	drawtype = "plantlike",
	visual_scale = 1.41,
	tiles = {"core_acacia_bush_stem.png"},
	inventory_image = "core_acacia_bush_stem.png",
	wield_image = "core_acacia_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = core.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
	},
})

minetest.register_node("core:acacia_bush_leaves", {
	description = "Acacia Bush Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"core_acacia_leaves_simple.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"core:acacia_bush_sapling"}, rarity = 5},
			{items = {"core:acacia_bush_leaves"}}
		}
	},
	sounds = core.node_sound_leaves_defaults(),

	after_place_node = core.after_place_leaves,
})

minetest.register_node("core:acacia_bush_sapling", {
	description = "Acacia Bush Sapling",
	drawtype = "plantlike",
	tiles = {"core_acacia_bush_sapling.png"},
	inventory_image = "core_acacia_bush_sapling.png",
	wield_image = "core_acacia_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = core.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 2 / 16, 3 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = core.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(1200, 2400))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = core.sapling_on_place(itemstack, placer, pointed_thing,
			"core:acacia_bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

