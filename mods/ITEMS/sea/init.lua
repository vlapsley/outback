--[[
	Sea
--]]


sea = {}

-- Localize math routines for performance.
local math_random = math.random


--
-- Corals
--

minetest.register_node("sea:coral_brown", {
	description = "Brown Coral",
	tiles = {"sea_coral_brown.png"},
	groups = {cracky = 3},
	drop = "sea:coral_skeleton",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("sea:coral_orange", {
	description = "Orange Coral",
	tiles = {"sea_coral_orange.png"},
	groups = {cracky = 3},
	drop = "sea:coral_skeleton",
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_node("sea:coral_skeleton", {
	description = "Coral Skeleton",
	tiles = {"sea_coral_skeleton.png"},
	groups = {cracky = 3},
	sounds = base.node_sound_stone_defaults(),
})

minetest.register_alias("default:coral_brown", "sea:coral_brown")
minetest.register_alias("default:coral_orange", "sea:coral_orange")
minetest.register_alias("default:coral_skeleton", "sea:coral_skeleton")

--
-- Coral death near air
--

minetest.register_abm({
	nodenames = {"sea:coral_brown", "sea:coral_orange"},
	neighbors = {"air"},
	interval = 17,
	chance = 5,
	catch_up = false,
	action = function(pos, node)
		minetest.set_node(pos, {name = "sea:coral_skeleton"})
	end,
})


-- Coral
minetest.register_decoration({
	deco_type =     "schematic",
	place_on =      {"base:sand"},
	noise_params =  {
		offset =   -0.015,
		scale =    0.1,
		spread =   {x = 100, y = 100, z = 100},
		seed =     7013,
		octaves =  3,
		persist =  1,
	},
	biomes =        {"great_barrier_reef"},
	y_min =         -12,
	y_max =         -2,
	schematic =     minetest.get_modpath("sea") .. "/schematics/corals.mts",
	flags =         "place_center_x, place_center_z",
	rotation =      "random",
})


minetest.register_node("sea:woodship", {
	description = "Sand",
	tiles = {"base_sand.png"},
	is_ground_content = true,
	groups = {crumbly = 3, falling_node = 1, sand = 1, soil = 1, not_in_creative_inventory = 1},
	sounds = base.node_sound_sand_defaults(),
})

minetest.register_node("sea:submarine", {
	description = "Dirt",
	tiles = {"base_dirt.png"},
	is_ground_content = true,
	groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
	sounds = base.node_sound_dirt_defaults(),
})

minetest.register_node("sea:woodshipchest", {
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
			contents = {main = {[1] = "base:huon_pine_tree 18"}}
		elseif math_random(1, 100) >= 61 or math_random(1, 100) <= 70 then
			contents = {main = {[1] = "base:jarrah_tree 18"}}
		elseif math_random(1, 100) >= 71 or math_random(1, 100) <= 80 then
			contents = {main = {[1] = "base:marri_tree 18"}}
		elseif math_random(1, 100) >= 81 or math_random(1, 100) <= 90 then
			contents = {main = {[1] = "base:merbau_tree 18"}}
		else
			contents = {main = {[1] = "base:river_red_gum_tree 18"}}
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

minetest.register_node("sea:submarinechest", {
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

function sea.place_woodship(pos)
	minetest.add_node(pos, {name = "base:sand"})

	pos.y = pos.y + 1
	pos.x = pos.x - 6
	for a = 1, 11 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:tree"})
	end

	pos.z = pos.z + 1
	pos.x = pos.x - 10
	for a = 1, 9 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:tree"})
	end

	pos.z = pos.z - 2
	pos.x = pos.x - 9
	for a = 1, 9 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:tree"})
	end

	pos.y = pos.y + 1
	pos.x = pos.x - 8
	pos.z = pos.z - 1
	for a = 1, 7 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:tree"})
	end

	pos.z = pos.z + 4
	pos.x = pos.x - 7
	for a = 1, 7 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:tree"})
	end

	pos.z = pos.z - 1
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:wood"})

	pos.z = pos.z - 1
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:wood"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:tree"})

	pos.z = pos.z - 1
	pos.x = pos.x - 2
	minetest.add_node(pos, {name = "base:tree"})

	pos.z = pos.z + 2
	pos.x = pos.x - 8
	minetest.add_node(pos, {name = "base:tree"})

	pos.z = pos.z - 1
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:tree"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:tree"})

	pos.z = pos.z - 1
	pos.x = pos.x + 2
	minetest.add_node(pos, {name = "base:tree"})


	pos.y = pos.y + 1
	pos.z = pos.z - 1
	for a = 1, 7 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:wood"})
	end

	pos.z = pos.z + 4
	pos.x = pos.x - 7
	for a = 1, 7 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:wood"})
	end

	pos.z = pos.z - 1
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:wood"})

	pos.z = pos.z - 1
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:wood"})

	pos.z = pos.z - 1
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:wood"})

	pos.z = pos.z + 2
	pos.x = pos.x - 8
	minetest.add_node(pos, {name = "base:wood"})

	pos.z = pos.z - 1
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:wood"})
	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:wood"})
	end

	pos.z = pos.z - 1
	pos.x = pos.x + 4
	minetest.add_node(pos, {name = "base:wood"})

	pos.z = pos.z + 1
	pos.x = pos.x + 3
	minetest.add_node(pos, {name = "base:wood"})

	pos.y = pos.y + 1
	minetest.add_node(pos, {name = "base:wood"})

	pos.y = pos.y - 2
	minetest.add_node(pos, {name = "base:wood"})

	pos.y = pos.y + 3
	pos.z = pos.z - 4
	for a = 1, 7 do
		pos.z = pos.z + 1
		minetest.add_node(pos, {name = "base:wood"})
	end

	pos.z = pos.z - 3
	for a = 1, 2 do
		pos.y = pos.y + 1
		minetest.add_node(pos, {name = "base:wood"})
	end

	pos.y = pos.y + 1
	pos.z = pos.z - 3
	for a = 1, 5 do
		pos.z = pos.z + 1
		minetest.add_node(pos, {name = "base:wood"})
	end

	pos.y = pos.y + 1
	pos.z = pos.z - 2
	minetest.add_node(pos, {name = "base:wood"})

	pos.y = pos.y - 7
	pos.z = pos.z + 1
	pos.x = pos.x - 2
	minetest.add_node(pos, {name = "sea:woodshipchest"})
end

function sea.place_submarine(pos)
	minetest.add_node(pos, {name = "base:dirt"})

	pos.y = pos.y + 1
	pos.x = pos.x - 15
	for a = 1, 31 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.z = pos.z + 1
	pos.x = pos.x + 1
	for a = 1, 31 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.z = pos.z + 1
	pos.x = pos.x +1
	for a = 1, 27 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.z = pos.z - 3
	pos.x = pos.x + 1
	for a = 1, 27 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.z = pos.z - 1
	pos.x = pos.x + 2
	for a = 1, 21 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.z = pos.z + 5
	pos.x = pos.x + 1
	for a = 1, 21 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.y = pos.y + 1
	pos.z = pos.z + 1
	pos.x = pos.x - 1
	for a = 1, 21 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.z = pos.z - 7
	pos.x = pos.x + 1
	for a = 1, 21 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.z = pos.z + 1
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 24
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.z = pos.z + 5
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 22
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.z = pos.z - 1
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 29
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.z = pos.z - 3
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 28
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.z = pos.z + 1
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 32
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.z = pos.z + 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 32
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.y = pos.y + 1
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.x = pos.x + 32
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.z = pos.z - 1
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.x = pos.x - 32
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.z = pos.z - 1
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.x = pos.x + 28
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.z = pos.z + 3
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.x = pos.x - 28
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.z = pos.z + 1
	pos.x = pos.x + 2
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:obsidian_glass"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.x = pos.x + 22
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:obsidian_glass"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.z = pos.z + 1
	pos.x = pos.x - 2
	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:obsidian_glass"})
	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:obsidian_glass"})
	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:obsidian_glass"})
	for a = 1, 9 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.z = pos.z - 6
	pos.x = pos.x - 3
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:obsidian_glass"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.x = pos.x + 22
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:obsidian_glass"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:steelblock"})

	pos.z = pos.z - 1
	pos.x = pos.x - 2
	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:obsidian_glass"})
	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:obsidian_glass"})
	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:obsidian_glass"})
	for a = 1, 9 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.y = pos.y + 1
	pos.z = pos.z + 7
	pos.x = pos.x - 1
	for a = 1, 21 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.z = pos.z - 7
	pos.x = pos.x + 1
	for a = 1, 21 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.z = pos.z + 1
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 24
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.z = pos.z + 5
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 22
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.z = pos.z - 1
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 29
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.z = pos.z - 3
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 28
	minetest.add_node(pos, {name = "base:copperblock"})
	
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.z = pos.z + 1
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 32
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.z = pos.z + 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 32
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.y = pos.y + 1
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 28
	minetest.add_node(pos, {name = "base:copperblock"})
	
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.z = pos.z - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 28
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.z = pos.z - 1
	pos.x = pos.x + 2
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 22
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.z = pos.z + 3
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 22
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})
	
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "base:copperblock"})

	pos.z = pos.z + 1
	pos.x = pos.x + 2
	for a = 1, 21 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.z = pos.z - 5
	pos.x = pos.x + 1
	for a = 1, 21 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.y = pos.y + 1
	pos.z = pos.z + 2
	pos.x = pos.x - 4
	for a = 1, 3 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.x = pos.x + 21
	for a = 1, 3 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.z = pos.z + 1
	pos.x = pos.x + 1
	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.x = pos.x - 21
	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.z = pos.z + 2
	pos.x = pos.x + 3
	for a = 1, 4 do
		pos.z = pos.z - 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.z = pos.z - 1
	pos.x = pos.x + 1
	for a = 1, 4 do
		pos.z = pos.z + 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.x = pos.x + 6
	for a = 1, 13 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.z = pos.z - 3
	pos.x = pos.x + 1
	for a = 1, 13 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:copperblock"})
	end

	pos.z = pos.z + 1
	pos.x = pos.x - 1
	for a = 1, 13 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:bronzeblock"})
	end

	pos.z = pos.z + 1
	pos.x = pos.x + 1
	for a = 1, 13 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:bronzeblock"})
	end

	pos.z = pos.z - 3
	for a = 1, 6 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.z = pos.z + 5
	pos.x = pos.x - 1
	for a = 1, 6 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.y = pos.y + 1
	for a = 1, 4 do
		pos.z = pos.z - 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.x = pos.x - 5
	pos.z = pos.z - 1
	for a = 1, 4 do
		pos.z = pos.z + 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	for a = 1, 4 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.x = pos.x + 1
	pos.z = pos.z - 3
	for a = 1, 4 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.y = pos.y + 1
	pos.x = pos.x - 1
	pos.z = pos.z - 1
	for a = 1, 4 do
		pos.z = pos.z + 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.x = pos.x + 5
	pos.z = pos.z + 1
	for a = 1, 4 do
		pos.z = pos.z - 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	for a = 1, 4 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.x = pos.x - 1
	pos.z = pos.z + 3
	for a = 1, 4 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.y = pos.y + 1
	pos.x = pos.x - 1
	pos.z = pos.z - 1
	for a = 1, 2 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.x = pos.x - 1
	pos.z = pos.z - 1
	for a = 1, 2 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "base:steelblock"})
	end

	pos.y = pos.y - 7
	pos.x = pos.x + 16
	pos.z = pos.z + 3
	minetest.add_node(pos, {name = "sea:submarinechest"})
end

