-- Code of rubber tree by PilzAdam

local S = technic.worldgen.gettext

minetest.register_node(":moretrees:rubber_tree_sapling", {
	description = S("Rubber Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"technic_rubber_sapling.png"},
	inventory_image = "technic_rubber_sapling.png",
	wield_image = "technic_rubber_sapling.png",
	paramtype = "light",
	walkable = false,
	groups = {dig_immediate=3, flammable=2, sapling=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	type = "fuel",
	recipe = "moretrees:rubber_tree_sapling",
	burntime = 10
})

minetest.register_node(":moretrees:rubber_tree_trunk", {
	description = S("Rubber Tree"),
	tiles = {"default_tree_top.png", "default_tree_top.png",
		"technic_rubber_tree_full.png"},
	groups = {tree=1, snappy=1, choppy=2, oddly_breakable_by_hand=1,
		flammable=2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node(":moretrees:rubber_tree_trunk_empty", {
	description = S("Rubber Tree"),
	tiles = {"default_tree_top.png", "default_tree_top.png",
		"technic_rubber_tree_empty.png"},
	groups = {tree=1, snappy=1, choppy=2, oddly_breakable_by_hand=1,
			flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node(":moretrees:rubber_tree_leaves", {
	drawtype = "allfaces_optional",
	description = S("Rubber Tree Leaves"),
	tiles = {"technic_rubber_leaves.png"},
	paramtype = "light",
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {{
			items = {"moretrees:rubber_tree_sapling"},
			rarity = 20,
		},
		{
			items = {"moretrees:rubber_tree_leaves"},
		}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

technic.rubber_tree_model={
	axiom = "FFFFA",
	rules_a = "[&FFBFA]////[&BFFFA]////[&FBFFA]",
	rules_b = "[&FFA]////[&FFA]////[&FFA]",
	trunk = "moretrees:rubber_tree_trunk",
	leaves = "moretrees:rubber_tree_leaves",
	angle = 35,
	iterations = 3,
	random_level = 1,
	trunk_type = "double",
	thin_branches = true
}

minetest.register_abm({
	nodenames = {"moretrees:rubber_tree_sapling"},
	label = "Worldgen: grow rubber tree sapling",
	interval = 60,
	chance = 20,
	action = function(pos, node)
		minetest.remove_node(pos)
		minetest.spawn_tree(pos, technic.rubber_tree_model)
	end
})
