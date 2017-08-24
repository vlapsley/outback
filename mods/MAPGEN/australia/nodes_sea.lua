-- mods/australia_modpack/australia/nodes_sea.lua

-- Localize math routines for performance.
local math_random = math.random


minetest.register_node("australia:woodship", {
	description = "Sand",
	tiles = {"base_sand.png"},
	is_ground_content = true,
	groups = {crumbly = 3, falling_node = 1, sand = 1, soil = 1, not_in_creative_inventory = 1},
	sounds = base.node_sound_sand_defaults(),
})

minetest.register_node("australia:submarine", {
	description = "Dirt",
	tiles = {"base_dirt.png"},
	is_ground_content = true,
	groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
	sounds = base.node_sound_dirt_defaults(),
})

minetest.register_node("australia:woodshipchest", {
	description = "Wooden Ship Chest",
	tiles = {"chests_chest_top.png", "chests_chest_top.png", "chests_chest_side.png",
		"chests_chest_side.png", "chests_chest_side.png", "chests_chest_front.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, not_in_creative_inventory = 1},
	drop = "chests:chest",
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = base.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
			"size[8,9]"..
			"list[current_name;main;0,0;8,4;]"..
			"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Wooden Ship Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8 * 4)
	local contents = {}
	if math_random(1, 100) <= 25 then
		contents = {main = {[1] = "base:coal_lump 36"}}
	elseif math_random(1, 100) >= 26 or math_random(1, 100) <= 40 then
		contents = {main = {[1] = "base:iron_lump 24"}}
	elseif math_random(1, 100) >= 41 or math_random(1, 100) <= 45 then
		contents = {main = {[1] = "base:gold_lump 24"}}
	elseif math_random(1, 100) >= 46 or math_random(1, 100) <= 50 then
		contents = {main = {[1] = "base:diamond 24"}}
	elseif math_random(1, 100) >= 51 or math_random(1, 100) <= 60 then
		contents = {main = {[1] = "australia:huon_pine_tree 18"}}
	elseif math_random(1, 100) >= 61 or math_random(1, 100) <= 70 then
		contents = {main = {[1] = "australia:jarrah_tree 18"}}
	elseif math_random(1, 100) >= 71 or math_random(1, 100) <= 80 then
		contents = {main = {[1] = "australia:marri_tree 18"}}
	elseif math_random(1, 100) >= 81 or math_random(1, 100) <= 90 then
		contents = {main = {[1] = "australia:merbau_tree 18"}}
	else
		contents = {main = {[1] = "australia:river_red_gum_tree 18"}}
	end
meta:from_table({
	inventory = contents,
	fields = {
	formspec = "size[8,9;]list[context;main;0,0;8,4;]list[current_player;main;0,5;8,4;]",
	infotext = "Normal chest"
	}
})
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list,
			to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
})

minetest.register_node("australia:submarinechest", {
	description = "Submarine Chest",
	tiles = {"chests_chest_top.png", "chests_chest_top.png", "chests_chest_side.png",
		"chests_chest_side.png", "chests_chest_side.png", "chests_chest_front.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, not_in_creative_inventory = 1},
	drop = "chests:chest",
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = base.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
			"size[8,9]"..
			"list[current_name;main;0,0;8,4;]"..
			"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Submarine Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8 * 4)
	local contents = {}
	if math_random(1, 2) == 1 and minetest.get_modpath("technic_worldgen") then
		contents = {main = {[1] = "technic:mineral_uranium 18", [2] = "base:sword_steel 2"}}
	else
		contents = {main = {[1] = "tnt:tnt 3", [2] = "base:sword_steel 2"}}
	end
meta:from_table({
	inventory = contents,
	fields = {
	formspec = "size[8,9;]list[context;main;0,0;8,4;]list[current_player;main;0,5;8,4;]",
	infotext = "Normal chest"
	}
})
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list,
			to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
})
