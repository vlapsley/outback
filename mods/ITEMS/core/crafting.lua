--[[
	Core crafting
--]]

minetest.register_craft({
	output = 'core:wood 4',
	recipe = {
		{'core:tree'},
	}
})

minetest.register_craft({
	output = 'core:junglewood 4',
	recipe = {
		{'core:jungletree'},
	}
})

minetest.register_craft({
	output = 'core:pine_wood 4',
	recipe = {
		{'core:pine_tree'},
	}
})

minetest.register_craft({
	output = 'core:acacia_wood 4',
	recipe = {
		{'core:acacia_tree'},
	}
})

minetest.register_craft({
	output = 'core:aspen_wood 4',
	recipe = {
		{'core:aspen_tree'},
	}
})

minetest.register_craft({
	output = 'core:wood',
	recipe = {
		{'core:bush_stem'},
	}
})

minetest.register_craft({
	output = 'core:acacia_wood',
	recipe = {
		{'core:acacia_bush_stem'},
	}
})

minetest.register_craft({
	output = 'core:stick 4',
	recipe = {
		{'group:wood'},
	}
})

minetest.register_craft({
	output = 'core:sign_wall_steel 3',
	recipe = {
		{'core:steel_ingot', 'core:steel_ingot', 'core:steel_ingot'},
		{'core:steel_ingot', 'core:steel_ingot', 'core:steel_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'core:sign_wall_wood 3',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'core:coalblock',
	recipe = {
		{'core:coal_lump', 'core:coal_lump', 'core:coal_lump'},
		{'core:coal_lump', 'core:coal_lump', 'core:coal_lump'},
		{'core:coal_lump', 'core:coal_lump', 'core:coal_lump'},
	}
})

minetest.register_craft({
	output = 'core:coal_lump 9',
	recipe = {
		{'core:coalblock'},
	}
})

minetest.register_craft({
	output = 'core:steelblock',
	recipe = {
		{'core:steel_ingot', 'core:steel_ingot', 'core:steel_ingot'},
		{'core:steel_ingot', 'core:steel_ingot', 'core:steel_ingot'},
		{'core:steel_ingot', 'core:steel_ingot', 'core:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'core:steel_ingot 9',
	recipe = {
		{'core:steelblock'},
	}
})

minetest.register_craft({
	output = 'core:copperblock',
	recipe = {
		{'core:copper_ingot', 'core:copper_ingot', 'core:copper_ingot'},
		{'core:copper_ingot', 'core:copper_ingot', 'core:copper_ingot'},
		{'core:copper_ingot', 'core:copper_ingot', 'core:copper_ingot'},
	}
})

minetest.register_craft({
	output = 'core:copper_ingot 9',
	recipe = {
		{'core:copperblock'},
	}
})

minetest.register_craft({
	output = "core:tinblock",
	recipe = {
		{"core:tin_ingot", "core:tin_ingot", "core:tin_ingot"},
		{"core:tin_ingot", "core:tin_ingot", "core:tin_ingot"},
		{"core:tin_ingot", "core:tin_ingot", "core:tin_ingot"},
	}
})

minetest.register_craft({
	output = "core:tin_ingot 9",
	recipe = {
		{"core:tinblock"},
	}
})

minetest.register_craft({
	output = "core:bronze_ingot 9",
	recipe = {
		{"core:copper_ingot", "core:copper_ingot", "core:copper_ingot"},
		{"core:copper_ingot", "core:tin_ingot", "core:copper_ingot"},
		{"core:copper_ingot", "core:copper_ingot", "core:copper_ingot"},
	}
})

minetest.register_craft({
	output = 'core:bronzeblock',
	recipe = {
		{'core:bronze_ingot', 'core:bronze_ingot', 'core:bronze_ingot'},
		{'core:bronze_ingot', 'core:bronze_ingot', 'core:bronze_ingot'},
		{'core:bronze_ingot', 'core:bronze_ingot', 'core:bronze_ingot'},
	}
})

minetest.register_craft({
	output = 'core:bronze_ingot 9',
	recipe = {
		{'core:bronzeblock'},
	}
})

minetest.register_craft({
	output = 'core:goldblock',
	recipe = {
		{'core:gold_ingot', 'core:gold_ingot', 'core:gold_ingot'},
		{'core:gold_ingot', 'core:gold_ingot', 'core:gold_ingot'},
		{'core:gold_ingot', 'core:gold_ingot', 'core:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'core:gold_ingot 9',
	recipe = {
		{'core:goldblock'},
	}
})

minetest.register_craft({
	output = 'core:diamondblock',
	recipe = {
		{'core:diamond', 'core:diamond', 'core:diamond'},
		{'core:diamond', 'core:diamond', 'core:diamond'},
		{'core:diamond', 'core:diamond', 'core:diamond'},
	}
})

minetest.register_craft({
	output = 'core:diamond 9',
	recipe = {
		{'core:diamondblock'},
	}
})

minetest.register_craft({
	output = "core:sandstone",
	recipe = {
		{"core:sand", "core:sand"},
		{"core:sand", "core:sand"},
	}
})

minetest.register_craft({
	output = "core:sand 4",
	recipe = {
		{"core:sandstone"},
	}
})

minetest.register_craft({
	output = "core:sandstonebrick 4",
	recipe = {
		{"core:sandstone", "core:sandstone"},
		{"core:sandstone", "core:sandstone"},
	}
})

minetest.register_craft({
	output = "core:sandstone_block 9",
	recipe = {
		{"core:sandstone", "core:sandstone", "core:sandstone"},
		{"core:sandstone", "core:sandstone", "core:sandstone"},
		{"core:sandstone", "core:sandstone", "core:sandstone"},
	}
})

minetest.register_craft({
	output = "core:desert_sandstone",
	recipe = {
		{"core:desert_sand", "core:desert_sand"},
		{"core:desert_sand", "core:desert_sand"},
	}
})

minetest.register_craft({
	output = "core:desert_sand 4",
	recipe = {
		{"core:desert_sandstone"},
	}
})

minetest.register_craft({
	output = "core:desert_sandstone_brick 4",
	recipe = {
		{"core:desert_sandstone", "core:desert_sandstone"},
		{"core:desert_sandstone", "core:desert_sandstone"},
	}
})

minetest.register_craft({
	output = "core:desert_sandstone_block 9",
	recipe = {
		{"core:desert_sandstone", "core:desert_sandstone", "core:desert_sandstone"},
		{"core:desert_sandstone", "core:desert_sandstone", "core:desert_sandstone"},
		{"core:desert_sandstone", "core:desert_sandstone", "core:desert_sandstone"},
	}
})

minetest.register_craft({
	output = "core:silver_sandstone",
	recipe = {
		{"core:silver_sand", "core:silver_sand"},
		{"core:silver_sand", "core:silver_sand"},
	}
})

minetest.register_craft({
	output = "core:silver_sand 4",
	recipe = {
		{"core:silver_sandstone"},
	}
})

minetest.register_craft({
	output = "core:silver_sandstone_brick 4",
	recipe = {
		{"core:silver_sandstone", "core:silver_sandstone"},
		{"core:silver_sandstone", "core:silver_sandstone"},
	}
})

minetest.register_craft({
	output = "core:silver_sandstone_block 9",
	recipe = {
		{"core:silver_sandstone", "core:silver_sandstone", "core:silver_sandstone"},
		{"core:silver_sandstone", "core:silver_sandstone", "core:silver_sandstone"},
		{"core:silver_sandstone", "core:silver_sandstone", "core:silver_sandstone"},
	}
})

minetest.register_craft({
	output = 'core:clay',
	recipe = {
		{'core:clay_lump', 'core:clay_lump'},
		{'core:clay_lump', 'core:clay_lump'},
	}
})

minetest.register_craft({
	output = 'core:clay_lump 4',
	recipe = {
		{'core:clay'},
	}
})

minetest.register_craft({
	output = 'core:brick',
	recipe = {
		{'core:clay_brick', 'core:clay_brick'},
		{'core:clay_brick', 'core:clay_brick'},
	}
})

minetest.register_craft({
	output = 'core:clay_brick 4',
	recipe = {
		{'core:brick'},
	}
})

minetest.register_craft({
	output = 'core:paper',
	recipe = {
		{'core:papyrus', 'core:papyrus', 'core:papyrus'},
	}
})

minetest.register_craft({
	output = "core:ladder_wood 5",
	recipe = {
		{"group:stick", "", "group:stick"},
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "", "group:stick"},
	}
})

minetest.register_craft({
	output = 'core:ladder_steel 15',
	recipe = {
		{'core:steel_ingot', '', 'core:steel_ingot'},
		{'core:steel_ingot', 'core:steel_ingot', 'core:steel_ingot'},
		{'core:steel_ingot', '', 'core:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'core:mese',
	recipe = {
		{'core:mese_crystal', 'core:mese_crystal', 'core:mese_crystal'},
		{'core:mese_crystal', 'core:mese_crystal', 'core:mese_crystal'},
		{'core:mese_crystal', 'core:mese_crystal', 'core:mese_crystal'},
	}
})

minetest.register_craft({
	output = 'core:mese_crystal 9',
	recipe = {
		{'core:mese'},
	}
})

minetest.register_craft({
	output = 'core:mese_crystal_fragment 9',
	recipe = {
		{'core:mese_crystal'},
	}
})

minetest.register_craft({
	output = "core:mese_crystal",
	recipe = {
		{"core:mese_crystal_fragment", "core:mese_crystal_fragment", "core:mese_crystal_fragment"},
		{"core:mese_crystal_fragment", "core:mese_crystal_fragment", "core:mese_crystal_fragment"},
		{"core:mese_crystal_fragment", "core:mese_crystal_fragment", "core:mese_crystal_fragment"},
	}
})

minetest.register_craft({
	output = 'core:meselamp',
	recipe = {
		{'core:glass'},
		{'core:mese_crystal'},
	}
})

minetest.register_craft({
	output = "core:mese_post_light 3",
	recipe = {
		{"", "core:glass", ""},
		{"core:mese_crystal", "core:mese_crystal", "core:mese_crystal"},
		{"", "group:wood", ""},
	}
})

minetest.register_craft({
	output = 'core:obsidian_shard 9',
	recipe = {
		{'core:obsidian'}
	}
})

minetest.register_craft({
	output = 'core:obsidian',
	recipe = {
		{'core:obsidian_shard', 'core:obsidian_shard', 'core:obsidian_shard'},
		{'core:obsidian_shard', 'core:obsidian_shard', 'core:obsidian_shard'},
		{'core:obsidian_shard', 'core:obsidian_shard', 'core:obsidian_shard'},
	}
})

minetest.register_craft({
	output = 'core:obsidianbrick 4',
	recipe = {
		{'core:obsidian', 'core:obsidian'},
		{'core:obsidian', 'core:obsidian'}
	}
})

minetest.register_craft({
	output = 'core:obsidian_block 9',
	recipe = {
		{'core:obsidian', 'core:obsidian', 'core:obsidian'},
		{'core:obsidian', 'core:obsidian', 'core:obsidian'},
		{'core:obsidian', 'core:obsidian', 'core:obsidian'},
	}
})

minetest.register_craft({
	output = 'core:stonebrick 4',
	recipe = {
		{'core:stone', 'core:stone'},
		{'core:stone', 'core:stone'},
	}
})

minetest.register_craft({
	output = 'core:stone_block 9',
	recipe = {
		{'core:stone', 'core:stone', 'core:stone'},
		{'core:stone', 'core:stone', 'core:stone'},
		{'core:stone', 'core:stone', 'core:stone'},
	}
})

minetest.register_craft({
	output = 'core:desert_stonebrick 4',
	recipe = {
		{'core:desert_stone', 'core:desert_stone'},
		{'core:desert_stone', 'core:desert_stone'},
	}
})

minetest.register_craft({
	output = 'core:desert_stone_block 9',
	recipe = {
		{'core:desert_stone', 'core:desert_stone', 'core:desert_stone'},
		{'core:desert_stone', 'core:desert_stone', 'core:desert_stone'},
		{'core:desert_stone', 'core:desert_stone', 'core:desert_stone'},
	}
})

minetest.register_craft({
	output = 'core:snowblock',
	recipe = {
		{'core:snow', 'core:snow', 'core:snow'},
		{'core:snow', 'core:snow', 'core:snow'},
		{'core:snow', 'core:snow', 'core:snow'},
	}
})

minetest.register_craft({
	output = 'core:snow 9',
	recipe = {
		{'core:snowblock'},
	}
})

--
-- Crafting (tool repair)
--
minetest.register_craft({
	type = "toolrepair",
	additional_wear = -0.02,
})

--
-- Cooking recipes
--

minetest.register_craft({
	type = "cooking",
	output = "core:glass",
	recipe = "group:sand",
})

minetest.register_craft({
	type = "cooking",
	output = "core:obsidian_glass",
	recipe = "core:obsidian_shard",
})

minetest.register_craft({
	type = "cooking",
	output = "core:stone",
	recipe = "core:cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "core:stone",
	recipe = "core:mossycobble",
})

minetest.register_craft({
	type = "cooking",
	output = "core:desert_stone",
	recipe = "core:desert_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "core:steel_ingot",
	recipe = "core:iron_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "core:copper_ingot",
	recipe = "core:copper_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "core:tin_ingot",
	recipe = "core:tin_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "core:gold_ingot",
	recipe = "core:gold_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "core:clay_brick",
	recipe = "core:clay_lump",
})


--
-- Fuels
--

-- Support use of group:tree
minetest.register_craft({
	type = "fuel",
	recipe = "group:tree",
	burntime = 30,
})

-- Burn time for all woods are in order of wood density,
-- which is also the order of wood colour darkness:
-- aspen, pine, apple, acacia, jungle

minetest.register_craft({
	type = "fuel",
	recipe = "core:aspen_tree",
	burntime = 22,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:pine_tree",
	burntime = 26,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:tree",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:acacia_tree",
	burntime = 34,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:jungletree",
	burntime = 38,
})


-- Support use of group:wood
minetest.register_craft({
	type = "fuel",
	recipe = "group:wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:aspen_wood",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:pine_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:acacia_wood",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:junglewood",
	burntime = 9,
})


-- Support use of group:sapling
minetest.register_craft({
	type = "fuel",
	recipe = "group:sapling",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:bush_sapling",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:acacia_bush_sapling",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:aspen_sapling",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:pine_sapling",
	burntime = 9,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:sapling",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:acacia_sapling",
	burntime = 11,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:junglesapling",
	burntime = 12,
})


minetest.register_craft({
	type = "fuel",
	recipe = "core:fence_aspen_wood",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:fence_pine_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:fence_wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:fence_acacia_wood",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:fence_junglewood",
	burntime = 9,
})


minetest.register_craft({
	type = "fuel",
	recipe = "core:bush_stem",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:acacia_bush_stem",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:junglegrass",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:leaves",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:cactus",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:papyrus",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:ladder_wood",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:lava_source",
	burntime = 60,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:apple",
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:coal_lump",
	burntime = 40,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:coalblock",
	burntime = 370,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:grass_1",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:dry_grass_1",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:paper",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "core:dry_shrub",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:stick",
	burntime = 1,
})

