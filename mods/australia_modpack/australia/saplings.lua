--
-- Grow trees from saplings
--

-- Sapling ABM

minetest.register_abm({
	nodenames = {
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
		"australia:white_box_sapling",
		"australia:wirewood_sapling"},
	interval = 5,
	chance = 90,
	action = function(pos, node)
		if not default.can_grow(pos) then
			return
		end

		if node.name == "australia:arnhem_cypress_pine_sapling" then
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
			minetest.log("action", "A Flame Grevillea sapling grows into a tree at "..
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
			minetest.log("action", "A Red Bottlebrush sapling grows into a tree at "..
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
})
