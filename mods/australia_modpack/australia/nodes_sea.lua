-- mods/australia/nodes_sea.lua

-- Localize math routines for performance.
local math_random = math.random


minetest.register_node("australia:stone_kelp_brown", {
	description = "Sea stone",
	tiles = {"aus_coral_stone.png"},
	is_ground_content = true,
	groups = {cracky = 3, stone = 1, not_in_creative_inventory = 1},
	drop = 'default:stone',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("australia:stone_kelp_giant_brown", {
	description = "Sea stone",
	tiles = {"aus_coral_stone.png"},
	is_ground_content = true,
	groups = {cracky = 3, stone = 1, not_in_creative_inventory = 1},
	drop = 'default:stone',
	sounds = default.node_sound_stone_defaults(),
})

-- Common Kelp
minetest.register_node("australia:kelp_brown", {
	description = "Common Kelp",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"aus_kelp_brown.png"},
	inventory_image = "aus_kelp_brown.png",
	wield_image = "aus_kelp_brown.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	climable = true,
	drowning = 1,
	is_ground_content = true,
	groups = {snappy=3,seaplants=1,sea=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5},
	},
})

-- Giant Kelp
minetest.register_node("australia:kelp_giant_brown", {
	description = "Giant Kelp",
	drawtype = "plantlike",
	tiles = {"aus_kelp_giant_brown.png"},
	inventory_image = "aus_kelp_giant_brown.png",
	wield_image = "aus_kelp_giant_brown.png",
	paramtype = "light",
	walkable = false,
	climbable = true,
	drowning = 1,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3},
	},
	post_effect_color = {a=64, r=100, g=100, b=200},
	groups = {snappy = 3, seaplants = 1, sea = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_use = minetest.item_eat(1)
})

minetest.register_node("australia:kelp_giant_brown_middle", {
	description = "Giant Kelp middle",
	drawtype = "plantlike",
	tiles = {"aus_kelp_giant_brown_middle.png"},
	inventory_image = "aus_kelp_giant_brown_middle.png",
	wield_image = "aus_kelp_giant_brown_middle.png",
	paramtype = "light",
	walkable = false,
	climbable = true,
	drowning = 1,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
	},
	post_effect_color = {a=64, r=100, g=100, b=200},
	groups = {snappy = 3, seaplants = 1, sea = 1},
	drop = "australia:kelp_giant_brown",
	sounds = default.node_sound_leaves_defaults(),
})

-- Narrowleaf Seagrass
minetest.register_node("australia:sea_grass", {
	description = "Narrowleaf Seagrass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"aus_sea_grass.png"},
	inventory_image = {"aus_sea_grass.png"},
	wield_image = {"aus_sea_grass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	climable = true,
	buildable_to = false,
	drowning = 1,
	is_ground_content = true,
	groups = {snappy = 3, attached_node = 1, sea = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5},
	},
})

minetest.register_node("australia:woodship", {
	description = "Sand for the wooden ship",
	tiles = {"default_sand.png"},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1, sand=1, soil=1, not_in_creative_inventory=1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("australia:submarine", {
	description = "Dirt for the submarine",
	tiles = {"default_dirt.png"},
	is_ground_content = true,
	groups = {crumbly=3,soil=1, not_in_creative_inventory=1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("australia:woodshipchest", {
	description = "Wooden ship chest",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"},
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2, not_in_creative_inventory=1},
	drop = 'default:chest',
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
			"size[8,9]"..
			"list[current_name;main;0,0;8,4;]"..
			"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Woodship chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	local contents = {}
	if math_random(1,100) <= 25 then
		contents = {main = {[1] = "default:coal_lump 36"}}
	elseif math_random(1,100) >= 26 or math_random(1,100) <= 40 then
		contents = {main = {[1] = "default:iron_lump 24"}}
	elseif math_random(1,100) >= 41 or math_random(1,100) <= 45 then
		contents = {main = {[1] = "default:gold_lump 24"}}
	elseif math_random(1,100) >= 46 or math_random(1,100) <= 50 then
		contents = {main = {[1] = "default:diamond 24"}}
	elseif math_random(1,100) >= 51 or math_random(1,100) <= 60 then
		contents = {main = {[1] = "australia:huon_pine_tree 18"}}
	elseif math_random(1,100) >= 61 or math_random(1,100) <= 70 then
		contents = {main = {[1] = "australia:jarrah_tree 18"}}
	elseif math_random(1,100) >= 71 or math_random(1,100) <= 80 then
		contents = {main = {[1] = "australia:marri_tree 18"}}
	elseif math_random(1,100) >= 81 or math_random(1,100) <= 90 then
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
	description = "U-boot chest",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"},
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2, not_in_creative_inventory=1},
	drop = 'default:chest',
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
			"size[8,9]"..
			"list[current_name;main;0,0;8,4;]"..
			"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "U-boot chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	local contents = {}
	if math_random(1,2) == 1 and minetest.get_modpath("technic_worldgen") then
		contents = {main = {[1] = "technic:mineral_uranium 18", [2] = "default:sword_steel 2"}}
	else
		contents = {main = {[1] = "tnt:tnt 3", [2] = "default:sword_steel 2"}}
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

