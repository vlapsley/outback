--[[
	Base nodes
--]]


--
-- Stone
--

minetest.register_node("outback:red_sandstone", {
	description = "Red Sandstone",
	tiles = {"ob_red_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	drop = 'outback:red_sandstone_cobble',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:red_sandstone_cobble", {
	description = "Red Sandstone Cobble",
	tiles = {"ob_red_sandstone_cobble.png"},
	groups = {crumbly = 1, cracky = 3, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:red_sandstonebrick", {
	description = "Red Sandstone Brick",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"ob_red_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:sandstone_cobble", {
	description = "Sandstone Cobble",
	tiles = {"ob_sandstone_cobble.png"},
	groups = {crumbly = 1, cracky = 3, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:basalt", {
	description = "Basalt",
	tiles = {"ob_basalt.png"},
	groups = {cracky = 2, stone = 1},
	drop = "outback:basalt_cobble",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:basalt_cobble", {
	description = "Basalt Cobble",
	tiles = {"ob_basalt_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:basalt_brick", {
	description = "Basalt Brick",
	tiles = {"ob_basalt_brick.png"},
	is_ground_content = false,
	groups = {cracky = 1, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:diorite", {
	description = "Diorite",
	tiles = {"ob_diorite.png"},
	groups = {cracky = 2, stone = 1},
	drop = 'outback:diorite_cobble',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:diorite_cobble", {
	description = "Diorite Cobble",
	tiles = {"ob_diorite_cobble.png"},
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:diorite_brick", {
	description = "Diorite Brick",
	tiles = {"ob_diorite_brick.png"},
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:limestone", {
	description = "Limestone",
	tiles = {"ob_limestone.png"},
	drop = 'outback:limestone_cobble',
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:limestone_cobble", {
	description = "Limestone Cobble",
	tiles = {"ob_limestone_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:limestone_brick", {
	description = "Limestone Brick",
	tiles = {"ob_limestone_brick.png"},
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:marble", {
	description = "Marble",
	tiles = {"ob_marble.png"},
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:marble_tile", {
	description = "Marble Tile",
	tiles = {"ob_marble_tile.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("outback:shale", {
	description = "Shale",
	tiles = {"ob_shale.png","ob_shale.png","ob_shale_side.png"},
	is_ground_content = true,
	groups = {crumbly = 2, cracky = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("outback:slate", {
	description = "Slate",
	tiles = {"ob_slate.png","ob_slate.png","ob_slate_side.png"},
	is_ground_content = true,
	drop = 'outback:slate_rubble',
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("outback:slate_rubble", {
	description = "Slate Rubble",
	tiles = {"ob_slate_rubble.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("outback:slate_brick", {
	description = "Slate Brick",
	tiles = {"ob_slate_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("outback:slate_tile", {
	description = "Slate Tile",
	tiles = {"ob_slate_tile.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults()
})


--
-- Soft / Non-Stone
--

minetest.register_node("outback:red_dirt", {
	description = "Red Dirt",
	tiles = {"ob_red_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("outback:red_sand", {
	description = "Red Sand",
	tiles = {"ob_red_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("outback:red_gravel", {
	description = "Red Gravel",
	tiles = {"ob_red_gravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	sounds = default.node_sound_gravel_defaults(),
})

minetest.register_node("outback:mangrove_mud", {
	description = "Mangrove Mud",
	tiles = {"ob_mangrove_mud.png"},
	groups = {crumbly = 1, soil = 1, disable_jump = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "ob_mangrove_mud", gain = 0.4},
		dug = {name = "ob_mangrove_mud", gain = 0.4},
	}),
})

minetest.register_node("outback:mineral_salt", {
	description = "Salt Mineral",
	tiles = {"ob_red_sand.png^ob_mineral_salt.png"},
	paramtype = "light",
	is_ground_content = true,
	groups = {crumbly = 2, cracky = 2},
	drop = {
		items = {
			{items = {"outback:red_sand"} },
			{items = {"outback:salt"} }
		}
	},
	sounds = default.node_sound_dirt_defaults,
})

minetest.register_node("outback:salt_block", {
	description = "Salt Block",
	tiles = {"default_clay.png^ob_mineral_salt.png"},
	is_ground_content = false,
	groups = {crumbly = 2, cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_stone_defaults(),
})


--
-- Ores
--

minetest.register_node("outback:diorite_with_coal", {
	description = "Coal Ore",
	tiles = {"ob_diorite.png^default_mineral_coal.png"},
	groups = {cracky = 3},
	drop = 'default:coal_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:granite_with_iron", {
	description = "Iron Ore",
	tiles = {"technic_granite.png^default_mineral_iron.png"},
	groups = {cracky = 2},
	drop = 'default:iron_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:granite_with_copper", {
	description = "Copper Ore",
	tiles = {"technic_granite.png^default_mineral_copper.png"},
	groups = {cracky = 2},
	drop = 'default:copper_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:granite_with_opal", {
	description = "Opal Ore",
	tiles = {"technic_granite.png^ob_mineral_opal.png"},
	groups = {cracky = 2},
	drop = "outback:opal",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:granite_with_tin", {
	description = "Tin Ore",
	tiles = {"technic_granite.png^default_mineral_tin.png"},
	groups = {cracky = 2},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:stone_with_aluminium", {
	description = "Aluminium Ore",
	tiles = {"default_stone.png^ob_mineral_aluminium.png"},
	groups = {cracky = 2},
	drop = "outback:aluminium_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:aluminiumblock", {
	description = "Aluminium Block",
	tiles = {"ob_aluminium_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("outback:stone_with_nickel", {
	description = "Nickel Ore",
	tiles = {"default_stone.png^ob_mineral_nickel.png"},
	groups = {cracky = 2},
	drop = "outback:nickel_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:nickelblock", {
	description = "Nickel Block",
	tiles = {"ob_nickel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("outback:stone_with_silver", {
	description = "Silver Ore",
	tiles = {"default_stone.png^ob_mineral_silver.png" },
	groups = {cracky = 3},
	drop = "outback:silver_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:silverblock", {
	description = "Silver Block",
	tiles = {"ob_silver_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("outback:basalt_with_diamond", {
	description = "Diamond Ore",
	tiles = {"ob_basalt.png^default_mineral_diamond.png"},
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:stone_with_agate", {
	description = "Agate Ore",
	tiles = {"default_stone.png^ob_mineral_agate.png"},
	groups = {cracky = 1},
	drop = "outback:agate",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:stone_with_amethyst", {
	description = "Amethyst Ore",
	tiles = {"default_stone.png^ob_mineral_amethyst.png"},
	groups = {cracky = 1},
	drop = "outback:amethyst",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:granite_with_amethyst", {
	description = "Amethyst Ore",
	tiles = {"technic_granite.png^ob_mineral_amethyst.png"},
	groups = {cracky = 1},
	drop = "outback:amethyst",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:stone_with_citrine", {
	description = "Citrine Ore",
	tiles = {"default_stone.png^ob_mineral_citrine.png"},
	groups = {cracky = 1},
	drop = "outback:citrine",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:stone_with_emerald", {
	description = "Emerald Ore",
	tiles = {"default_stone.png^ob_mineral_emerald.png"},
	groups = {cracky = 1},
	drop = "outback:emerald",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:granite_with_emerald", {
	description = "Emerald Ore",
	tiles = {"technic_granite.png^ob_mineral_emerald.png"},
	groups = {cracky = 1},
	drop = "outback:emerald",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:stone_with_jade", {
	description = "Jade Ore",
	tiles = {"default_stone.png^ob_mineral_jade.png"},
	groups = {cracky = 1},
	drop = "outback:jade",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:stone_with_ruby", {
	description = "Ruby Ore",
	tiles = {"default_stone.png^ob_mineral_ruby.png"},
	groups = {cracky = 1},
	drop = "outback:ruby",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:stone_with_sapphire", {
	description = "Sapphire Ore",
	tiles = {"default_stone.png^ob_mineral_sapphire.png"},
	groups = {cracky = 1},
	drop = "outback:sapphire",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:stone_with_smoky_quartz", {
	description = "Smoky Quartz Ore",
	tiles = {"default_stone.png^ob_mineral_smoky_quartz.png"},
	groups = {cracky = 1},
	drop = "outback:smoky_quartz",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("outback:granite_with_smoky_quartz", {
	description = "Smoky Quartz Ore",
	tiles = {"technic_granite.png^ob_mineral_smoky_quartz.png"},
	groups = {cracky = 1},
	drop = "outback:smoky_quartz",
	sounds = default.node_sound_stone_defaults(),
})

