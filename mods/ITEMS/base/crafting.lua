--[[
	Base crafting
--]]

minetest.register_craft({
	output = 'base:wood 4',
	recipe = {
		{'base:tree'},
	}
})

minetest.register_craft({
	output = 'base:junglewood 4',
	recipe = {
		{'base:jungletree'},
	}
})

minetest.register_craft({
	output = 'base:pine_wood 4',
	recipe = {
		{'base:pine_tree'},
	}
})

minetest.register_craft({
	output = 'base:acacia_wood 4',
	recipe = {
		{'base:acacia_tree'},
	}
})

minetest.register_craft({
	output = 'base:aspen_wood 4',
	recipe = {
		{'base:aspen_tree'},
	}
})

minetest.register_craft({
	output = "base:pine_wood 4",
	recipe = {
		{"base:arnhem_cypress_pine_tree"}
	}
})

minetest.register_craft({
	output = "base:eucalyptus_wood 4",
	recipe = {
		{"base:black_box_tree"}
	}
})

minetest.register_craft({
	output = "base:blackwood 4",
	recipe = {
		{"base:black_wattle_tree"}
	}
})

minetest.register_craft({
	output = "base:blue_gum 4",
	recipe = {
		{"base:blue_gum_tree"}
	}
})

minetest.register_craft({
	output = "base:wood 4",
	recipe = {
		{"base:boab_tree"}
	}
})

minetest.register_craft({
	output = "base:celery_top_pine 4",
	recipe = {
		{"base:celery_top_pine_tree"}
	}
})

minetest.register_craft({
	output = "base:acacia_wood 4",
	recipe = {
		{"base:coast_banksia_tree"}
	}
})

minetest.register_craft({
	output = "base:eucalyptus_wood 4",
	recipe = {
		{"base:coolabah_tree"}
	}
})

minetest.register_craft({
	output = "base:red_mahogany 4",
	recipe = {
		{"base:daintree_stringybark_tree"}
	}
})

-- Darwin Woollybutt
minetest.register_craft({
	output = "base:eucalyptus_wood 4",
	recipe = {
		{"base:darwin_woollybutt_tree"}
	}
})

minetest.register_craft({
	output = "base:acacia_wood 4",
	recipe = {
		{"base:desert_oak_tree"}
	}
})

minetest.register_craft({
	output = "base:huon_pine 4",
	recipe = {
		{"base:huon_pine_tree"}
	}
})

minetest.register_craft({
	output = "base:wood 4",
	recipe = {
		{"base:illawarra_flame_tree"}
	}
})

minetest.register_craft({
	output = "base:jarrah 4",
	recipe = {
		{"base:jarrah_tree"}
	}
})

minetest.register_craft({
	output = "base:karri 4",
	recipe = {
		{"base:karri_tree"}
	}
})

minetest.register_craft({
	output = "base:eucalyptus_wood 4",
	recipe = {
		{"base:lemon_eucalyptus_tree"}
	}
})

minetest.register_craft({
	output = "base:wood 4",
	recipe = {
		{"base:macadamia_tree"}
	}
})

minetest.register_craft({
	output = "base:marri 4",
	recipe = {
		{"base:marri_tree"}
	}
})

minetest.register_craft({
	output = "base:merbau 4",
	recipe = {
		{"base:merbau_tree"}
	}
})

minetest.register_craft({
	output = "base:wood 4",
	recipe = {
		{"base:moreton_bay_fig_tree"}
	}
})

minetest.register_craft({
	output = "base:acacia_wood 4",
	recipe = {
		{"base:mulga_tree"}
	}
})

minetest.register_craft({
	output = "base:acacia_wood 4",
	recipe = {
		{"base:paperbark_tree"}
	}
})

minetest.register_craft({
	output = "base:acacia_wood 4",
	recipe = {
		{"base:river_oak_tree"}
	}
})

minetest.register_craft({
	output = "base:red_gum 4",
	recipe = {
		{"base:river_red_gum_tree"}
	}
})

minetest.register_craft({
	output = "base:pine_wood 4",
	recipe = {
		{"base:rottnest_island_pine_tree"}
	}
})

minetest.register_craft({
	output = "base:eucalyptus_wood 4",
	recipe = {
		{"base:scribbly_gum_tree"}
	}
})

minetest.register_craft({
	output = "base:acacia_wood 4",
	recipe = {
		{"base:shoestring_acacia_tree"}
	}
})

minetest.register_craft({
	output = "base:eucalyptus_wood 4",
	recipe = {
		{"base:snow_gum_tree"}
	}
})

minetest.register_craft({
	output = "base:southern_sassafras 4",
	recipe = {
		{"base:southern_sassafras_tree"}
	}
})

minetest.register_craft({
	output = "base:eucalyptus_wood 4",
	recipe = {
		{"base:sugar_gum_tree"}
	}
})

minetest.register_craft({
	output = "base:eucalyptus_wood 4",
	recipe = {
		{"base:swamp_bloodwood_tree"}
	}
})

minetest.register_craft({
	output = "base:tasmanian_oak 4",
	recipe = {
		{"base:swamp_gum_tree"}
	}
})

minetest.register_craft({
	output = "base:tasmanian_myrtle 4",
	recipe = {
		{"base:tasmanian_myrtle_tree"}
	}
})

minetest.register_craft({
	output = "base:eucalyptus_wood 4",
	recipe = {
		{"base:white_box_tree"}
	}
})

minetest.register_craft({
	output = 'base:wood',
	recipe = {
		{'base:bush_stem'},
	}
})

minetest.register_craft({
	output = 'base:acacia_wood',
	recipe = {
		{'base:acacia_bush_stem'},
	}
})

minetest.register_craft({
	output = 'base:stick 4',
	recipe = {
		{'group:wood'},
	}
})

minetest.register_craft({
	output = 'base:sign_wall_steel 3',
	recipe = {
		{'base:steel_ingot', 'base:steel_ingot', 'base:steel_ingot'},
		{'base:steel_ingot', 'base:steel_ingot', 'base:steel_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'base:sign_wall_wood 3',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'base:coalblock',
	recipe = {
		{'base:coal_lump', 'base:coal_lump', 'base:coal_lump'},
		{'base:coal_lump', 'base:coal_lump', 'base:coal_lump'},
		{'base:coal_lump', 'base:coal_lump', 'base:coal_lump'},
	}
})

minetest.register_craft({
	output = 'base:coal_lump 9',
	recipe = {
		{'base:coalblock'},
	}
})

minetest.register_craft({
	output = 'base:steelblock',
	recipe = {
		{'base:steel_ingot', 'base:steel_ingot', 'base:steel_ingot'},
		{'base:steel_ingot', 'base:steel_ingot', 'base:steel_ingot'},
		{'base:steel_ingot', 'base:steel_ingot', 'base:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'base:steel_ingot 9',
	recipe = {
		{'base:steelblock'},
	}
})

minetest.register_craft({
	output = 'base:copperblock',
	recipe = {
		{'base:copper_ingot', 'base:copper_ingot', 'base:copper_ingot'},
		{'base:copper_ingot', 'base:copper_ingot', 'base:copper_ingot'},
		{'base:copper_ingot', 'base:copper_ingot', 'base:copper_ingot'},
	}
})

minetest.register_craft({
	output = 'base:copper_ingot 9',
	recipe = {
		{'base:copperblock'},
	}
})

minetest.register_craft({
	output = "base:tinblock",
	recipe = {
		{"base:tin_ingot", "base:tin_ingot", "base:tin_ingot"},
		{"base:tin_ingot", "base:tin_ingot", "base:tin_ingot"},
		{"base:tin_ingot", "base:tin_ingot", "base:tin_ingot"},
	}
})

minetest.register_craft({
	output = "base:tin_ingot 9",
	recipe = {
		{"base:tinblock"},
	}
})

minetest.register_craft({
	output = "base:bronze_ingot 9",
	recipe = {
		{"base:copper_ingot", "base:copper_ingot", "base:copper_ingot"},
		{"base:copper_ingot", "base:tin_ingot", "base:copper_ingot"},
		{"base:copper_ingot", "base:copper_ingot", "base:copper_ingot"},
	}
})

minetest.register_craft({
	output = 'base:bronzeblock',
	recipe = {
		{'base:bronze_ingot', 'base:bronze_ingot', 'base:bronze_ingot'},
		{'base:bronze_ingot', 'base:bronze_ingot', 'base:bronze_ingot'},
		{'base:bronze_ingot', 'base:bronze_ingot', 'base:bronze_ingot'},
	}
})

minetest.register_craft({
	output = 'base:bronze_ingot 9',
	recipe = {
		{'base:bronzeblock'},
	}
})

minetest.register_craft({
	output = 'base:goldblock',
	recipe = {
		{'base:gold_ingot', 'base:gold_ingot', 'base:gold_ingot'},
		{'base:gold_ingot', 'base:gold_ingot', 'base:gold_ingot'},
		{'base:gold_ingot', 'base:gold_ingot', 'base:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'base:gold_ingot 9',
	recipe = {
		{'base:goldblock'},
	}
})

minetest.register_craft({
	output = 'base:diamondblock',
	recipe = {
		{'base:diamond', 'base:diamond', 'base:diamond'},
		{'base:diamond', 'base:diamond', 'base:diamond'},
		{'base:diamond', 'base:diamond', 'base:diamond'},
	}
})

minetest.register_craft({
	output = 'base:diamond 9',
	recipe = {
		{'base:diamondblock'},
	}
})

minetest.register_craft({
	output = "base:sandstone",
	recipe = {
		{"base:sand", "base:sand"},
		{"base:sand", "base:sand"},
	}
})

minetest.register_craft({
	output = "base:sand 4",
	recipe = {
		{"base:sandstone"},
	}
})

minetest.register_craft({
	output = "base:sandstonebrick 4",
	recipe = {
		{"base:sandstone", "base:sandstone"},
		{"base:sandstone", "base:sandstone"},
	}
})

minetest.register_craft({
	output = "base:sandstone_block 9",
	recipe = {
		{"base:sandstone", "base:sandstone", "base:sandstone"},
		{"base:sandstone", "base:sandstone", "base:sandstone"},
		{"base:sandstone", "base:sandstone", "base:sandstone"},
	}
})

minetest.register_craft({
	output = "base:desert_sandstone",
	recipe = {
		{"base:desert_sand", "base:desert_sand"},
		{"base:desert_sand", "base:desert_sand"},
	}
})

minetest.register_craft({
	output = "base:desert_sand 4",
	recipe = {
		{"base:desert_sandstone"},
	}
})

minetest.register_craft({
	output = "base:desert_sandstone_brick 4",
	recipe = {
		{"base:desert_sandstone", "base:desert_sandstone"},
		{"base:desert_sandstone", "base:desert_sandstone"},
	}
})

minetest.register_craft({
	output = "base:desert_sandstone_block 9",
	recipe = {
		{"base:desert_sandstone", "base:desert_sandstone", "base:desert_sandstone"},
		{"base:desert_sandstone", "base:desert_sandstone", "base:desert_sandstone"},
		{"base:desert_sandstone", "base:desert_sandstone", "base:desert_sandstone"},
	}
})

minetest.register_craft({
	output = "base:silver_sandstone",
	recipe = {
		{"base:silver_sand", "base:silver_sand"},
		{"base:silver_sand", "base:silver_sand"},
	}
})

minetest.register_craft({
	output = "base:silver_sand 4",
	recipe = {
		{"base:silver_sandstone"},
	}
})

minetest.register_craft({
	output = "base:silver_sandstone_brick 4",
	recipe = {
		{"base:silver_sandstone", "base:silver_sandstone"},
		{"base:silver_sandstone", "base:silver_sandstone"},
	}
})

minetest.register_craft({
	output = "base:silver_sandstone_block 9",
	recipe = {
		{"base:silver_sandstone", "base:silver_sandstone", "base:silver_sandstone"},
		{"base:silver_sandstone", "base:silver_sandstone", "base:silver_sandstone"},
		{"base:silver_sandstone", "base:silver_sandstone", "base:silver_sandstone"},
	}
})

minetest.register_craft({
	output = 'base:clay',
	recipe = {
		{'base:clay_lump', 'base:clay_lump'},
		{'base:clay_lump', 'base:clay_lump'},
	}
})

minetest.register_craft({
	output = 'base:clay_lump 4',
	recipe = {
		{'base:clay'},
	}
})

minetest.register_craft({
	output = 'base:brick',
	recipe = {
		{'base:clay_brick', 'base:clay_brick'},
		{'base:clay_brick', 'base:clay_brick'},
	}
})

minetest.register_craft({
	output = 'base:clay_brick 4',
	recipe = {
		{'base:brick'},
	}
})

minetest.register_craft({
	output = 'base:paper',
	recipe = {
		{'base:papyrus', 'base:papyrus', 'base:papyrus'},
	}
})

minetest.register_craft({
	output = "base:ladder_wood 5",
	recipe = {
		{"group:stick", "", "group:stick"},
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "", "group:stick"},
	}
})

minetest.register_craft({
	output = 'base:ladder_steel 15',
	recipe = {
		{'base:steel_ingot', '', 'base:steel_ingot'},
		{'base:steel_ingot', 'base:steel_ingot', 'base:steel_ingot'},
		{'base:steel_ingot', '', 'base:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'base:mese',
	recipe = {
		{'base:mese_crystal', 'base:mese_crystal', 'base:mese_crystal'},
		{'base:mese_crystal', 'base:mese_crystal', 'base:mese_crystal'},
		{'base:mese_crystal', 'base:mese_crystal', 'base:mese_crystal'},
	}
})

minetest.register_craft({
	output = 'base:mese_crystal 9',
	recipe = {
		{'base:mese'},
	}
})

minetest.register_craft({
	output = 'base:mese_crystal_fragment 9',
	recipe = {
		{'base:mese_crystal'},
	}
})

minetest.register_craft({
	output = "base:mese_crystal",
	recipe = {
		{"base:mese_crystal_fragment", "base:mese_crystal_fragment", "base:mese_crystal_fragment"},
		{"base:mese_crystal_fragment", "base:mese_crystal_fragment", "base:mese_crystal_fragment"},
		{"base:mese_crystal_fragment", "base:mese_crystal_fragment", "base:mese_crystal_fragment"},
	}
})

minetest.register_craft({
	output = 'base:meselamp',
	recipe = {
		{'base:glass'},
		{'base:mese_crystal'},
	}
})

minetest.register_craft({
	output = "base:mese_post_light 3",
	recipe = {
		{"", "base:glass", ""},
		{"base:mese_crystal", "base:mese_crystal", "base:mese_crystal"},
		{"", "group:wood", ""},
	}
})

minetest.register_craft({
	output = 'base:obsidian_shard 9',
	recipe = {
		{'base:obsidian'}
	}
})

minetest.register_craft({
	output = 'base:obsidian',
	recipe = {
		{'base:obsidian_shard', 'base:obsidian_shard', 'base:obsidian_shard'},
		{'base:obsidian_shard', 'base:obsidian_shard', 'base:obsidian_shard'},
		{'base:obsidian_shard', 'base:obsidian_shard', 'base:obsidian_shard'},
	}
})

minetest.register_craft({
	output = 'base:obsidianbrick 4',
	recipe = {
		{'base:obsidian', 'base:obsidian'},
		{'base:obsidian', 'base:obsidian'}
	}
})

minetest.register_craft({
	output = 'base:obsidian_block 9',
	recipe = {
		{'base:obsidian', 'base:obsidian', 'base:obsidian'},
		{'base:obsidian', 'base:obsidian', 'base:obsidian'},
		{'base:obsidian', 'base:obsidian', 'base:obsidian'},
	}
})

minetest.register_craft({
	output = 'base:stonebrick 4',
	recipe = {
		{'base:stone', 'base:stone'},
		{'base:stone', 'base:stone'},
	}
})

minetest.register_craft({
	output = 'base:stone_block 9',
	recipe = {
		{'base:stone', 'base:stone', 'base:stone'},
		{'base:stone', 'base:stone', 'base:stone'},
		{'base:stone', 'base:stone', 'base:stone'},
	}
})

minetest.register_craft({
	output = 'base:desert_stonebrick 4',
	recipe = {
		{'base:desert_stone', 'base:desert_stone'},
		{'base:desert_stone', 'base:desert_stone'},
	}
})

minetest.register_craft({
	output = 'base:desert_stone_block 9',
	recipe = {
		{'base:desert_stone', 'base:desert_stone', 'base:desert_stone'},
		{'base:desert_stone', 'base:desert_stone', 'base:desert_stone'},
		{'base:desert_stone', 'base:desert_stone', 'base:desert_stone'},
	}
})

minetest.register_craft({
	output = 'base:snowblock',
	recipe = {
		{'base:snow', 'base:snow', 'base:snow'},
		{'base:snow', 'base:snow', 'base:snow'},
		{'base:snow', 'base:snow', 'base:snow'},
	}
})

minetest.register_craft({
	output = 'base:snow 9',
	recipe = {
		{'base:snowblock'},
	}
})

minetest.register_craft({
	output = "base:salt_block",
	recipe = {
		{"base:salt", "base:salt", "base:salt"},
		{"base:salt", "base:salt", "base:salt"},
		{"base:salt", "base:salt", "base:salt"},
	}
})

minetest.register_craft({
	output = "base:salt 9",
	recipe = {
		{"base:salt_block"},
	}
})

minetest.register_craft({
	output = "base:red_stonebrick 4",
	recipe = {
		{"base:red_stone", "base:red_stone"},
		{"base:red_stone", "base:red_stone"},
	}
})

minetest.register_craft({
	output = "base:bluestone_brick 4",
	recipe = {
		{"base:bluestone", "base:bluestone"},
		{"base:bluestone", "base:bluestone"},
	}
})

-- Small rocks can be used to create cobblestone.
minetest.register_craft({
	output = "base:red_cobble",
	recipe = {
		{"", "", ""},
		{"base:small_red_rocks", "base:small_red_rocks", ""},
		{"base:small_red_rocks", "base:small_red_rocks", ""},
	}
})

minetest.register_craft({
	output = "base:sandstone_cobble",
	recipe = {
		{"", "", ""},
		{"base:small_sandstone_rocks", "base:small_sandstone_rocks", ""},
		{"base:small_sandstone_rocks", "base:small_sandstone_rocks", ""},
	}
})

minetest.register_craft({
	output = "base:cobble",
	recipe = {
		{"", "", ""},
		{"base:small_stone_rocks", "base:small_stone_rocks", ""},
		{"base:small_stone_rocks", "base:small_stone_rocks", ""},
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
	output = "base:glass",
	recipe = "group:sand",
})

minetest.register_craft({
	type = "cooking",
	output = "base:obsidian_glass",
	recipe = "base:obsidian_shard",
})

minetest.register_craft({
	type = "cooking",
	output = "base:stone",
	recipe = "base:cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "base:stone",
	recipe = "base:mossycobble",
})

minetest.register_craft({
	type = "cooking",
	output = "base:desert_stone",
	recipe = "base:desert_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "base:steel_ingot",
	recipe = "base:iron_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "base:copper_ingot",
	recipe = "base:copper_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "base:tin_ingot",
	recipe = "base:tin_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "base:gold_ingot",
	recipe = "base:gold_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "base:clay_brick",
	recipe = "base:clay_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "base:bluestone",
	recipe = "base:bluestone_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "base:red_stone",
	recipe = "base:red_cobble",
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
	recipe = "base:aspen_tree",
	burntime = 22,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:pine_tree",
	burntime = 26,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:tree",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:acacia_tree",
	burntime = 34,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:jungletree",
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
	recipe = "base:aspen_wood",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:pine_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:acacia_wood",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:junglewood",
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
	recipe = "base:bush_sapling",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:acacia_bush_sapling",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:aspen_sapling",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:pine_sapling",
	burntime = 9,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:sapling",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:acacia_sapling",
	burntime = 11,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:junglesapling",
	burntime = 12,
})


minetest.register_craft({
	type = "fuel",
	recipe = "base:fence_aspen_wood",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:fence_pine_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:fence_wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:fence_acacia_wood",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:fence_junglewood",
	burntime = 9,
})


minetest.register_craft({
	type = "fuel",
	recipe = "base:bush_stem",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:acacia_bush_stem",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:junglegrass",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:leaves",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:cactus",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:papyrus",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:ladder_wood",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:lava_source",
	burntime = 60,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:apple",
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:coal_lump",
	burntime = 40,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:coalblock",
	burntime = 370,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:grass_1",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:dry_grass_1",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:paper",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "base:dry_shrub",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:stick",
	burntime = 1,
})

