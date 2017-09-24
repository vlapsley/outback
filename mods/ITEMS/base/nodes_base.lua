--[[
	Base base nodes
--]]


--
-- Stone
--

minetest.register_node("base:red_sandstone", {
	description = "Red Sandstone",
	tiles = {"base_red_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	drop = 'base:red_sandstone_cobble',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:red_sandstonebrick", {
	description = "Red Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"base_red_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:sandstone_cobble", {
	description = "Sandstone Cobble",
	tiles = {"base_sandstone_cobble.png"},
	groups = {crumbly = 1, cracky = 3, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:basalt", {
	description = "Basalt",
	tiles = {"base_basalt.png"},
	groups = {cracky = 2, stone = 1},
	drop = "base:basalt_cobble",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:basalt_cobble", {
	description = "Basalt Cobble",
	tiles = {"base_basalt_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:basalt_brick", {
	description = "Basalt Brick",
	tiles = {"base_basalt_brick.png"},
	is_ground_content = false,
	groups = {cracky = 1, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:diorite", {
	description = "Diorite",
	tiles = {"base_diorite.png"},
	groups = {cracky = 2, stone = 1},
	drop = 'base:diorite_cobble',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:diorite_cobble", {
	description = "Diorite Cobble",
	tiles = {"base_diorite_cobble.png"},
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:diorite_brick", {
	description = "Diorite Brick",
	tiles = {"base_diorite_brick.png"},
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:limestone", {
	description = "Limestone",
	tiles = {"base_limestone.png"},
	drop = 'base:limestone_cobble',
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:limestone_cobble", {
	description = "Limestone Cobble",
	tiles = {"base_limestone_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:limestone_brick", {
	description = "Limestone Brick",
	tiles = {"base_limestone_brick.png"},
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:marble", {
	description = "Marble",
	tiles = {"base_marble.png"},
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:marble_tile", {
	description = "Marble Tile",
	tiles = {"base_marble_tile.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("base:shale", {
	description = "Shale",
	tiles = {"base_shale.png","base_shale.png","base_shale_side.png"},
	is_ground_content = true,
	groups = {crumbly = 2, cracky = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("base:slate", {
	description = "Slate",
	tiles = {"base_slate.png","base_slate.png","base_slate_side.png"},
	is_ground_content = true,
	drop = 'base:slate_rubble',
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("base:slate_rubble", {
	description = "Slate Rubble",
	tiles = {"base_slate_rubble.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("base:slate_brick", {
	description = "Slate Brick",
	tiles = {"base_slate_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("base:slate_tile", {
	description = "Slate Tile",
	tiles = {"base_slate_tile.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults()
})


--
-- Soft / Non-Stone
--

minetest.register_node("base:red_dirt", {
	description = "Red Dirt",
	tiles = {"base_red_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("base:red_sand", {
	description = "Red Sand",
	tiles = {"base_red_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("base:red_gravel", {
	description = "Red Gravel",
	tiles = {"base_red_gravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	sounds = default.node_sound_gravel_defaults(),
})

minetest.register_node("base:mangrove_mud", {
	description = "Mangrove Mud",
	tiles = {"base_mangrove_mud.png"},
	groups = {crumbly = 3, soil = 1, disable_jump = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "base_mangrove_mud", gain = 0.4},
		dug = {name = "base_mangrove_mud", gain = 0.4},
	}),
})

minetest.register_node("base:mineral_salt", {
	description = "Salt Mineral",
	tiles = {"base_red_sand.png^base_mineral_salt.png"},
	paramtype = "light",
	is_ground_content = true,
	groups = {snappy = 2, cracky = 3, oddly_breakable_by_hand = 3},
	drop = {
		items = {
			{items = {"base:red_sand"} },
			{items = {"base:salt"} }
		}
	},
	sounds = default.node_sound_dirt_defaults,
})

minetest.register_node( "base:salt_block", {
	description = "Salt Block",
	tiles = {"default_clay.png^base_salt_block.png"},
	is_ground_content = false,
	groups = {snappy = 2, cracky = 3, oddly_breakable_by_hand = 3},
	on_use = minetest.item_eat(3),
	sounds = default.node_sound_stone_defaults(),
})


--
-- Ores
--

minetest.register_node("base:diorite_with_coal", {
	description = "Coal Ore",
	tiles = {"base_diorite.png^default_mineral_coal.png"},
	groups = {cracky = 3},
	drop = 'default:coal_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:granite_with_iron", {
	description = "Iron Ore",
	tiles = {"technic_granite.png^default_mineral_iron.png"},
	groups = {cracky = 2},
	drop = 'default:iron_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:granite_with_copper", {
	description = "Copper Ore",
	tiles = {"technic_granite.png^default_mineral_copper.png"},
	groups = {cracky = 2},
	drop = 'default:copper_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:granite_with_opal", {
	description = "Opal Ore",
	tiles = {"technic_granite.png^base_mineral_opal.png"},
	groups = {cracky = 2},
	drop = "base:opal",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:granite_with_tin", {
	description = "Tin Ore",
	tiles = {"technic_granite.png^default_mineral_tin.png"},
	groups = {cracky = 2},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:stone_with_aluminium", {
	description = "Aluminium Ore",
	tiles = {"default_stone.png^base_mineral_aluminium.png"},
	groups = {cracky = 2},
	drop = "base:aluminium_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:aluminiumblock", {
	description = "Aluminium Block",
	tiles = {"base_aluminium_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("base:stone_with_nickel", {
	description = "Nickel Ore",
	tiles = {"default_stone.png^base_mineral_nickel.png"},
	groups = {cracky = 2},
	drop = "base:nickel_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:nickelblock", {
	description = "Nickel Block",
	tiles = {"base_nickel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("base:stone_with_silver", {
	description = "Silver Ore",
	tiles = {"default_stone.png^base_mineral_silver.png" },
	groups = {cracky = 3},
	drop = "base:silver_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:silverblock", {
	description = "Silver Block",
	tiles = {"base_silver_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("base:basalt_with_diamond", {
	description = "Diamond Ore",
	tiles = {"base_basalt.png^default_mineral_diamond.png"},
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:stone_with_agate", {
	description = "Agate Ore",
	tiles = {"default_stone.png^base_mineral_agate.png"},
	groups = {cracky = 1},
	drop = "base:agate",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:stone_with_amethyst", {
	description = "Amethyst Ore",
	tiles = {"default_stone.png^base_mineral_amethyst.png"},
	groups = {cracky = 1},
	drop = "base:amethyst",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:granite_with_amethyst", {
	description = "Amethyst Ore",
	tiles = {"technic_granite.png^base_mineral_amethyst.png"},
	groups = {cracky = 1},
	drop = "base:amethyst",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:stone_with_citrine", {
	description = "Citrine Ore",
	tiles = {"default_stone.png^base_mineral_citrine.png"},
	groups = {cracky = 1},
	drop = "base:citrine",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:stone_with_emerald", {
	description = "Emerald Ore",
	tiles = {"default_stone.png^base_mineral_emerald.png"},
	groups = {cracky = 1},
	drop = "base:emerald",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:granite_with_emerald", {
	description = "Emerald Ore",
	tiles = {"technic_granite.png^base_mineral_emerald.png"},
	groups = {cracky = 1},
	drop = "base:emerald",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:stone_with_jade", {
	description = "Jade Ore",
	tiles = {"default_stone.png^base_mineral_jade.png"},
	groups = {cracky = 1},
	drop = "base:jade",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:stone_with_ruby", {
	description = "Ruby Ore",
	tiles = {"default_stone.png^base_mineral_ruby.png"},
	groups = {cracky = 1},
	drop = "base:ruby",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:stone_with_sapphire", {
	description = "Sapphire Ore",
	tiles = {"default_stone.png^base_mineral_sapphire.png"},
	groups = {cracky = 1},
	drop = "base:sapphire",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:stone_with_smoky_quartz", {
	description = "Smoky Quartz Ore",
	tiles = {"default_stone.png^base_mineral_smoky_quartz.png"},
	groups = {cracky = 1},
	drop = "base:smoky_quartz",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("base:granite_with_smoky_quartz", {
	description = "Smoky Quartz Ore",
	tiles = {"technic_granite.png^base_mineral_smoky_quartz.png"},
	groups = {cracky = 1},
	drop = "base:smoky_quartz",
	sounds = default.node_sound_stone_defaults(),
})

