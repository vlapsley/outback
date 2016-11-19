-- mods/australia/crafting.lua


-- Small rocks can be used to create cobblestone.
minetest.register_craft({
	output = "australia:red_cobble",
	recipe = {
		{"", "", ""},
		{"australia:small_red_rocks", "australia:small_red_rocks", ""},
		{"australia:small_red_rocks", "australia:small_red_rocks", ""},
	}
})

minetest.register_craft({
	output = "australia:sandstone_cobble",
	recipe = {
		{"", "", ""},
		{"australia:small_sandstone_rocks", "australia:small_sandstone_rocks", ""},
		{"australia:small_sandstone_rocks", "australia:small_sandstone_rocks", ""},
	}
})

minetest.register_craft({
	output = "default:cobble",
	recipe = {
		{"", "", ""},
		{"australia:small_stone_rocks", "australia:small_stone_rocks", ""},
		{"australia:small_stone_rocks", "australia:small_stone_rocks", ""},
	}
})

minetest.register_craft({
	output = 'australia:red_stonebrick 4',
	recipe = {
		{'australia:red_stone', 'australia:red_stone'},
		{'australia:red_stone', 'australia:red_stone'},
	}
})

minetest.register_craft({
	output = 'australia:bluestone_brick 4',
	recipe = {
		{'australia:bluestone', 'australia:bluestone'},
		{'australia:bluestone', 'australia:bluestone'},
	}
})

minetest.register_craft({
	output = 'australia:salt_block',
	recipe = {
		{'australia:salt', 'australia:salt', 'australia:salt'},
		{'australia:salt', 'australia:salt', 'australia:salt'},
		{'australia:salt', 'australia:salt', 'australia:salt'},
	}
})

minetest.register_craft({
	output = 'australia:salt 9',
	recipe = {
		{'australia:salt_block'},
	}
})

--
-- Fences
--

-- Eucalyptus Wood
minetest.register_craft({
	output = "australia:fence_eucalyptus_wood 4",
	recipe = {
		{"australia:eucalyptus_wood", "group:stick", "australia:eucalyptus_wood"},
		{"australia:eucalyptus_wood", "group:stick", "australia:eucalyptus_wood"},
	}
})

-- Blackwood
minetest.register_craft({
	output = "australia:fence_blackwood 4",
	recipe = {
		{"australia:blackwood", "group:stick", "australia:blackwood"},
		{"australia:blackwood", "group:stick", "australia:blackwood"},
	}
})

-- Blue Gum
minetest.register_craft({
	output = "australia:fence_blue_gum 4",
	recipe = {
		{"australia:blue_gum", "group:stick", "australia:blue_gum"},
		{"australia:blue_gum", "group:stick", "australia:blue_gum"},
	}
})

-- Celery-top Pine
minetest.register_craft({
	output = "australia:fence_celery_top_pine 4",
	recipe = {
		{"australia:celery_top_pine", "group:stick", "australia:celery_top_pine"},
		{"australia:celery_top_pine", "group:stick", "australia:celery_top_pine"},
	}
})

-- Red Mahogany
minetest.register_craft({
	output = "australia:fence_red_mahogany 4",
	recipe = {
		{"australia:red_mahogany", "group:stick", "australia:red_mahogany"},
		{"australia:red_mahogany", "group:stick", "australia:red_mahogany"},
	}
})

-- Huon Pine
minetest.register_craft({
	output = "australia:fence_huon_pine 4",
	recipe = {
		{"australia:huon_pine", "group:stick", "australia:huon_pine"},
		{"australia:huon_pine", "group:stick", "australia:huon_pine"},
	}
})

-- Jarrah
minetest.register_craft({
	output = "australia:fence_jarrah 4",
	recipe = {
		{"australia:jarrah", "group:stick", "australia:jarrah"},
		{"australia:jarrah", "group:stick", "australia:jarrah"},
	}
})

-- Karri
minetest.register_craft({
	output = "australia:fence_karri 4",
	recipe = {
		{"australia:karri", "group:stick", "australia:karri"},
		{"australia:karri", "group:stick", "australia:karri"},
	}
})

-- Marri
minetest.register_craft({
	output = "australia:fence_marri 4",
	recipe = {
		{"australia:marri", "group:stick", "australia:marri"},
		{"australia:marri", "group:stick", "australia:marri"},
	}
})

-- Merbau
minetest.register_craft({
	output = "australia:fence_merbau 4",
	recipe = {
		{"australia:merbau", "group:stick", "australia:merbau"},
		{"australia:merbau", "group:stick", "australia:merbau"},
	}
})

-- Red Gum
minetest.register_craft({
	output = "australia:fence_red_gum 4",
	recipe = {
		{"australia:red_gum", "group:stick", "australia:red_gum"},
		{"australia:red_gum", "group:stick", "australia:red_gum"},
	}
})

-- Southern Sassafras
minetest.register_craft({
	output = "australia:fence_southern_sassafras 4",
	recipe = {
		{"australia:southern_sassafras", "group:stick", "australia:southern_sassafras"},
		{"australia:southern_sassafras", "group:stick", "australia:southern_sassafras"},
	}
})

-- Tasmanian Oak
minetest.register_craft({
	output = "australia:fence_tasmanian_oak 4",
	recipe = {
		{"australia:tasmanian_oak", "group:stick", "australia:tasmanian_oak"},
		{"australia:tasmanian_oak", "group:stick", "australia:tasmanian_oak"},
	}
})

-- Tasmanian Myrtle
minetest.register_craft({
	output = "australia:fence_tasmanian_myrtle 4",
	recipe = {
		{"australia:tasmanian_myrtle", "group:stick", "australia:tasmanian_myrtle"},
		{"australia:tasmanian_myrtle", "group:stick", "australia:tasmanian_myrtle"},
	}
})



--
-- Timber
--

-- Arnhem Cypress Pine
minetest.register_craft({
	output = "default:pine_wood 4",
	recipe = {
		{"australia:arnhem_cypress_pine_tree"}
	}
})

-- Black Box
minetest.register_craft({
	output = "australia:eucalyptus_wood 4",
	recipe = {
		{"australia:black_box_tree"}
	}
})

-- Black Wattle
minetest.register_craft({
	output = "australia:blackwood 4",
	recipe = {
		{"australia:black_wattle_tree"}
	}
})

-- Blue Gum
minetest.register_craft({
	output = "australia:blue_gum 4",
	recipe = {
		{"australia:blue_gum_tree"}
	}
})

-- Boab Tree
minetest.register_craft({
	output = "default:wood 4",
	recipe = {
		{"australia:boab_tree"}
	}
})

-- Celery-top Pine
minetest.register_craft({
	output = "australia:celery_top_pine 4",
	recipe = {
		{"australia:celery_top_pine_tree"}
	}
})

-- Coast Banksia
minetest.register_craft({
	output = "default:acacia_wood 4",
	recipe = {
		{"australia:coast_banksia_tree"}
	}
})

-- Coolabah Tree
minetest.register_craft({
	output = "australia:eucalyptus_wood 4",
	recipe = {
		{"australia:coolabah_tree"}
	}
})

-- Daintree Stringybark
minetest.register_craft({
	output = "australia:red_mahogany 4",
	recipe = {
		{"australia:daintree_stringybark_tree"}
	}
})

-- Darwin Woollybutt
minetest.register_craft({
	output = "australia:eucalyptus_wood 4",
	recipe = {
		{"australia:darwin_woollybutt_tree"}
	}
})

-- Desert Oak
minetest.register_craft({
	output = "default:acacia_wood 4",
	recipe = {
		{"australia:desert_oak_tree"}
	}
})

-- Huon Pine
minetest.register_craft({
	output = "australia:huon_pine 4",
	recipe = {
		{"australia:huon_pine_tree"}
	}
})

-- Illawarra Flame Tree
minetest.register_craft({
	output = "default:wood 4",
	recipe = {
		{"australia:illawarra_flame_tree"}
	}
})

-- Jarrah
minetest.register_craft({
	output = "australia:jarrah 4",
	recipe = {
		{"australia:jarrah_tree"}
	}
})

-- Karri
minetest.register_craft({
	output = "australia:karri 4",
	recipe = {
		{"australia:karri_tree"}
	}
})

-- Lemon Eucalyptus
minetest.register_craft({
	output = "australia:eucalyptus_wood 4",
	recipe = {
		{"australia:lemon_eucalyptus_tree"}
	}
})

-- Macadamia Tree
minetest.register_craft({
	output = "default:wood 4",
	recipe = {
		{"australia:macadamia_tree"}
	}
})

-- Merbau Tree
minetest.register_craft({
	output = "australia:merbau 4",
	recipe = {
		{"australia:merbau_tree"}
	}
})

-- Marri
minetest.register_craft({
	output = "australia:marri 4",
	recipe = {
		{"australia:marri_tree"}
	}
})

-- Moreton Bay Fig Tree
minetest.register_craft({
	output = "default:wood 4",
	recipe = {
		{"australia:moreton_bay_fig_tree"}
	}
})

-- Mulga Tree
minetest.register_craft({
	output = "default:acacia_wood 4",
	recipe = {
		{"australia:mulga_tree"}
	}
})

-- Paperbark Tree
minetest.register_craft({
	output = "default:acacia_wood 4",
	recipe = {
		{"australia:paperbark_tree"}
	}
})

-- River Oak
minetest.register_craft({
	output = "default:acacia_wood 4",
	recipe = {
		{"australia:river_oak_tree"}
	}
})

-- River Red Gum
minetest.register_craft({
	output = "australia:red_gum 4",
	recipe = {
		{"australia:river_red_gum_tree"}
	}
})

-- Rottnest Island Pine Tree
minetest.register_craft({
	output = "default:pine_wood 4",
	recipe = {
		{"australia:rottnest_island_pine_tree"}
	}
})

-- Scribbly Gum
minetest.register_craft({
	output = "australia:eucalyptus_wood 4",
	recipe = {
		{"australia:scribbly_gum_tree"}
	}
})

-- Shoestring Acacia
minetest.register_craft({
	output = "default:acacia_wood 4",
	recipe = {
		{"australia:shoestring_acacia_tree"}
	}
})

-- Snow Gum
minetest.register_craft({
	output = "australia:eucalyptus_wood 4",
	recipe = {
		{"australia:snow_gum_tree"}
	}
})

-- Southern Sassafras
minetest.register_craft({
	output = "australia:southern_sassafras 4",
	recipe = {
		{"australia:southern_sassafras_tree"}
	}
})

-- Sugar Gum
minetest.register_craft({
	output = "australia:eucalyptus_wood 4",
	recipe = {
		{"australia:sugar_gum_tree"}
	}
})

-- Swamp Bloodwood
minetest.register_craft({
	output = "australia:eucalyptus_wood 4",
	recipe = {
		{"australia:swamp_bloodwood_tree"}
	}
})

-- Swamp Gum
minetest.register_craft({
	output = "australia:tasmanian_oak 4",
	recipe = {
		{"australia:swamp_gum_tree"}
	}
})

-- Tasmanian Myrtle
minetest.register_craft({
	output = "australia:tasmanian_myrtle 4",
	recipe = {
		{"australia:tasmanian_myrtle_tree"}
	}
})

-- White Box
minetest.register_craft({
	output = "australia:eucalyptus_wood 4",
	recipe = {
		{"australia:white_box_tree"}
	}
})



--
-- Cooking recipes
--

minetest.register_craft({
	type = "cooking",
	output = "australia:bluestone",
	recipe = "australia:bluestone_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "australia:red_stone",
	recipe = "australia:red_cobble",
})

