--[[
	Base nodes
--]]


--
-- Stone
--

minetest.register_node("australia:red_sandstone", {
	description = "Red Sandstone",
	tiles = {"aus_red_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	drop = 'australia:red_sandstone_cobble',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:red_sandstonebrick", {
	description = "Red Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"aus_red_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:sandstone_cobble", {
	description = "Sandstone Cobble",
	tiles = {"aus_sandstone_cobble.png"},
	groups = {crumbly = 1, cracky = 3, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:basalt", {
	description = "Basalt",
	tiles = {"aus_basalt.png"},
	groups = {cracky = 2, stone = 1},
	drop = "australia:basalt_cobble",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:basalt_cobble", {
	description = "Basalt Cobble",
	tiles = {"aus_basalt_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:basalt_brick", {
	description = "Basalt Brick",
	tiles = {"aus_basalt_brick.png"},
	is_ground_content = false,
	groups = {cracky = 1, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:diorite", {
	description = "Diorite",
	tiles = {"aus_diorite.png"},
	groups = {cracky = 2, stone = 1},
	drop = 'australia:diorite_cobble',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:diorite_cobble", {
	description = "Diorite Cobble",
	tiles = {"aus_diorite_cobble.png"},
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:diorite_brick", {
	description = "Diorite Brick",
	tiles = {"aus_diorite_brick.png"},
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:limestone", {
	description = "Limestone",
	tiles = {"aus_limestone.png"},
	drop = 'australia:limestone_cobble',
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:limestone_cobble", {
	description = "Limestone Cobble",
	tiles = {"aus_limestone_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:limestone_brick", {
	description = "Limestone Brick",
	tiles = {"aus_limestone_brick.png"},
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:marble", {
	description = "Marble",
	tiles = {"aus_marble.png"},
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:marble_tile", {
	description = "Marble Tile",
	tiles = {"aus_marble_tile.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("australia:shale", {
	description = "Shale",
	tiles = {"aus_shale.png","aus_shale.png","aus_shale_side.png"},
	is_ground_content = true,
	groups = {crumbly = 2, cracky = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("australia:slate", {
	description = "Slate",
	tiles = {"aus_slate.png","aus_slate.png","aus_slate_side.png"},
	is_ground_content = true,
	drop = 'australia:slate_rubble',
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("australia:slate_rubble", {
	description = "Slate Rubble",
	tiles = {"aus_slate_rubble.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("australia:slate_brick", {
	description = "Slate Brick",
	tiles = {"aus_slate_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("australia:slate_tile", {
	description = "Slate Tile",
	tiles = {"aus_slate_tile.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults()
})


--
-- Soft / Non-Stone
--

minetest.register_node("australia:red_dirt", {
	description = "Red Dirt",
	tiles = {"aus_red_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("australia:red_sand", {
	description = "Red Sand",
	tiles = {"aus_red_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("australia:red_gravel", {
	description = "Red Gravel",
	tiles = {"aus_red_gravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	sounds = default.node_sound_gravel_defaults(),
})

minetest.register_node("australia:mangrove_mud", {
	description = "Mangrove Mud",
	tiles = {"aus_mangrove_mud.png"},
	groups = {crumbly = 3, soil = 1, disable_jump = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "aus_mangrove_mud", gain = 0.4},
		dug = {name = "aus_mangrove_mud", gain = 0.4},
	}),
})

minetest.register_node("australia:mineral_salt", {
	description = "Salt Mineral",
	tiles = {"aus_red_sand.png^aus_mineral_salt.png"},
	paramtype = "light",
	is_ground_content = true,
	groups = {snappy = 2, cracky = 3, oddly_breakable_by_hand = 3},
	drop = {
		items = {
			{items = {"australia:red_sand"} },
			{items = {"australia:salt"} }
		}
	},
	sounds = default.node_sound_dirt_defaults,
})

minetest.register_node( "australia:salt_block", {
	description = "Salt Block",
	tiles = {"default_clay.png^aus_salt_block.png"},
	is_ground_content = false,
	groups = {snappy = 2, cracky = 3, oddly_breakable_by_hand = 3},
	on_use = minetest.item_eat(3),
	sounds = default.node_sound_stone_defaults(),
})


--
-- Ores
--

minetest.register_node("australia:diorite_with_coal", {
	description = "Coal Ore",
	tiles = {"aus_diorite.png^default_mineral_coal.png"},
	groups = {cracky = 3},
	drop = 'default:coal_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:granite_with_iron", {
	description = "Iron Ore",
	tiles = {"technic_granite.png^default_mineral_iron.png"},
	groups = {cracky = 2},
	drop = 'default:iron_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:granite_with_copper", {
	description = "Copper Ore",
	tiles = {"technic_granite.png^default_mineral_copper.png"},
	groups = {cracky = 2},
	drop = 'default:copper_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:granite_with_opal", {
	description = "Opal Ore",
	tiles = {"technic_granite.png^aus_mineral_opal.png"},
	groups = {cracky = 2},
	drop = "australia:opal",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:granite_with_tin", {
	description = "Tin Ore",
	tiles = {"technic_granite.png^default_mineral_tin.png"},
	groups = {cracky = 2},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:stone_with_aluminium", {
	description = "Aluminium Ore",
	tiles = {"default_stone.png^aus_mineral_aluminium.png"},
	groups = {cracky = 2},
	drop = "australia:aluminium_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:aluminiumblock", {
	description = "Aluminium Block",
	tiles = {"aus_aluminium_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("australia:stone_with_nickel", {
	description = "Nickel Ore",
	tiles = {"default_stone.png^aus_mineral_nickel.png"},
	groups = {cracky = 2},
	drop = "australia:nickel_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:nickelblock", {
	description = "Nickel Block",
	tiles = {"aus_nickel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("australia:stone_with_silver", {
	description = "Silver Ore",
	tiles = {"default_stone.png^aus_mineral_silver.png" },
	groups = {cracky = 3},
	drop = "australia:silver_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:silverblock", {
	description = "Silver Block",
	tiles = {"aus_silver_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("australia:basalt_with_diamond", {
	description = "Diamond Ore",
	tiles = {"aus_basalt.png^default_mineral_diamond.png"},
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:stone_with_agate", {
	description = "Agate Ore",
	tiles = {"default_stone.png^aus_mineral_agate.png"},
	groups = {cracky = 1},
	drop = "australia:agate",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:stone_with_amethyst", {
	description = "Amethyst Ore",
	tiles = {"default_stone.png^aus_mineral_amethyst.png"},
	groups = {cracky = 1},
	drop = "australia:amethyst",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:granite_with_amethyst", {
	description = "Amethyst Ore",
	tiles = {"technic_granite.png^aus_mineral_amethyst.png"},
	groups = {cracky = 1},
	drop = "australia:amethyst",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:stone_with_citrine", {
	description = "Citrine Ore",
	tiles = {"default_stone.png^aus_mineral_citrine.png"},
	groups = {cracky = 1},
	drop = "australia:citrine",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:stone_with_emerald", {
	description = "Emerald Ore",
	tiles = {"default_stone.png^aus_mineral_emerald.png"},
	groups = {cracky = 1},
	drop = "australia:emerald",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:granite_with_emerald", {
	description = "Emerald Ore",
	tiles = {"technic_granite.png^aus_mineral_emerald.png"},
	groups = {cracky = 1},
	drop = "australia:emerald",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:stone_with_jade", {
	description = "Jade Ore",
	tiles = {"default_stone.png^aus_mineral_jade.png"},
	groups = {cracky = 1},
	drop = "australia:jade",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:stone_with_ruby", {
	description = "Ruby Ore",
	tiles = {"default_stone.png^aus_mineral_ruby.png"},
	groups = {cracky = 1},
	drop = "australia:ruby",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:stone_with_sapphire", {
	description = "Sapphire Ore",
	tiles = {"default_stone.png^aus_mineral_sapphire.png"},
	groups = {cracky = 1},
	drop = "australia:sapphire",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:stone_with_smoky_quartz", {
	description = "Smoky Quartz Ore",
	tiles = {"default_stone.png^aus_mineral_smoky_quartz.png"},
	groups = {cracky = 1},
	drop = "australia:smoky_quartz",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:granite_with_smoky_quartz", {
	description = "Smoky Quartz Ore",
	tiles = {"technic_granite.png^aus_mineral_smoky_quartz.png"},
	groups = {cracky = 1},
	drop = "australia:smoky_quartz",
	sounds = default.node_sound_stone_defaults(),
})

